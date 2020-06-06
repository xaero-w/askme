require 'openssl'

class User < ApplicationRecord

  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new
  FORMAT_EMAIL = /\A.+@.+\z/
  LETTERS_FOR_NAME = /^[A-z0-9_-]+$/

  attr_accessor :password
  has_many :questions

  #=========== Проверка формата ввода юзернейма, уникальности и его длинны.
  validates :username, length: { maximum: 40 }, presence: true, format: { with: LETTERS_FOR_NAME }
  validates :username, uniqueness: true

  #=========== Проверка уникальности почтового адреса.
  validates :email, presence: true, uniqueness: true, format: { with: FORMAT_EMAIL }

  #=========== Проверка наличия пароля.
  validates :password, presence: true, on: :create
  validates_confirmation_of :password

  #=========== Перевод юзернейма и почты в нижний регистр
  before_validation :lower_case_name
  before_validation :lower_case_email

  #=========== Обезличивание пароля
  before_save :encrypt_password

  def lower_case_name
    self.username = username.downcase
  end

  def lower_case_email
    self.email = email.downcase
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    return nil unless user.present?
    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )
    return user if user.password_hash == hashed_password
    nil
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))
      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end
end

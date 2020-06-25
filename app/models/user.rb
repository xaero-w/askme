require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20_000
  DIGEST = OpenSSL::Digest::SHA256.new
  FORMAT_EMAIL = /\A.+@.+\z/
  LETTERS_FOR_NAME = /\A[a-zA-Z0-9_-]+\z/

  attr_accessor :password
  has_many :questions

  validates :username, presence: true
  validates :username, length: { maximum: 40 }, format: { with: LETTERS_FOR_NAME }
  validates :email, presence: true
  validates :email, format: { with: FORMAT_EMAIL }
  validates :password, presence: true, confirmation: true, on: :create

  after_validation :lower_case_username
  after_validation :lower_case_email

  private
  def lower_case_username
    self.username = username&.downcase
  end

  def lower_case_email
    self.email = email&.downcase
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
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
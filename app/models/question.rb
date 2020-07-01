class Question < ApplicationRecord
  belongs_to :user
  belongs_to :author, class_name: 'User'

  validates :text, presence: true

  #===== поверка максимальной длины текста вопроса (максимум 255 символов)
  validates :text, length: { maximum: 255 }
end

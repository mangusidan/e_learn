class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :lesson_words
end

class Word < ApplicationRecord
  belongs_to :category
  has_many :word_answers
end

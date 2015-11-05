class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :user_guesses
  has_many :users, through: :user_guesses

  validates_presence_of :question, :answer
end

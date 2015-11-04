class User < ActiveRecord::Base
  has_many :decks
  has_many :user_guesses
  has_many :cards, through: :user_guesses
end

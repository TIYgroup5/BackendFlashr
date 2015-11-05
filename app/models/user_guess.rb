class UserGuess < ActiveRecord::Base
  belongs_to :user 
  belongs_to :card

  validates_presence_of :duration
  validates_presence_of :correct
end

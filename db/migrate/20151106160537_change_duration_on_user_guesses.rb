class ChangeDurationOnUserGuesses < ActiveRecord::Migration
  def change
    remove_column :user_guesses, :duration, :datetime
    add_column :user_guesses, :duration, :integer
  end
 
end

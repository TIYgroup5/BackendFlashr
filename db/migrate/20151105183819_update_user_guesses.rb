class UpdateUserGuesses < ActiveRecord::Migration
  def change
    change_column_null :user_guesses, :duration, true
    change_column_null :user_guesses, :correct, true
  end
end

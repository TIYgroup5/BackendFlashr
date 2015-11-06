class UpdateUserGuesses < ActiveRecord::Migration
  def change
    change_column :user_guesses, :duration, :integer
  end
end

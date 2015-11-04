class CreateUserGuesses < ActiveRecord::Migration
  def change
    create_table :user_guesses do |t|
      t.datetime :duration, null: false
      t.boolean :correct, null: false
      t.integer :user_id
      t.integer :card_id

      t.timestamps null: false
    end
  end
end

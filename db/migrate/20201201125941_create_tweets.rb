class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :message, null:false
      t.text :hashname, null:false
      t.integer :user_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end

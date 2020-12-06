class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.text :message, null:false
      t.text :hashname, null:false
      t.timestamps
    end
  end
end

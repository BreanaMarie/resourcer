class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :message_id
      t.text :content
      t.string :author
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :author
      t.integer :user_id
      t.integer :friendship_id
      t.text :body

      t.timestamps null: false
    end
  end
end

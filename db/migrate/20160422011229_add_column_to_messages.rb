class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :joburl, :string
    add_column :messages, :role, :string
  end
end

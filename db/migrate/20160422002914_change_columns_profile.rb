class ChangeColumnsProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :address, :role
    rename_column :profiles, :phone, :linkedin
  end
end

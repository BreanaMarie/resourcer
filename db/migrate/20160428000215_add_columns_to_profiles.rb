class AddColumnsToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :company, :string
    add_column :profiles, :department, :string
    add_column :profiles, :skills, :string
  end
end

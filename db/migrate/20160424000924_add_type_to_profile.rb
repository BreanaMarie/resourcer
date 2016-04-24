class AddTypeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :seeker, :string
  end
end

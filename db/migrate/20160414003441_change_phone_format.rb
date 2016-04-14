class ChangePhoneFormat < ActiveRecord::Migration
  def up
    change_column :profiles, :phone, :string
  end
  def down
    change_column :profiles, :phone, :integer
  end
end

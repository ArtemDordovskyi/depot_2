class RenameColumn < ActiveRecord::Migration
  def up
    rename_column :orders, :Name, :name
  end

  def down
  end
end

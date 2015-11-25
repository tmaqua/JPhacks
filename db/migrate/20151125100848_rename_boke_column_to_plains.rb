class RenameBokeColumnToPlains < ActiveRecord::Migration
  def change
    rename_column :plains, :boke, :boke_origin
    rename_column :plains, :tsukkomi, :tsukkomi_origin
  end
end

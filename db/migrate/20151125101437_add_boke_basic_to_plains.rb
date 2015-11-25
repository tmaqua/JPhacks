class AddBokeBasicToPlains < ActiveRecord::Migration
  def change
    add_column :plains, :boke_basic, :string
    add_column :plains, :tsukkomi_basic, :string
  end
end

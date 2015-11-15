class CreatePlains < ActiveRecord::Migration
  def change
    create_table :plains do |t|
      t.string :boke
      t.string :tsukkomi

      t.timestamps null: false
    end
  end
end

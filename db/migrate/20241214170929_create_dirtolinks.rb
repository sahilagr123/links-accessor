class CreateDirtolinks < ActiveRecord::Migration[7.1]
  def change
    create_table :dirtolinks do |t|
      t.integer :dir_id
      t.integer :link_id

      t.timestamps
    end
  end
end

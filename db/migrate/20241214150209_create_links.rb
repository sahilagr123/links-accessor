class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.integer :dir_id
      t.string :name
      t.string :link
      t.string :description
      t.integer :created_by
      t.integer :clicked_on

      t.timestamps
    end
  end
end

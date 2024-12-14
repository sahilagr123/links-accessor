class CreateDirectories < ActiveRecord::Migration[7.1]
  def change
    create_table :directories do |t|
      t.integer :user_id
      t.string :name
      t.datetime :created_on
      t.string :image_url

      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :thumb
      t.text :description
      t.references :user, foreign_key: true
      t.references :producttype, foreign_key: true

      t.timestamps
    end
  end
end

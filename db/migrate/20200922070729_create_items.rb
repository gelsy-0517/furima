class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      ## Database authenticatable
      t.string :name,                           null: false, index: true
      t.integer :price,                         null: false
      t.text :explanation,                      null: false
      t.references :category,                   null: false, foreign_key: true
      t.references :brand,                      null: false, foreign_key: true
      t.integer :size_id,                       null: false
      t.integer :state_id,                      null: false
      t.integer :shipping_charge_id,            null: false
      t.integer :shipping_date_id,              null: false
      t.integer :prefecture_id,                 null: false
      t.references :user,                       null: false, foreign_key: true
      t.timestamps
    end
  end
end
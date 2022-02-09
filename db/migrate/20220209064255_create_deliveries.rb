class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :post_code,        null: false
      t.integer :prefectures_id,  null: false
      t.string :municipalities,   null: false
      t.string :adress,           null: false
      t.string :building_name
      t.integer :tel_num,          null: false
      t.references :order,        null: false, foreign_key: true
      t.timestamps
    end
  end
end

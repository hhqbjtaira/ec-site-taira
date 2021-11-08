class CreateOrderDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :order_details do |t|
      t.references :products, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.references :shipment_status, null: false, foreign_key: true
      t.string :order_detail_number, :limit => 64
      t.integer :order_quantity
      t.datetime :shipment_date

      t.timestamps
    end
  end
end

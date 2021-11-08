class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user_id, null: false, foreign_key: true
      t.datetime :order_date
      t.string :order_number, :limit => 16

      t.timestamps
    end
  end
end

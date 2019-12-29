class CreatePurchaseOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_options do |t|
      t.decimal :price, null: false
      t.string :video_quality, null: false

      t.timestamps
    end
  end
end

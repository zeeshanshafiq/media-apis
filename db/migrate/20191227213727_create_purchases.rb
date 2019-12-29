class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references :purchase_option, null: false, foreign_key: true
      t.references :purchaseable, polymorphic: true, null: false
      t.references :user
      t.datetime :expire_at, null: false
      t.timestamps
    end
  end
end

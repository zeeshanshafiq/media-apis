class CreateSeasons < ActiveRecord::Migration[6.0]
  def change
    create_table :seasons do |t|
      t.string :title, null: false
      t.text :plot, null: false
      t.string :number, null: false

      t.timestamps
    end
  end
end

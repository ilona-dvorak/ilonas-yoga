class CreateYogaclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :yogaclasses do |t|
      t.string :price
      t.string :class_type
      t.string :address
      t.datetime :start_at
      t.float :duration
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

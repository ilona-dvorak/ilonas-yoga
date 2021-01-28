class AddDescriptionToYogaclasses < ActiveRecord::Migration[6.0]
  def change
    add_column :yogaclasses, :description, :text
  end
end

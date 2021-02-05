class AddCoordinatesToYogaclasses < ActiveRecord::Migration[6.0]
  def change
    add_column :yogaclasses, :latitude, :float
    add_column :yogaclasses, :longitude, :float
  end
end

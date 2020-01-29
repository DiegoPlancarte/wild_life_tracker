class CreateSightings < ActiveRecord::Migration[6.0]
  def change
    create_table :sightings do |t|
      t.string :lat
      t.string :long
      t.datetime :event
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end

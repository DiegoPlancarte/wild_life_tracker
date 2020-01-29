class Sighting < ApplicationRecord
  validates_presence_of :event, :lat, :long
  belongs_to :animal
end

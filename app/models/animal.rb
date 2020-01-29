class Animal < ApplicationRecord
  validates_presence_of :common_name, :latin_name, :kingdom
  validates_uniqueness_of :common_name
  validates_uniqueness_of :latin_name
  # validates_exclusion_of :common_name, :in => {:animal => :latin_name}
  validates_exclusion_of :common_name, { in: lambda{ |animal| [animal.latin_name] } }
  has_many :sightings
  accepts_nested_attributes_for :sightings
end

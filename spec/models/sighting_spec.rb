require 'rails_helper'

RSpec.describe Sighting, type: :model do

  it "requires long, lat, event" do
    expect { Sighting.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end
  
end

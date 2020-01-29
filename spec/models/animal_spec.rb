require 'rails_helper'

RSpec.describe Animal, type: :model do

  it "requires common_name, latin_name, kingdom" do
    expect { Animal.create! }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have unique common_name and latin_name" do
    animal = Animal.create!(common_name: 'xyz', latin_name: 'Liger', kingdom:'Cats')
    # animal2 = Animal.create!(common_name:'Tiger', latin_name:'Lion', kingdom:'Cats')
    # expect(animal2).to raise_error(ActiveRecord::RecordInvalid)
    expect { Animal.create!(common_name: 'Tiger', latin_name: 'Liger', kingdom:'Cats') }.to raise_error(ActiveRecord::RecordInvalid)
    expect { Animal.create!(common_name: 'xyz', latin_name: 'Tiger', kingdom:'Cats') }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "common_name and latin_name must not be the same" do
    expect{ Animal.create!(common_name:'Liger', latin_name:'Liger', kingdom:'Cats') }.to raise_error(ActiveRecord::RecordInvalid)
  end

end

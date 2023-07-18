require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#intialize" do 
    it "exists" do 
      new_vehicle = VehicleFactory.new

      expect(new_vehicle).to be_a VehicleFactory
    end
  end

  describe "create_vehicles" do
    it "can create new vehicles" do 
      factory_1 = VehicleFactory.new
      registrations = DmvDataService.new.wa_ev_registrations
      # created_registrations = factory_1.create_vehicles(registrations)
      #creating variable and assigning it to expect will give return value and not create two separate arrays
      factory_1.create_vehicles(registrations)
      # require 'pry';binding.pry
      created_registrations = factory_1.created_vehicles
      expect(created_registrations).to be_an Array
      expect(created_registrations.size).to eq(registrations.size) 
      expect(created_registrations).to all be_a Vehicle
    end
  end
end
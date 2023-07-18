require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#intialize" do 
    it "exists" do 
      new_vehicle = VehicleFactory.new

      expect(new_vehicle).to be_a VehicleFactory
    end
  end

  describe "new_vehicles" do
    it "can create new vehicles" do 
      factory_1 = VehicleFactory.new
      registrations = DmvDataService.new.wa_ev_registrations
      factory_1.create_vehicles(registrations)
      created_registrations = factory_1.created_vehicles
      
      expect(created_registrations).to be_an Array
      expect(created_registrations.size).to eq(registrations.size) 
      expect(created_registrations).to all be_a Vehicle
    end
  end
  
  describe "#popular_make_model" do 
    it "find the most popular make and model" do 
      factory_1 = VehicleFactory.new
      registrations = DmvDataService.new.wa_ev_registrations
      factory_1.create_vehicles(registrations)
      created_registrations = factory_1.created_vehicles
      # require 'pry';binding.pry
      expect(factory_1.popular_make_model(created_registrations)).to eq("NISSAN Leaf")
    end
  end
  
  describe "#popular_vehicles_model_year" do 
    it "can count the number of cars based on model year from registerd vehicles" do 
      factory_1 = VehicleFactory.new
      registrations = DmvDataService.new.wa_ev_registrations
      factory_1.create_vehicles(registrations)
      created_registrations = factory_1.created_vehicles
      # require 'pry';binding.pry
      expect(factory_1.popular_vehicles_model_year("2015")).to eq(57)
      expect(factory_1.popular_vehicles_model_year("2021")).to eq(113)
    end 
  end
end
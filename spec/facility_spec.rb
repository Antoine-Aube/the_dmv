require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#add service' do 
    it 'can add available services' do 
      @facility_1.add_service("Vehicle Registration")

      expect(@facility_1.services).to eq(["Vehicle Registration"])
    end
  end

  describe '#registered_vehicles' do 
    it "has no registered vehicles" do 
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do 
    it "has no collected fees" do 
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do 
    it "adds vehicle to registered vehicles" do
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)
      # require 'pry';binding.pry
      
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end
    
    it "sets registration date of vehicle registered" do 
      @facility_1.add_service("Vehicle Registration")
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today.year)
    end
  end
end

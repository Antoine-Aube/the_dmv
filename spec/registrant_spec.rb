require './lib/registrant'

RSpec.describe Registrant do 
  describe "#initialize" do 
    it "exists" do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      
      expect(registrant_1).to be_a Registrant
      expect(registrant_2).to be_a Registrant
    end
    
    it "has an age, name and permit" do 
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
      
      
      expect(registrant_1.name).to eq("Bruce")
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to eq(true)
      expect(registrant_2.name).to eq("Penny")
      expect(registrant_2.age).to eq(15)
      expect(registrant_2.permit?).to eq(false)
    end
    
    it "has liscense data" do 
      registrant_2 = Registrant.new('Penny', 15 )

      expect(license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end 
  end
end
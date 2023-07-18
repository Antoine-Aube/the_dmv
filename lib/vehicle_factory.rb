class VehicleFactory
  attr_reader :created_vehicles

  #not all classes need an initialize - State vs. behavior
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(data)
    data.each do |dmv_data|
      #iterate over each object in the DMV data set and pull
      #relevant value for corresponding keys and assign to keys in 
      #new vehicle objects.
      @created_vehicles << Vehicle.new({
        vin: dmv_data[:vin_1_10],
        year: dmv_data[:model_year],
        make: dmv_data[:make],
        model: dmv_data[:model],
        engine: :ev
       })
    end
    # @created_vehicles
  end

  def popular_make_model
    
  end
end
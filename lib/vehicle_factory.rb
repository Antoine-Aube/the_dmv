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

  def popular_make_model(vehicle_list)
    make_and_model_array = []
    vehicle_list.each do |vehicle|
      make_and_model = "#{vehicle.make} #{vehicle.model}"
      make_and_model_array << make_and_model
    end 
    #group_by = creates hash with unique key for each unique element in the array
    #with all occurences of that element in an array as the key value
    most_popular_as_hash = make_and_model_array.group_by do |make_model|
       make_model
    end 
    #.values returns an array of all the value arrays from the above hash
    #max_by(&:size) return the array with the largest size
    #(&:size)is equivalent to {|array| array.size}
    #.first returns the first element of that largest array (which is the
    #same as all the elements in the array, but produces a single string
    #for the purpose of this method)
    most_popular = most_popular_as_hash.values.max_by(&:size).first
  end

  def popular_vehicles_model_year(year)
    model_year_count = 0
    @created_vehicles.each do |vehicle|
      if vehicle.year == year
        model_year_count += 1
      end
    end
    model_year_count
  end
end
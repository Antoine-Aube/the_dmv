class FacilityFactory
    attr_reader :facilities_created

  def initialize
    @facilities_created = []    
  end

  def create_facilities(data)
    data.each do |dmv_data|
      @facilities_created << Facility.new({
      name: format_facility_name(dmv_data),
      address: format_facility_address(dmv_data),
      phone: format_facility_phone(dmv_data)
      })
    end 
  end

  def format_facility_name(data)
    if data[:state] == "CO"
      capitalize_string("#{data[:dmv_office]}")
    elsif data[:state] == "NY"
      capitalize_string("DMV " + "#{data[:office_name]} #{data[:office_type]}")
    else data[:state] == "MO"
      capitalize_string("DMV " + "#{data[:name]}")
    end
  end

  def format_facility_address(data)
    if data[:state] == "CO"
      #I know this line is a bit long!
      #I wanted the format to match the rest of my code
      capitalize_string("#{data[:address_li]}#{" " + "#{data[:address__1]}" if data[:address__1]} #{data[:city]} #{data[:state]} #{data[:zip]}")  
    elsif data[:state] == "NY"
      capitalize_string("#{data[:street_address_line_1]} #{data[:city]} #{data[:state]} #{data[:zip_code]}")
    else data[:state] == "MO"
      capitalize_string("#{data[:address1]} #{data[:city]} #{data[:state]} #{data[:zipcode]}")
    end
  end

  def format_facility_phone(data)
    if data[:state] == "CO"
      format_digits(data[:phone])
    elsif data[:state] == "NY"
      format_digits(data[:public_phone_number])
    else data[:state] == "MO"
      format_digits(data[:phone])
    end
  end

  def capitalize_string(string)
    omitted_words = ["NY", "MO", "DMV", "CO"]
    data_string = string.split.map do |word| 
      omitted_words.include?(word) ? word : word.capitalize
    end 
    data_string.join(" ")
  end

  def format_digits(phone_number)
    return "No phone number listed" if phone_number.nil?
    #regex - "D" represents removing any non-digit character
    #so removing any non digit character such as "-" and replacing with nothing 
    only_digits = phone_number.gsub(/\D/,'')
    formatted_digits = ("(" + only_digits[0, 3] + ") " + only_digits[3, 3] + "-" + only_digits[6, 4])
  end
end


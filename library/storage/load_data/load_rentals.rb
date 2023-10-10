module LoadRentals
  def load_rentals_from_json
    if File.exist?('rentals.json')
      File.read('rentals.json')
      Rental.rentals = JSON.parse(rantals_json, object_class: Rental)
    else
      Rental.rentals = []
    end
  end
end

require 'json'

module SaveRentals
  def save_rentals_to_json(data_dir)
    file_path = File.join(data_dir, 'rentals.json')
    rentals_json = Rental.rentals.map(&:to_json)
    File.write(file_path, JSON.generate(rentals_json))
  end
end

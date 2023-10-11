require 'json'

module SaveRentals
  def save_rentals_to_json(data_dir, rentals)
    file_path = File.join(data_dir, 'rentals.json')
    rentals_data = rentals.map(&:to_json)
    File.write(file_path, JSON.generate(rentals_data))
  end
end

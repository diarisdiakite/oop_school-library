module LoadRentals
  def load_rentals_from_json(data_dir)
    file_path = File.join(data_dir, 'rentals.json')
    if File.exist?(file_path)
      rentals_json = File.read(file_path)
      Rental.rentals = JSON.parse(rentals_json, object_class: Rental)
    else
      Rental.rentals = []
    end
  end
end

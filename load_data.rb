# Load data from JSON files
def load_data_from_json(data_dir, file_name, entity_class)
    file_path = File.join(data_dir, "#{file_name}.json")
    return [] unless File.exist?(file_path)
  
    data = JSON.parse(File.read(file_path))
    data.map { |item| entity_class.from_json(item) }
  end
  
  # Load books from JSON file
  def load_books_from_json(data_dir)
    load_data_from_json(data_dir, 'books', Book)
  end
  
  # Load people from JSON file
  def load_people_from_json(data_dir)
    load_data_from_json(data_dir, 'people', Person)
  end
  
  # Load rentals from JSON file
  def load_rentals_from_json(data_dir)
    load_data_from_json(data_dir, 'rentals', Rental)
  end
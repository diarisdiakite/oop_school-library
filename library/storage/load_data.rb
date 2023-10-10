require_relative 'load_data/load_books'
require_relative 'load_data/load_people'
require_relative 'load_data/load_rentals'

module LoadData
  include LoadBooks
  include LoadPeople
  include LoadRentals

  def load_data_from_json
    load_books_from_json
    load_people_from_json
    load_rentals_from_json
  end
end

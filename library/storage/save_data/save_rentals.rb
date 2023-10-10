module SaveRentals
  def save_rentals_to_json
    file.open('rentals.json', 'w') do |file|
      file.write(JSON.generate(Rental.rentals))
    end
  end
end
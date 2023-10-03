class Rental
  attr_accessor :date, :person, :book
  attr_reader :id

  def initialize(date, person, book)
    @id = generate_id
    @date = date

    @person = person
    person.rentals << self

    @book = book
    book.rentals << self
  end

  def generate_id
    rand(1_000_000)
  end
end

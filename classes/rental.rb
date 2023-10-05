class Rental
  attr_accessor :date, :book, :person
  attr_reader :id

  @rentals = []

  def initialize(date, book, person)
    @id = generate_id
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self

    self.class.rentals << self
  end

  def generate_id
    rand(1_000_000)
  end

  def self.add_a_rental(date, book, person)
    Rental.new(date, book, person)
    # @rentals.push(rental)
  end

  class << self
    attr_reader :rentals
  end

  def self.rentals_count
    @rentals.length
  end

  def self.list_all_rentals
    @rentals.each { |rental| puts "#{rental.date}: #{rental.book} rented to #{rental.person}" }
  end

  def self.select_a_rental(rental_to_select)
    selected_rental = @rentals.find { |rental| rental.id == rental_to_select }
    return selected_rental if selected_rental

    puts 'Rental not found'
  end
end

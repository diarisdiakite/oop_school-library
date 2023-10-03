class Book
  attr_accessor :title, :name, :author, :rentals
  attr_reader :id

  def initialize(title, author)
    @id = generate_id
    @title = title
    @author = author
    @rentals = []
  end

  def generate_id
    rand(1_000_000)
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end

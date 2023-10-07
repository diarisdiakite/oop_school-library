class Book
  attr_accessor :title, :name, :author, :rentals
  attr_reader :id

  @books = []

  def initialize(title, author)
    @id = generate_id
    @title = title
    @author = author
    @rentals = []
    self.class.books << self
  end

  def generate_id
    rand(1_000_000)
  end

  def self.add_a_book(title, author)
    Book.new(title, author)
  end

  def self.list_all_books
    @books.each { |book| puts "[#{book.id}] #{book.title} by #{book.author}" }
  end

  def self.select_a_book(selected_id)
    selected_book = @books.find { |book| book.id == selected_id }
    return selected_book if selected_book

    puts 'Book not found'
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  class << self
    attr_reader :books
  end

  def self.books_count
    @books.length
  end
end

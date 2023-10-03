class Book
  attr_accessor :title, :name, :author
  attr_reader :id, :rentals

  def initialize(title, author)
    @id = generate_id
    @title = title
    @author = author
    @rentals = []
  end

  def generate_id
    rand(1_000_000)
  end
end

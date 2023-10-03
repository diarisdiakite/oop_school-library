class Book
  attr_accessor :title, :name
  attr_reader :id

  def initialize(title, author)
    @id = generate_id
    @title = title
    @author = author
  end

  def generate_id
    rand(1_000_000)
  end
end

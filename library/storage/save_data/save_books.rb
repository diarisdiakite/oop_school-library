require 'json'
require_relative '../../classes/book'

module SaveBooks
  def save_books_to_json(data_dir)
    file_path = File.join(data_dir, 'books.json')
    books_json = Book.books.map(&:to_json)
    book_data = File.write(file_path, JSON.generate(books_json))
  end
end

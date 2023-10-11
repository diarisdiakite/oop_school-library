require 'json'
require_relative '../../classes/book'

module SaveBooks
  def save_books_to_json(data_dir, books)
    file_path = File.join(data_dir, 'books.json')
    books_data = books.map(&:to_json)
    File.write(file_path, JSON.generate(books_data))
  end
end

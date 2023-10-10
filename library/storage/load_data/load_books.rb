module LoadBooks
  def load_books_from_json
    if File.exist?('books.json')
      books_json = File.read('books.json')
      Book.books = JSON.parse(books_json, object_class: Book)
    else
      Book.books = []
    end
  end
end

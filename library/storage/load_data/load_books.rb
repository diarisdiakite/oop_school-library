module LoadBooks
  def load_books_from_json(data_dir)
    file_path = File.join(data_dir, 'books.json')
    if File.exist?(file_path)
      books_json = File.read(file_path)
      Book.books = JSON.parse(books_json, object_class: Book)
    else
      Book.books = []
    end
  end
end

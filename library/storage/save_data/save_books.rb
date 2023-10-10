module SaveBooks
  def save_books_to_json
    file.open('books.json', 'w') do |file|
      file.write(JSON.generate(Book.books))
    end
  end
end
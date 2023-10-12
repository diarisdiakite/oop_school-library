# Load data from JSON files
def load_books_from_json
  file_path = File.join(__dir__, 'books.json')
  return unless File.exist?(file_path)

  books_data = JSON.parse(File.read(file_path))
  books_data.each do |book_attributes|
    puts "Loading book: #{book_attributes['title']} by #{book_attributes['author']}"
    Book.new(book_attributes['title'], book_attributes['author'])
  end
end

# Load people from JSON file
def load_people_from_json
    return unless File.exist?('people.json')

    people_data = JSON.parse(File.read('people.json'))
    people_data.each do |data|
      if data['type'] == 'Student'
        student = Student.new(data['age'], data['name'])
        @people.push(student)
      elsif data['type'] == 'Teacher'
        teacher = Teacher.new(data['age'], data['specialization'], data['name'])
        @people.push(teacher)
      end
    end
  end

# Load rentals from JSON file
def load_rentals_from_json(books, people)
  file_path = File.join(__dir__, 'rentals.json')
  return unless File.exist?(file_path)

  rentals_data = JSON.parse(File.read(file_path))

  rentals_data.each do |rental_attributes|
    rental_book_data = rental_attributes['book']
    
    if rental_book_data
      book = books.find do |book|
        book.title == rental_book_data['title'] && book.author == rental_book_data['author']
      end

      if book
        person = people.find do |person|
          person.name == rental_attributes['person']['name'] && person.age == rental_attributes['person']['age']
        end

        if person
          Rental.new(rental_attributes['date'], book, person)
        else
          # Handle the case when a matching person is not found
          puts "Warning: Person not found for rental with data: #{rental_attributes}"
        end
      else
        # Handle the case when a matching book is not found
        puts "Warning: Book not found for rental with data: #{rental_attributes}"
      end
    else
      # Handle the case when book data is missing in the rental
      puts "Warning: Book data missing in rental: #{rental_attributes}"
    end
  end
end

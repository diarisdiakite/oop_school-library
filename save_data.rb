def save_data
  books_data = @books.map { |book| { title: book.title, author: book.author } }
  File.write('books.json', JSON.dump(books_data))

  people_data = @people.map do |person|
    people_data = @people.map do |person|
      if person.is_a?(Student)
        {
          id: person.id,
          type: 'Student',
          age: person.age,
          name: person.name,
          parent_permission: person.parent_permission
        }
      elsif person.is_a?(Teacher)
        {
          id: person.id,
          type: 'Teacher',
          age: person.age,
          name: person.name,
          specialization: person.specialization
        }
      end
    end
    File.write('people.json', JSON.dump(people_data))
  end
  
  rentals_data = @rentals.map do |rental|
    {
      person_index: @people.index(rental.person),
      book_index: @books.index(rental.book),
      date: rental.date
    }
  end
  File.write('rentals.json', JSON.dump(rentals_data))
end

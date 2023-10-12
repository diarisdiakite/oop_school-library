require 'pry'
require 'date'
require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/rental'
require_relative '../load_data'

# This class represents the main application for managing books, people, and rentals.
module App
  # include SaveBooks

  def call_list_all_books
    books_count = Book.books_count
    puts "We have #{books_count} book."
    if books_count.positive?
      puts 'Here is the list of all books'
      Book.list_all_books
    else
      puts "Select Option 4 to create a Book. \n\n"
    end
  end

  def call_list_all_people
    students_count = Student.students_count
    teachers_count = Teacher.teachers_count

    puts "We have #{students_count} students and #{teachers_count} teachers in the database"
    Student.list_all_students
    Teacher.list_all_teachers

    puts ''
    puts 'All people for debug'
    Person.list_all_people
    puts ''
  end

  def call_create_a_person
    print 'Do you want to create a student(1) or a teacher(2)? [input the number]: '
    input = gets.chomp.to_i
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if input == 1
      print 'Has parents permission? [Y/N]: '
      parent_permission = gets.chomp
      Student.add_a_student(age, name, parent_permission)
      puts "The student #{name}, Age: #{age} has been created.\n\n"
    elsif input == 2
      print 'Specialization: '
      specialization = gets.chomp
      Teacher.add_a_teacher(age, name, specialization)
      puts "The teacher #{name}, Age: #{age}, specialized in #{specialization} has been created.\n\n"
    else
      puts "Invalid option.\n\n"
    end
  end

  def call_create_a_book
    print 'Enter the book title: '
    title = gets.chomp.to_s
    print 'Enter the book author: '
    author = gets.chomp.to_s
    Book.add_a_book(title, author)
    # @books_list.push(book) # << book
    puts "Your book #{title} by #{author} has been created and added to the library.\n\n"
  end

  def call_create_a_rental
    if Book.books_count.positive? && Person.people_count.positive?
      puts 'Enter the date :'
      date = gets.chomp.to_s

      puts 'Select a book by its number from the following list: '
      Book.list_all_books

      book = Book.select_a_book(gets.chomp.to_i)

      puts 'Select a person by its number from the following list: '
      Person.list_all_people

      person = Person.select_a_person(gets.chomp.to_i)

      if person
        puts "Date: #{date}"
        Rental.add_a_rental(date, book, person)
        puts "Rental created successfully. \n\n"
      else
        puts "Person not found.\n\n"
      end
    else
      puts "Books or Peopole missing to create a Rental. Please create at least 1 Book and 1 person to continue.\n\n"
    end
  end

  def call_list_all_rentals_for_a_person
    students_count = Student.students_count
    teachers_count = Teacher.teachers_count
    # Rental.rentals_count

    if students_count.positive? || teachers_count.positive?
      puts 'Enter the person id: '
      Person.list_all_people

      selected_id = gets.chomp.to_i
      person = Person.select_a_person(selected_id)

      person_rentals_count = person.rentals.count
      puts "#{person.name} rented #{person_rentals_count} times."
      if person_rentals_count.positive?
        person.rentals.each do |rental|
          puts "[#{rental.book.id}] #{rental.book.title} by #{rental.book.author}"
        end
      end
      puts ''
    else
      puts "No person registered in the database.\n\n"
    end
  end

  # Data
  def book_data
    print 'Book title: '
    title = gets.chomp
    print 'Book author: '
    author = gets.chomp
    { title: title, author: author }
  end

  def person_data
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    if person.is_a?(Student)
      print 'Has parents permission? [Y/N]: '
      parent_permission = gets.chomp.upcase == 'Y'
      { age: age, name: name, parent_permission: parent_permission }
    else
      # For Teacher, no parent_permission is collected
      print 'Specialization: '
      specialization = gets.chomp
      { age: age, name: name, specialization: specialization }
    end
  end

  def rental_data
    puts 'Enter the date :'
    date = gets.chomp.to_s
    puts 'Select a book by its number from the following list: '
    Book.list_all_books
    book = Book.select_a_book(gets.chomp.to_i)
    puts 'Select a person by its number from the following list: '
    Person.list_all_people
    person = Person.select_a_person(gets.chomp.to_i)

    { date: date, book: book, person: person }
  end
end

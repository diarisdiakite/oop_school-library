#!/usr/bin/env ruby

require 'date'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/book'
require_relative 'classes/rental'

# rubocop:disable Metrics
class App
  def display_menu
    puts 'Please select an option by entering a number'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a Book'
    puts '5. Create a Rental'
    puts '6. List all rentals for a given person id'
    puts '7. Exit'
  end

  def run
    loop do
      books_count = Book.books_count
      Person.people_count
      Rental.rentals_count
      students_count = Student.students_count
      teachers_count = Teacher.teachers_count

      display_menu

      # choice
      choice = gets.chomp.to_i

      # case choice
      case choice
      when 1
        puts "We have #{books_count} book."
        if books_count.positive?
          puts 'Here is the list of all books'
          Book.list_all_books
        end
      when 2
        puts "[Students] (#{students_count})"
        Student.list_all_students
        puts "[Teachers] (#{teachers_count})"
        Teacher.list_all_teachers
      when 3
        # Create a person
        print 'Do you want to create a student(1) or a teacher(2)? [input the number]: '
        input = gets.chomp.to_i
        print 'Age: '
        age = gets.chomp.to_i
        print 'Name: '
        name = gets.chomp
        if input == 1
          print 'Classroom: '
          classroom = gets.chomp
          Student.add_a_student(age, name, classroom)
          puts "The student #{name} has been created and added to the classroom #{classroom}"
        elsif input == 2
          print 'Specialization: '
          specialization = gets.chomp
          Teacher.add_a_teacher(age, name, specialization)
          puts "The teacher #{name} specialized in #{specialization} has been created and added"
        else
          puts 'Invalid option'
        end
      when 4
        # Create a book
        print 'Enter the book title: '
        title = gets.chomp.to_s
        print 'Enter the book author: '
        author = gets.chomp.to_s
        Book.add_a_book(title, author)
        puts "Your book #{title} by #{author} has been created and added to the library"
      when 5
        # Create a rental
        if books_count.positive?
          if students_count.positive? || teachers_count.positive?
            puts 'Select a book by its number from the following list: '
            Book.list_all_books

            selected_id = gets.chomp.to_i
            book = Book.select_a_book(selected_id)

            puts 'Select a person by its number from the following list: '
            Person.list_all_people

            selected_id = gets.chomp.to_i
            person = Person.select_a_person(selected_id)

            if person
              date = Date.today
              Rental.add_a_rental(date, book, person)
              puts 'Rental created successfully'
            else
              puts 'Person not found'
            end
          else
            puts 'Please Create a person'
          end
        else
          puts 'Books missing to create a Rental. Please create at least 1 Book and 1 person to process the operation.'
        end
      when 6
        # List all rentals for a given person id
        if students_count.positive? || teachers_count.positive?
          puts 'Enter the person id: '
          Person.list_all_people

          selected_id = gets.chomp.to_i
          person = Person.select_a_person(selected_id)

          person_rentals_count = person.rentals.count
          puts "#{person.name} rented #{person_rentals_count} times."
          if person_rentals_count.positive?
            puts 'The following books were concerned:'
            person.rentals.each do |rental|
              puts "[#{rental.book.id}] #{rental.book.title} by #{rental.book.author}"
            end
          end
        else
          puts 'No person registered in the database.'
        end
      when 7
        break
      else
        puts 'Invalid choice'
      end
    end
  end
end

# rubocop:enable Metrics
def main
  app = App.new
  app.run
end

main

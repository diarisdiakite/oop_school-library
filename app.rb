#!/usr/bin/env ruby

require 'date'
require_relative 'classes/person'
require_relative 'classes/teacher'
require_relative 'classes/student'
require_relative 'classes/book'
require_relative 'classes/rental'

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
      display_menu

      # choice
      choice = gets.chomp.to_i

      # case choice
      case choice
      when 1
        book_count = Book.books_count
        puts "We have #{book_count} book."
        if book_count > 0
          puts "Here is the list of all books" 
          Book.list_all_books
        end
      when 2
        # List all people (Person.list_all_people?)
        students_count = Student.students_count
        teachers_count = Teacher.teachers_count
        puts "[Students] (#{students_count})"
        Student.list_all_students
        puts "[Teachers] (#{teachers_count})"
        Teacher.list_all_teachers
      when 3
        # Create a person
        print 'Do you want to create a student(1) or a teacher(2)? [input the number]:'
        input = gets.chomp.to_i
        puts 'Age:'
        age = gets.chomp.to_i
        puts 'Name:'
        name = gets.chomp
        if input == 1
          puts 'Classroom:'
          classroom = gets.chomp
          Student.add_a_student(age, name, classroom)
          puts "The student #{name} has been created and added to the classroom #{classroom}"
        elsif input == 2
          puts 'Specialization:'
          specialization = gets.chomp
          Teacher.add_a_teacher(age, name, specialization)
          puts "The teacher #{name} specialized in #{specialization} has been created and added"
        else
          puts 'Invalid option'
        end
      when 4
        # Create a book
        puts 'Enter the book title:'
        title = gets.chomp.to_s
        puts 'Enter the book author:'
        author = gets.chomp.to_s
        Book.add_a_book(title, author)
        puts "Your book #{title} by #{author} has been created and added to the library"
      when 5
        # Create a rental
        puts 'Select a book by its number from the following list:'
        Book.list_all_books
        book = gets.chomp
        puts 'Select a person by its number from the following list:'
        puts "[Student]"
        Student.list_all_students
        puts "[Teachers]"
        Teacher.list_all_teachers
        person = gets.chomp
        date = Date.today
        Rental.add_a_rental(date, book, person)
        puts date
        puts 'Rental created successfully'
      when 6
        # List all rentals for a given person id
        puts 'Enter the person id:'
        Student.list_all_students
        Teacher.list_all_teachers
        person_to_select = gets.chomp
        selected_person = Person.select_a_person(person_to_select)
        puts "You selected #{selected_person}"
      when 7
        break
      else
        puts 'Invalid choice'
      end
    end
  end
end

def main
  app = App.new
  app.run
end

main

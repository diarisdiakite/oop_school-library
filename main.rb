require_relative 'library/app'

# This class represents the main application for managing books, people, and rentals.

class Main
  include App

  def main
    response = nil
    # *Present the user with a list of options to perform.
    puts "Welcome to School Library App!\n\n"
    while response != '7'
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'

      # choice
      choice = gets.chomp.to_i

      # case choice
      case choice
      when 1
        call_list_all_books
      when 2
        call_list_all_people
      when 3
        call_create_a_person
      when 4
        call_create_a_book
      when 5
        call_create_a_rental
      when 6
        call_list_all_rentals_for_a_person
      when 7
        break
      else
        puts 'Invalid choice'
        puts ''
      end
    end
  end
end

app = Main.new
app.main

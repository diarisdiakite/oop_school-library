require_relative 'library/app'
require_relative 'save_data'
require_relative 'load_data'
require_relative 'library/classes/book'
require_relative 'library/classes/person'
require_relative 'library/classes/rental'

class Main
  include App

  def initialize
    # @data_dir = File.join(File.dirname(__FILE__), 'library', 'storage', 'data')
    @data_dir = File.join(__dir__)
    @books = Book.books || []
    @rentals = Rental.rentals || []
    @people = Person.all_people || []
    load_data_from_json
  end

  def load_data_from_json
    File.join(__dir__)
    load_books_from_json
    load_people_from_json
    load_rentals_from_json(@books, @people)
  end

  MENU_OPTIONS = {
    1 => { label: 'List all books', action: :call_list_all_books },
    2 => { label: 'List all people', action: :call_list_all_people },
    3 => { label: 'Create a person', action: :call_create_a_person },
    4 => { label: 'Create a book', action: :call_create_a_book },
    5 => { label: 'Create a rental', action: :call_create_a_rental },
    6 => { label: 'List all rentals for a given person id', action: :call_list_all_rentals_for_a_person },
    7 => {
      label: 'Exit',
      action: %i[exit_application save_data]
    }
  }.freeze

  def main
    display_welcome_message

    loop do
      display_menu

      choice = gets.chomp.to_i

      if MENU_OPTIONS.key?(choice)
        actions = MENU_OPTIONS[choice][:action]
        if actions.is_a?(Array)
          actions.each do |action|
            send(action)
          end
        else
          send(actions)
        end

        # Check if it's time to save the data
        save_data if actions.is_a?(Array) && actions.include?(:save_data)
        puts ''
      else
        display_invalid_choice
      end

      break if choice == 7
    end

    save_data
  end

  private

  def display_welcome_message
    puts "Welcome to School Library App!\n\n"
  end

  def display_menu
    puts 'Please choose an option by entering a number:'
    MENU_OPTIONS.each do |number, option|
      puts "#{number} - #{option[:label]}"
    end
  end

  def exit_application
    puts 'Exiting the application. Goodbye!'
  end

  def display_invalid_choice
    puts 'Invalid choice'
  end
end

app = Main.new
app.main

require_relative 'library/app'
require_relative 'library/storage/save_data/save_books'
require_relative 'library/storage/save_data/save_people'
require_relative 'library/storage/save_data/save_rentals'
require_relative 'library/storage/load_data/load_books'
require_relative 'library/storage/load_data/load_people'
require_relative 'library/storage/load_data/load_rentals'

class Main
  include App
  include LoadBooks
  include LoadPeople
  include LoadRentals
  include SaveBooks
  include SavePeople
  include SaveRentals

  def initialize
    @data_dir = File.join(File.dirname(__FILE__), 'library', 'storage', 'data')
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
      action: %i[exit_application save_data_to_json]
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
        puts ''
      else
        display_invalid_choice
      end

      break if choice == 7
    end
    save_data_to_json
  end

  def save_data_to_json
    save_books_to_json(@data_dir)
    save_people_to_json(@data_dir)
    save_rentals_to_json(@data_dir)
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

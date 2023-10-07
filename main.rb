require_relative 'library/app'

class Main
  include App

  MENU_OPTIONS = {
    1 => { label: 'List all books', action: :call_list_all_books },
    2 => { label: 'List all people', action: :call_list_all_people },
    3 => { label: 'Create a person', action: :call_create_a_person },
    4 => { label: 'Create a book', action: :call_create_a_book },
    5 => { label: 'Create a rental', action: :call_create_a_rental },
    6 => { label: 'List all rentals for a given person id', action: :call_list_all_rentals_for_a_person },
    7 => { label: 'Exit', action: :exit_application }
  }.freeze

  def main
    display_welcome_message

    loop do
      display_menu

      choice = gets.chomp.to_i

      if MENU_OPTIONS.key?(choice)
        send(MENU_OPTIONS[choice][:action])
        puts ''
      else
        display_invalid_choice
      end

      break if choice == 7
    end
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

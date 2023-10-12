require 'fileutils'
require_relative 'library/classes/book'
require_relative 'library/classes/person'
require_relative 'library/classes/rental'

def save_books_to_json(data_dir, books)
  file_path = File.join(data_dir, 'books.json')

  FileUtils.mkdir_p(data_dir)

  begin
    books_data = books.map(&:to_json)
    puts books_data
    File.write(file_path, JSON.generate(books_data))
    puts "Books data saved successfully to #{file_path}"
  rescue StandardError => e
    puts "Error saving books data: #{e.message}"
  end
end

def save_people_to_json(data_dir, people)
  return if people.nil? || people.empty?

  # Ensure the directory exists or create it
  FileUtils.mkdir_p(data_dir) unless File.directory?(data_dir)

  file_path = File.join(data_dir, 'people.json')

  begin
    people_data = people.map(&:to_json)
    File.write(file_path, JSON.generate(people_data))
    puts "People data saved to #{file_path}"
  rescue StandardError => e
    puts "Error while saving people: #{e.message}"
  end
end

# Save rentals to JSON file
def save_rentals_to_json(data_dir, rentals)
  return if rentals.nil? || rentals.empty?

  file_path = File.join(data_dir, 'rentals.json')
  rentals_data = rentals.map(&:to_json)
  File.write(file_path, JSON.generate(rentals_data)) if rentals.any?
end

require_relative '../../classes/student'
require_relative '../../classes/teacher'
require_relative 'load_people'
require_relative '../../../main'

# Create a Main instance with the correct data directory
app = Main.new(File.dirname(__FILE__))

# Load data from people.json
app.load_people_from_json

# Display the loaded students and teachers
puts 'Loaded students:'
Student.list_all_students

puts 'Loaded teachers:'
Teacher.list_all_teachers

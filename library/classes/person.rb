require 'json'
require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name, :rentals, :classroom, :specialization
  attr_reader :id, :parent_permission

  @all_people = []

  def initialize(age, name = 'Unknown', classroom = nil, specialization = nil, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @classroom = classroom # student class param
    @specialization = specialization # teacher class param
    @parent_permission = parent_permission
    @rentals = []
    self.class.add_person(self)
  end

  def generate_id
    rand(1_000_000)
  end

  def self.add_person(person)
    @all_people ||= []
    return if @all_people.include?(person)

    @all_people << person
  end

  def self.list_all_people
    # add a list by number
    @all_people ||= []
    @all_people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  def self.people_count
    @all_people ||= []
    @all_people.length
  end

  class << self
    attr_accessor :all_people
  end

  def self.select_a_person(selected_index)
    return @all_people[selected_index] if selected_index >= 0 && selected_index < @all_people.length

    puts 'Person not found'
    nil
  end

  def self.from_json(json_data)
    data = JSON.parse(json_data)
    # Parse JSON data and create a new Person object
    if data['type'] == 'Student'
      Student.new(data['id'], data['age'], data['name'], data['classroom'])
    elsif data['type'] == 'Teacher'
      Teacher.new(data['id'], data['age'], data['name'], data['specialization'])
    end
  end

  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.
  def can_use_services?
    of_age? || @parent_permission
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.

  private

  def of_age?
    age >= 18
  end
end

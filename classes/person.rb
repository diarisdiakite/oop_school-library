require_relative 'nameable'

class Person < Nameable
  attr_accessor :status, :age, :name, :rentals, :classroom, :specialization
  attr_reader :id, :parent_permission

  # @people ||= []
  @@all_people ||= []

  def initialize(status, age, name = 'Unknown', classroom = nil, specialization = nil, parent_permission: true)
    super()
    @id = generate_id
    @status = status
    @name = name
    @age = age
    @parent_permission = parent_permission
    @classroom = classroom # student class param
    @specialization = specialization # teacher class param
    @rentals = []
    self.class.add_person(self)
  end

  def generate_id
    rand(1_000_000)
  end

  def self.add_person(person)
    # @people ||= []
    # @@all_people << person
    unless @@all_people.include?(person)
      @@all_people << person
    end
  end

  def self.list_all_people
    # all_people ||= []

    @@all_people.concat(Student.students)
    @@all_people.concat(Teacher.teachers)

    @@all_people.each do |person|
      if person.status == 'Teacher'
        puts "[#{person.id}] #{person.status} #{person.name} #{person.specialization}"
      else
        puts "[#{person.id}] #{person.status} #{person.name} #{person.classroom}"
      end
    end
  end

  def self.select_a_person(selected_id)
    selected_person = @@all_people.find { |person| person.id == selected_id }
    return selected_person if selected_person

    puts 'Person not found'
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

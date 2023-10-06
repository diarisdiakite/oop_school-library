require_relative 'person'

class Student < Person
  attr_accessor :students

  # My class instance variable students which stores all the students
  @students = []

  # Constructor extends parent's constructor by adding `@classroom` and a parameter for it.
  def initialize(age, name = 'Unknown', classroom = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    self.class.students << self
  end

  def self.add_a_student(age, name, parent_permission)
    Student.new(age, name, parent_permission)
  end

  class << self
    attr_reader :students
  end

  def self.students_count
    @students.length
  end

  def self.list_all_students
    @students.each { |student| puts "[Student] Name: #{student.name}, ID: #{student.id}, Age: #{student.age}" }
  end

  def self.select_a_student(selected_id)
    selected_student = @students.find { |student| student.id == selected_id }
    return selected_student if selected_student

    puts 'Student not found'
  end

  # Method play_hooky that returns "¯\(ツ)/¯"
  def play_hooky
    '¯(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end

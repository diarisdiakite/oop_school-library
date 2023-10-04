require_relative 'person'

class Student < Person
  attr_accessor :classroom

  # My class variable students which stores all the students
  @students = []

  # Constructor extends parent's constructor by adding `@classroom` and a parameter for it.
  def initialize(age, name = 'Unknown', classroom, parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
    add_student_to_list4
  end

  def self.add_a_student(age, name = 'Unknown', classroom)
    student = Student.new(age, name, classroom)
  end

  def add_student_to_list
    self.class.students << self
  end

  def self.students
    @students
  end

  def self.students_count
    @students.length
  end

  def self.list_all_students
    @students.each { |student| puts "[#{student.id}] #{student.name} in #{student.classroom}" }
  end

  def self.select_a_student(student_to_select)
    selected_student = @students.find { |student| student.name == student_to_select }
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

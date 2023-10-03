require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :teachers

  # My class variable teachers to store all the teachers
  @@teachers = []

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def self.add_a_teacher(age, specialization, name = 'Unknown')
    teacher = Teacher.new(age, specialization, name)
    @@teachers.push(teacher)
  end

  def self.list_all_teachers
    @@teachers.each { |teacher| puts "#{teacher.name}, specialized in #{teacher.specialization}" }
  end

  def self.select_a_teacher(teacher_to_select)
    selected_teacher = @@teachers.find { |teacher| teacher.name === teacher_to_select }
    return selected_teacher if selected_teacher
    puts 'Teacher not found'
  end

  def can_use_services?
    true
  end
end

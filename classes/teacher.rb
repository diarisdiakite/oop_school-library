require_relative 'person'

class Teacher < Person
  attr_accessor :specialization, :teachers

  # My class instance variable teachers to store all the teachers
  @teachers = []

  def initialize(age, name = 'Unknown', specialization = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
    self.class.teachers << self
  end

  def self.add_a_teacher(age, name = 'Unknown', specialization)
    Teacher.new(age, name, specialization)
  end

  class << self
    attr_reader :teachers
  end

  def self.teachers_count
    @teachers.length
  end

  def self.list_all_teachers
    @teachers.each { |teacher| puts "[#{teacher.id}] #{teacher.name}, specialized in #{teacher.specialization}" }
  end

  def self.select_a_teacher(selected_id)
    selected_teacher = @teachers.find { |teacher| teacher.id == selected_id }
    return selected_teacher if selected_teacher

    puts 'Teacher not found'
  end

  def can_use_services?
    true
  end
end

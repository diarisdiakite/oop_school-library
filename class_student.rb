require_relative 'class_person'

class Student < Person
  attr_accessor :classroom
  
  def initialize(age, name = 'Unknown', parent_permission: true, classroom)
    super(age, name, parent_permission) # Use "Student" in super???
    @classroom = classroom
  end

  # Method play_hooky that returns "¯\(ツ)/¯"
  def play_hooky
    "¯\(ツ)/¯"
  end
end
require_relative 'class_person'

class Student < Person
  attr_accessor :classroom
  
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  # Method play_hooky that returns "¯\(ツ)/¯"
  def play_hooky
    "¯(ツ)/¯"
  end
end

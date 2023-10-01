require_relative 'class_person'

class Student < Person
  # Constructor extends parent's constructor by adding @classroom and a parameter for it.
  def initialize(age, name = "Unknown", parent_permission = true, classroom)
    super(age, name, parent_permission) # Use "Student" in super???
    @classroom = classroom
  end

  # Add a setter and a getter for the classroom class instance
  def classroom
    @classroom
  end

  def classroom=(classroom)
    @classroom = classroom
  end

  # Method play_hooky that returns "¯\(ツ)/¯"
  def play_hooky
    "¯\(ツ)/¯"
  end
end
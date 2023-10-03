require_relative 'person'

class Student < Person
  attr_reader :classroom

  # Constructor extends parent's constructor by adding `@classroom` and a parameter for it.
  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(id, age, name, parent_permission)
    @classroom = classroom
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

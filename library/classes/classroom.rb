class Classroom
  attr_accessor :label
  attr_reader :id, :students

  def initialize(label)
    @id = generate_id
    @label = label
    @students = []
  end

  def generate_id
    rand(1_000_000)
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end
end

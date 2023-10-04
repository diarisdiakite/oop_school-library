require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name, :rentals, :classroom, :specialization
  attr_reader :id, :parent_permission

  @people = []

  def initialize(age, name = 'Unknown', classroom = nil, specialization = nil, parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @classroom = classroom # student class param
    @specialization = specialization # teacher class param
    @rentals = []
  end

  def generate_id
    rand(1_000_000)
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

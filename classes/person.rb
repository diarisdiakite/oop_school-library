require_relative 'nameable'

class Person < Nameable
  attr_accessor :age, :name
  attr_reader :id, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = generate_id
    @name = name
    @age = age
    @parent_permission = parent_permission
    # @nameable = nameable
  end

  def generate_id
    rand(1_000_000)
  end

  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.
  def can_use_services
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.

  private

  def of_age
    age >= 18
  end
end

# person = Person.new(22, 'maximilianus')
# puts person.name

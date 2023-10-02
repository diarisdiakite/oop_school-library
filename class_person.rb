class Person
  attr_accessor :id, :age, :name, :parent_permission

  def initialize(id, age, name = 'Unknown', parent_permission: true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.

  private

  def of_age?
    age >= 18
  end

  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.
  def can_use_services
    of_age? || @parent_permission
  end
end

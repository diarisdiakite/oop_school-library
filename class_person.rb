class Person
  # Instance vars: @id, @name, and @age.

  # Constructor with name, age, and parent_permission as parameter. 
  # name and parent_permission are optional and have default values of "Unknown" and true.
  def initialize(age, name = "Unknown", parent_permission = true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission # Check if it should appear in the constructor
  end

  # Getters for @id, @name, and @age
  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  # Setters for @name and @age.
  def name=(name)
    @name = name
  end
  
  def age=(age)
    @age = age
  end

  # Private method of_age? that returns true if @age is greater or equal to 18 and false otherwise.
  Private

  def of_age # private method
    age >= 18
  end

  # Public method can_use_services? that returns true if person is of age or if they have permission from parents.
  def Public can_use_services
    of_age? || @parent_permission
  end
end
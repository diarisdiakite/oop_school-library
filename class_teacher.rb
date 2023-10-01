require_relative 'class_person'

class Teacher < Person
  # Constructor extends parent's constructor by adding @specialization and a parameter for it.
  def initialize(age, name = "Unknown", parent_permission = true, specialization)
    super(age, name, parent_permission) # Use "Teacher" in super???
    @specialization = specialization
  end

  # Adding a setter and a getter for specialization
  def specialization
    @specialization
  end

  def specialization=(specialization)
    @specialization = specialization
  end

  # Override can_use_services? so it always returns true
  def can_use_services
    true
  end
end
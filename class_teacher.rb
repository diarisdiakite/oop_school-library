require_relative 'class_person'

class Teacher < Person
  attr_reader :specialization

  # Constructor extends parent's constructor by adding @specialization and a parameter for it.
  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  # Override can_use_services? so it always returns true
  def can_use_services
    true
  end
end

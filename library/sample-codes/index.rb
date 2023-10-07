require_relative 'classes/nameable'
require_relative 'classes/person'
require_relative 'decorators/base_decorator'
require_relative 'decorators/capitalize_decorator'
require_relative 'decorators/trimmer_decorator'

person = Person.new(22, 'maximilianus')
puts person.name
puts person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person
puts capitalized_trimmed_person.correct_name

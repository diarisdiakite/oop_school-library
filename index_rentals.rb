require_relative 'classes/book'
require_relative 'classes/person'
require_relative 'classes/rental'

person1 = Person.new(21, 'Adam')
person2 = Person.new(16, 'Chadid')
book1 = Book.new('The strange destiny of Wangrin', 'Amadou H. Ba')
book2 = Book.new('The Cid', 'Corneille')
puts "#{person1.name} and #{person2.name} both like #{book1.title} by #{book1.author}"

rental1 = Rental.new("2022-06-06", person1, book1)
rental2 = Rental.new("2022-06-12", person2, book1)
rental2 = Rental.new("2023-06-12", person2, book2)
rental2 = Rental.new("2023-06-12", person2, book2)

book1.rentals.count
puts "Rental dates for #{book1.title}"
book1.rentals.each { |rental| puts rental.date }

book2.rentals.count
puts "Rental dates for #{book2.title}"
book2.rentals.each { |rental| puts rental.date }

person1_rentals_count = person1.rentals.count
puts "#{person1.name} rented #{person1_rentals_count} the following books were concerned:"
puts person1.rentals.each { |rental| puts rental.book.title}

person2_rentals_count = person2.rentals.count
puts "#{person2.name} rented #{person2_rentals_count} the following books were concerned:"
puts person2.rentals.map { |rental| rental.book.title }

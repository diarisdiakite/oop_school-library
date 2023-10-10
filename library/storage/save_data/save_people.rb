module SavePeople
    def save_people_to_json
    File.open('people.json', 'w') do |file|
      file.write(JSON.generate(Person.all_people))
    end
  end
end
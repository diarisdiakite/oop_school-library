module LoadPeople
  def load_people_from_json
    if File.exist?('people.json')
      people_json = File.read('people.json')
      Person.all_people = JSON.parse(people_json, object_class: Person)
    else
      Person.all_people = []
    end
  end
end

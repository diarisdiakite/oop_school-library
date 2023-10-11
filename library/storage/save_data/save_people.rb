require 'json'

module SavePeople
  def save_people_to_json(data_dir)
    people_data = {
      students: Student.students.map(&:to_json),
      teachers: Teacher.teachers.map(&:to_json)
    }

    file_path = File.join(data_dir, 'people.json')
    File.write(file_path, JSON.generate(people_data))
  end
end

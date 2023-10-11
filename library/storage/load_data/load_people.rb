module LoadPeople
  def load_people_from_json(data_dir)
    file_path = File.join(data_dir, 'people.json')
    if File.exist?(file_path)
      people_json = File.read(file_path)
      data = JSON.parse(people_json)
      load_students(data['students'])
      load_teachers(data['teachers'])
    else
      puts "JSON file not found: #{file_path}"
    end
  end

  # Implement load_students method to update the respective arrays.
  def load_students(students_data)
    Student.students = students_data.map { |student_data| Student.new(**JSON.parse(student_data)) }
  end

  # Implement load_teachers method to update the respective arrays.
  def load_teachers(teachers_data)
    Teacher.teachers = teachers_data.map { |teacher_data| Teacher.new(**JSON.parse(teacher_data)) }
  end
end

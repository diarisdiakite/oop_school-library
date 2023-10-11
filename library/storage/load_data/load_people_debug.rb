module LoadPeople
  def load_people_from_json(data_dir)
    file_path = File.join(data_dir, 'people.json')
    puts "Loading people data from file: #{file_path}"

    if File.exist?(file_path)
      people_json = File.read(file_path)
      puts "Raw JSON data: #{people_json}"

      data = JSON.parse(people_json)
      puts "Parsed data: #{data}"

      load_students(data['students'])
      load_teachers(data['teachers'])
    else
      puts "JSON file not found: #{file_path}"
    end
  end
end

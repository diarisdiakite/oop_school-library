class Rental
  attr_accessor :date
  attr_reader :id

  def initialize(date)
    @id = generate_id
    @date = date
  end

  def generate_id
    rand(1_000_000)
  end
end

require_relative 'class_nameable'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.upcase
  end
end

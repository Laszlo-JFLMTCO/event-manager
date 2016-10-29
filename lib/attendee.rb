require 'pry'
require_relative 'filters'

class Attendee
  include Filters

  attr_reader :details

  def initialize(fields = [])
    @details = load_template(fields)
  end

  def load_template(all_fields, template = {})
    return {} if all_fields.empty?
    all_fields.each do |one_field|
      template[rubynizer(one_field)] = nil
    end
    @details = template
  end

  def detail(field)
    details[rubynizer(field)]
  end

  def in_template?(field)
    details.keys.include?(rubynizer(field))
  end

  def record(field, information)
    return unless in_template?(field)
    @details[rubynizer(field)] = information
  end

end
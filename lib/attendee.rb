require 'pry'
require_relative 'filters'

class Attendee
  include Filters

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

  def all_details
    @details
  end

  def detail(field)
    @details[rubynizer(field)]
    # @details[field]
  end

  def record(field, information)
    return unless @details.keys.include?(field)
    @details[field] = information
  end
end
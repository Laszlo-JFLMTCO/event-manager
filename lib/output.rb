require 'pry'
require_relative 'filters'
require 'erb'

module Output
  include Filters

  def legislator_list_formatted(legislators)
    legislators.map do |one_legislator|
      "#{one_legislator.first_name} #{one_legislator.last_name}"
    end.join(", ")
  end

  def legislator_list(zipcode)
    Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

    legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  end

  def printout(one_person, path)
    zipcode = zip_fixer(one_person[:zipcode])
    legislators = legislator_list(zipcode)
    "#{one_person[:first_name]} #{zipcode} [#{legislator_list_formatted(legislators)}]"
    custom_letter(path, one_person, zipcode, legislators)
  end

  def custom_letter(path, one_person, zip_code, legislators)
    letter_template = load_template(path) 
    name = one_person[:first_name]
    output = letter_template.result(binding)
    id = one_person[0]
    save_letter(output, id)
  end

  def load_template(path)
    loading_template = File.read(path) if File.exist?(path)
    ERB.new(loading_template)
  end

  def save_letter(output, id)
    path = "./data/output/"
    filename = "#{path}#{id}_letter.html"
    File.open(filename, 'w') do |file|
      file.puts output
    end
  end
end
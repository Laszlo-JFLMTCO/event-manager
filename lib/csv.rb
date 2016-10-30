require 'pry'
require_relative 'entry'

class Csv

  attr_reader :raw_content,
              :template,
              :list

  def initialize(path = "", csv_name = "")
    @raw_content = []
    @template = []
    @list = []
    import(path, csv_name) unless path.empty? and csv_name.empty?
  end

  def import(path = "", csv_name)
    load(path, csv_name) if File.exist?(path + csv_name)
    return if raw_content.empty?
    build_content_list
  end

  def load(path, csv_name)
    @raw_content = File.readlines path + csv_name
  end

  def prepare_template
    num = raw_content.find_index do |line|
      line.start_with?(" ,")
    end
    @template = raw_content[num].split(",")
    add_enotry_no_to_template
    @raw_content.shift
  end

  def add_enotry_no_to_template
    @template[0] = ("entry_no")
  end

  def build_content_list
    prepare_template
    @list = parse_raw_content 
  end

  def parse_raw_content
    raw_content.map do |one_line|
      next if is_comment?(one_line)
      entry = Entry.new(template)
      capture(entry, format(one_line))
    end
  end

  def capture(entry, details)
    template.each_index do |index|
      entry.record(template[index], details[index].chomp)
    end
    return entry
  end

  def is_comment?(one_line)
    one_line.start_with?("#")
  end

  def format(raw_input)
    raw_input.split(",")
  end

  def review(wishlist)
    return template.shift if wishlist.empty?
    wishlist
  end

  def list_all(wishlist = [])
    wishlist = review(wishlist)
    process_list(wishlist)
  end

  def process_list(wishlist)
    output = []
    list.each do |entry|
      output << prepare_one_line(entry, wishlist)
    end
    return output
  end

  def prepare_one_line(entry, wishlist)
      one_line = []
      wishlist.each do |field|
        one_line << "#{entry.detail(field)}" if entry.in_template?(field)
      end
      return one_line.join(" ")
  end

end
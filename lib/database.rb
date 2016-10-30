require 'csv'

module DataBase

  def initialize(path = "", csv_name = "")
    @contents = []
    import(path + csv_name) if File.exist?(path + csv_name)
  end

  def import(path)
    @contents = CSV.open(path, headers:true, header_converters: :symbol)
  end
end
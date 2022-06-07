require 'csv'

class VehicleTextDataParser
  CSV_COLUMNS = %i(first_name last_name email vehicle_type vehicle_name length).freeze

  def initialize(text:)
    @text = text
  end

  def data_for_db
    parsed_data.map do |row|
      Hash[CSV_COLUMNS.zip(row)]
    end
  end

  private

  attr_reader :text

  def parsed_data
    CSV.parse(text, col_sep: delimeter)
  end

  def delimeter
    return '|' if num_pipes.positive? && num_pipes.remainder(expected_delimeters_per_line).zero?

    ','
  end

  def num_pipes
    @_num_pipes ||= text.count('|')
  end

  def expected_delimeters_per_line
    CSV_COLUMNS.length - 1
  end
end

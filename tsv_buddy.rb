# frozen_string_literal: true

TAB = "\t"
NEWLINE = "\n"
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  def row_to_table(headers, row)
    row.map.with_index { |cell, i| [headers[i], cell] }.to_h
  end

  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    rows = tsv.split(NEWLINE).map { |line| line.split(TAB) }
    headers = rows.first
    data_rows = rows[1..]
    @data = data_rows.map { |row| row_to_table(headers, row) }
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    header_row = @data.first.keys.join(TAB) + NEWLINE
    data_rows_array = @data.map { |d| d.values.join(TAB) + NEWLINE }
    header_row + data_rows_array.join
  end
end

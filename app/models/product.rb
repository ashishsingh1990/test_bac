class Product < ApplicationRecord

  # Import spread file
   def self.import(file)
    begin
      spreadsheet = open_spreadsheet(file)
      (0..((spreadsheet.workbook.worksheets.count) - 1)).each do |sht_val|
        w_book    = spreadsheet.workbook
        w_sheet   = w_book.worksheets
        w_heading = w_sheet[sht_val]
        ws_row    = w_heading.rows
        header    = ws_row[0]
        row_count = w_heading.rows.count
       (1..(row_count-1)).each do |i|
         row = Hash[[header, ws_row[i]].transpose]
         product = Product.find_or_initialize_by(name: row["name"])
         product.attributes = row.to_hash.slice(*row.to_hash.keys)
         product.save!
       end
      end
    rescue Exception => e
      puts "#{e.message}" #here we can write code to user recieve email regarding excelsheet error meesage.
    end
    File.delete(file)
  end

  def self.open_spreadsheet(file)
    case File.extname(file)
    when ".xls" then Roo::Excel.new(file)
    when ".xlsx" then Roo::Excelx.new(file)
    else raise "Unknown file type: #{file.original_filename}"
   end
  end
end

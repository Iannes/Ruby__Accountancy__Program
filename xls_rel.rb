require 'axlsx'


# adapted from http://axlsx.blogspot.com/, https://gist.github.com/2484520

p = Axlsx::Package.new

# Required for use with numbers
p.use_shared_strings = true

p.workbook do |wb|
  # define your regular styles
  styles = wb.styles
  title = styles.add_style :sz => 15, :b => true, :u => true
  default = styles.add_style :border => Axlsx::STYLE_THIN_BORDER
  pascal_colors = { :bg_color => 'FF', :fg_color => '00' }
  pascal = styles.add_style pascal_colors.merge({ :border => Axlsx::STYLE_THIN_BORDER, :b => true })
  header = styles.add_style :bg_color => 'FF', :fg_color => '00', :b => true
  money = styles.add_style :format_code => '#,###,##0', :border => Axlsx::STYLE_THIN_BORDER
  money_pascal = styles.add_style pascal_colors.merge({ :format_code => '#,###,##0', :border => Axlsx::STYLE_THIN_BORDER })
  percent = styles.add_style :num_fmt => Axlsx::NUM_FMT_PERCENT, :border => Axlsx::STYLE_THIN_BORDER
  percent_pascal = styles.add_style pascal_colors.merge({ :num_fmt => Axlsx::NUM_FMT_PERCENT, :border => Axlsx::STYLE_THIN_BORDER })

require_relative 'test_vat'

#Add Worksheet name

puts "\nPlease name your Excel Worksheet :"
@worksheet = gets.chomp.to_s


#Add Titles in First row
	@hash ={}

 	@titles = ['Starting Balance', 'Credit', 'Debit','VAT','Total After VAT']

  wb.add_worksheet(:name => @worksheet) do  |ws|
    ws.add_row [$name], :style => title
    ws.add_row
    ws.add_row @titles, :style => header
    # Passing one style applies the style to all columns
    array = [$balance, $credit, $debit, $sum, $new_total]
    
    
    ws.add_row array, :style => pascal

    # Otherwise you can specify a style for each column.
    #ws.add_row ['Q1-2011', '26740000000', '=B5/SUM(B4:B7)'], :style => [pascal, money_pascal, percent_pascal]
    #ws.add_row ['Q1-2012', '46330000000', '=B6/SUM(B4:B7)'], :style => [default, money, percent]
    #ws.add_row ['Q1-2013(est)', '72230000000', '=B7/SUM(B4:B7)'], :style => [default, money, percent]

   puts "Which cells would you like to merge ? use A1:c1 format"
    @merge = gets.chomp.to_s
    # You can merge cells!
    ws.merge_cells @merge

  end
end

	puts "How would you like to name your xlsx file ? (use filename.xlsx format)"
	@filename = gets.chomp.to_s

  puts "Your file #{@filename} is now saved on Programs folder."

	p.serialize @filename
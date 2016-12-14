class Wayfair
  require 'tiny_tds'
  require 'csv'

  time = Time.new
  filename = 'Wayfair_Flat_File_Inventory_'+ time.strftime("%Y-%m-%d") + '.csv'

  header_row = ['Supplier ID', 'Item Number', 'Qty On Hand', 'Backordered',
    'Qty On Order', 'Item Next Availability Date', 'Item Discontinued', 'Item Description']

  client = TinyTds::Client.new username: 'wdbuser', password: '2MMcw9Pcz-123',
  host: '69.175.60.83', port: 2433, database: 'common'

  results = client.execute('SELECT productID, QbName, Numinstock,
   dateAvailable, WayfairDesc FROM products WHERE WayfairOn=1')


    CSV.open(filename, 'wb') do |csv|
      csv << header_row
      results.each do |row|
      csv << [row['productID'],row['QbName'],row['Numinstock'], '', '', row['dateAvailable'], '', row['WayfairDesc']]
      end
    end

end

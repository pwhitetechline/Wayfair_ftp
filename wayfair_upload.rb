require 'FileUtils'
require_relative 'Ftp'


def move_file()
  files = Dir["*.csv"]
  files.each do |f|
    if f.match(/^Wayfair/)
      FileUtils.mv f, 'Archive'
    end
  end
end
Ftp::ftp_connect("edi.wayfair.com", "EDI_SequoiaBrands", "7423@Trees")
Ftp::upload_file(Ftp::get_file_to_upload()[0])
Ftp::close_connection()
# Ftp::ftp_connect("69.175.33.35", "pat", "")
# Ftp::ftp_list()
# Ftp::upload_file(Ftp::get_file_to_upload()[0])
# Ftp::close_connection()

move_file()

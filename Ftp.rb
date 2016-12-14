class Ftp
  require 'net/ftp'

  def self.ftp_connect(server, uname, passwd)
    @ftp = Net::FTP.new
    @ftp.passive = true
    @ftp.connect(server)
    @ftp.login(uname, passwd)
  end

  # refactor to search ftp for uploaded file
  def self.ftp_list()
      files = @ftp.nlst("*.csv")
      files.each do |file|
        if file.match(/^Wayfair/)
        puts file
        end
      end
  end

  def self.get_file_to_upload()
    return Dir["*.csv"]
  end

  def self.upload_file(file_to_upload)
      @ftp.putbinaryfile(file_to_upload)
  end

  def self.close_connection()
    @ftp.close
  end

  def delete_file(file_to_delete)
    @ftp.delete(file_to_delete)
  end

end

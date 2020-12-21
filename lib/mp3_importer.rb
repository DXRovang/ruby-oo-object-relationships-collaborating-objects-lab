require "pry"

class MP3Importer

  attr_accessor :files, :path

  @@all = []
  
  def initialize(path)
    @path = path
    @@all << self
   
  end
  
  def files
    Dir.children(@path)
  end

  def import 
    import_file = self.files
    import_file.each do |file|
      Song.new_by_filename(file)
    end
  end
 
end
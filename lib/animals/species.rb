class Animals::Species

  attr_accessor :name, :bio, :url, :animal_names, :animal_bios

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url 
    @@all << self
  end

  def self.all
    @@all
  end

end

class Animals::Species 

  attr_accessor :name, :bio, :url, :animal_names, :animal_bios

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end

# Class responsible for the different animal species living on the farm 
class Animals::Species

  attr_accessor :name, :url

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

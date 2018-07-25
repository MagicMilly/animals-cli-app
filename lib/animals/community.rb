#Class for the community of animal species selected by user

class Animals::Community

  attr_accessor :name, :bio
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end

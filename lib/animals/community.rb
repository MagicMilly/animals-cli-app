#Class responsible for the community of specific species selected by user
class Animals::Community

  # :bio could be added as a future feature
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end

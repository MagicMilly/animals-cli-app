class Animals::Species

  attr_accessor :name, :url, :member_name, :member_bio

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

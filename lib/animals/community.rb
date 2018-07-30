#Class responsible for the community of specific species selected by user
class Animals::Community

  # :bio could be added as a future feature
  attr_accessor :species, :member_name
  @@all = []

  def initialize(species, member_name)
    @species = species
    @member_name = member_name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.list_member_names(species)
    self.all.each do |a|
      puts "- " + a.member_name if a.species == species
    end
  end

end

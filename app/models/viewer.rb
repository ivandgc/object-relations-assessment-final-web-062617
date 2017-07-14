class Viewer
  attr_accessor :first_name, :last_name

  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    find_by(name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def create_rating(movie, score)
    Rating.new(self, movie, score)
  end
end

def find_by(name)
  self.all.find {|v| v.name == name}
end

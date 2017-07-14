class Movie
  attr_accessor :name

  @@all = []

  def initialize(title)
    @name = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    find_by(title)
  end

  def ratings
    Rating.all.select {|r| r.movie == self}
  end

  def viewers
    self.ratings.collect {|r| r.viewer}
  end

  def average_rating
    average = 0.0
    self.ratings.each {|r| average += r.score}
    (average /= self.ratings.count).round(1)
  end
end

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

class Rating
  attr_accessor :score
  attr_reader :viewer, :movie

  @@all = []

  def initialize(viewer, movie, score)
    @viewer = viewer
    @movie = movie
    @score = score
    self.class.all << self
  end

  def self.all
    @@all
  end
end

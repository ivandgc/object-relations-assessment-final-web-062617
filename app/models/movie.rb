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

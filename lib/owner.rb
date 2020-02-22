class Owner
  attr_reader :name, :species

  @@all = []
  @@pets = []
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def save
      @@all << self
  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select{ |cat| cat.owner == self }
  end

  def dogs
    Dog.all.select{ |dog| dog.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { |d| d.mood = "happy" }
  end

  def feed_cats
    cats.each { |c| c.mood = "happy" }
  end

  def sell_pets
    @@pets = cats + dogs
    @@pets.each {|p| 
      p.mood = "nervous"
      p.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
end
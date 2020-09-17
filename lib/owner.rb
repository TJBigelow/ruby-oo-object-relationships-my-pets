class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = 'human'
    self.class.all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|o| o.owner == self}
  end

  def dogs
    Dog.all.select{|o| o.owner == self}
  end

  def buy_cat(name)
    new_cat = Cat.new(name, self)
  end

  def buy_dog(name)
    new_dog = Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.each {|o| o.mood = 'happy'}
  end

  def feed_cats
    self.cats.each {|o| o.mood = 'happy'}
  end

  def sell_pets
    self.dogs.each {|o| o.mood = 'nervous'; o.owner = nil}
    self.cats.each {|o| o.mood = 'nervous'; o.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
    end
end
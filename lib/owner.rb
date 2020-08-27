#We did it!!
class Owner
  # code goes here
  attr_accessor :owner

  @@all = []
  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all << self
  end

  def name
    @name
  end

  def species
    @species
  end

  def say_species
    p "I am a human."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.filter { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.filter { |dog| dog.owner == self}
  end
  
  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name, self)
  end

  def buy_dog(dog)
    dog = Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end

# cat = Cat.new()

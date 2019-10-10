require 'pry'

class Waiter
  @@all = []
  attr_accessor :name, :yrs_experience

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    meal = Meal.new(self, customer, total, tip)
    meal
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def best_tipper
    meals.sort_by(&:tip).last.customer
  end

end
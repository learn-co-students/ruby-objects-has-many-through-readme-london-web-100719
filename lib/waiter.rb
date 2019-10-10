class Waiter

    attr_accessor :name, :years

    @@all =[]

    def initialize(name, years)
        @name = name
        @years = years
        Waiter.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self }
    end

    def best_tipper
       array = meals.sort_by {|meal| meal.tip}.reverse
       array[0].customer
    end



end
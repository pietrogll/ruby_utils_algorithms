# The strategy pattern (also known as the policy pattern) is a behavioral design pattern that enables selecting an algorithm at runtime. Instead of implementing a single algorithm directly, code receives run-time instructions as to which in a family of algorithms to use. Strategy lets the algorithm vary independently from clients that use it.

#It is about inject specific behaviour for defining object of the same class that behaves differently event if having the same interface

class Duck 

  def initialize fly_behaviour, quack_behaviour
    @fly_behaviour = fly_behaviour
    @quack_behaviour = quack_behaviour
  end

  def fly
    @fly_behaviour.run()
  end

  def quack
    @quack_behaviour.run()
  end

end


class JetFlyBehaviour
  def run
    'I am flying as a jet'
  end
end

class NormalFlyBehaviour
  def run
    'I am flying'
  end
end

class StrongQuackBehaviour
  def run
    "QUACK!!"
  end
end

class NormalQuackBehaviour
  def run
    "quack"
  end
end

common_duck = Duck.new(NormalFlyBehaviour.new, NormalQuackBehaviour.new)
super_duck = Duck.new(JetFlyBehaviour.new, StrongQuackBehaviour.new)

p "common_duck: #{common_duck.quack} - #{common_duck.fly}" 
p "super_duck: #{super_duck.quack} - #{super_duck.fly}" 
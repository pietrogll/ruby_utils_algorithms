#SOURCE: 
#Youtube: https://www.youtube.com/channel/UCbF-4yQQAWw-UnuCd2Azfzg

#BEHAVIORAL PATTERNS: Behavioral design patterns are concerned with algorithms and the assignment of responsibilities between objects.

#Observer is a behavioral design pattern that lets you define a subscription mechanism to notify multiple objects about any events that happen to the object they’re observing. There is a one-to-many relations: subjetc (has_many) observers.

class Observable
	def initialize
		@observers = []
	end
	def add observer
		@observers << observer
	end
	def remove observer
		@observers.delete observer
	end
	def notify #abstract method
		raise 'This has to be implemented'
	end
end

class Observer
	def update #abstract method
		raise 'This has to be implemented'
	end
end

class TemperatureStation < Observable
	def initialize
		super()
		@temperature = 0
	end
	def notify
		temperature = get_temperature()
		@observers.each { |observer|
			observer.update(temperature)
		}
	end
	def get_temperature
		@temperature
	end
	def register_temperature temperature
		@temperature = temperature
	end
end

class TemperatureDisplayer < Observer
	def update temperature
		p "updated temperature: #{temperature}"
	end
end

station = TemperatureStation.new
displayer = TemperatureDisplayer.new
station.add(displayer)
station.notify()
# --> 0
station.register_temperature(25)
station.notify()
# --> 25

# Other possibility is to initialize the ConcreteObserver (TemperatureDisplayer) with the corresponding ConcreteObservable instance. In this way the observer update method get the state state directly from the observable instance (notify does not pass any params).

class TemperatureStation2 < Observable
	def initialize
		super()
		@temperature = 0
	end
	def notify
		@observers.each { |observer|
			observer.update()
		}
	end
	def get_temperature
		@temperature
	end
	def register_temperature temperature
		@temperature = temperature
	end
end

class TemperatureDisplayer2 < Observer
	def initialize observable
		@observable = observable
	end
	def update
		temperature = @observable.get_temperature()
		p "updated temperature: #{temperature}"
	end
end

station2 = TemperatureStation2.new
displayer = TemperatureDisplayer2.new(station2)
station2.add(displayer)
station2.notify()
# --> 0
station.register_temperature(25)
station.notify()
# --> 25
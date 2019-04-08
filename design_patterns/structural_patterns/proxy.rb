#RESOURCES: 
#https://refactoring.guru/
# Video: https://www.youtube.com/watch?v=NwaabHqPHeM

#STRUCTURAL PATTERN
#Structural patterns explain how to assemble objects and classes into larger structures, while keeping this structures flexible and efficient.

#PROXY
#Proxy lets you provide a substitute or placeholder for another object. A proxy controls access to the original object, allowing you to perform something either before or after the request gets through to the original object.
#Instead of calling the THING you want to call, you call the THING which call the THING you want ;)
#There are different 'types' of proxy depending the use you make of it. Among them: Remote Proxy, Virtual Proxy, Protection Proxy

#=======================
#Virtual Proxy:
#=======================

class Subject

	def request
		raise 'This has to be implemented'
	end

end

class ConcreteSubject < Subject
	
	def initialize
		init
	end
	
	def request
		p 'Here it goes the info you requested'
	end

	private
	
	def init 
		p 'I use many resources to get ready'
	end

end

class Proxy < Subject
	def initialize 
		@concrete_subject = nil
	end
	def request
		@concrete_subject = ConcreteSubject.new if @concrete_subject.nil?
		@concrete_subject.request
	end
end

service = Proxy.new
# --> "I use many resources to get ready"
service.request
# --> "Here it goes the info you requested"
service.request
# --> "Here it goes the info you requested"


#=======================
#Protection Proxy:
#=======================


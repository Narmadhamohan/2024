class Flight():
	def __init__(self, capacity):
		self.capacity=capacity
		self.passengers = []

	def addPassengers(self, person):
		if not self.open_seats():
			return False
		self.passengers.append(person)
		return True

	# Method to return number of passengers
	def open_seats(self):
		return self.capacity - len(self.passengers)

#Create a new flight with capacity
f = Flight(3)
#create a list of people
people = ["A","V","C","D","A"]

for name in people:
	if f.addPassengers(name):
	    print(f"Passenger: {name} ticket booked")
	else: 
	    print(f"No vacant tickets for {name}")

	
	



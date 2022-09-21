require_relative "./models/baggage"
require_relative "./models/copilot"
require_relative "./models/pilot"
require_relative "./models/flight_attendant"
require_relative "./models/passenger"
require_relative "./models/ticket_seller"
require_relative "./models/ticket"
require_relative "./models/flight"

flight = Flight.new
flight.number = 828
flight.from = "Bahamas"
flight.to = "New york"
baggage = Baggage.new
baggage.max_weight = 20
baggage.type = "hand baggage"
ticket = Ticket.new
ticket.type = "first class"
ticket.baggage = baggage
ticket.number = 1234
ticket.flight = flight
ticket_seller = TicketSeller.new
ticket_seller.name = "Sofia"
print "The ticket seller #{ticket_seller.name} is "
ticket_seller.work
passenger = Passenger.new
passenger.name = "Erick"
passenger.age = 26
passenger.buy_ticket(ticket)
passenger.ticket.show_type
passenger.ticket.baggage.show_description
pilot = Pilot.new
copilot = Copilot.new
flight_attendant = FlightAttendant.new
pilot.name = "Panchis"
copilot.name = "Willi"
flight_attendant.name = "Karla"
passenger.travel
puts "The pilot's name is #{pilot.name} and his co-pilot's name is #{copilot.name}"
puts "The fllght attendant's name is #{flight_attendant.name}"
pilot.work
copilot.work
flight_attendant.work
puts "Thanks for traveling with us"





class Ticket
    attr_accessor :number
    attr_accessor :flight
    attr_accessor :baggage
    attr_accessor :type

    def show_type 
        puts "The ticket type is #{@type}"
    end    
end
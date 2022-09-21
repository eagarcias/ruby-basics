class Baggage 
    attr_accessor :max_weight
    attr_accessor :type

    def show_description
        puts "The max weight of the baggage is #{@max_weight} and the type is #{@type}"
    end
end    
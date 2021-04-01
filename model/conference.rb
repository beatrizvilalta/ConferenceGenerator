class Conference

    def initialize()
        @first_day_morning = Array.new
        @first_day_afternoon = Array.new
        @second_day_morning = Array.new
        @second_day_afternoon = Array.new
    end

    attr_accessor :first_day_morning, :first_day_afternoon, :second_day_morning, :second_day_afternoon
    
end
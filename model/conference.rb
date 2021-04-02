class Conference

    def initialize(first_day_morning, first_day_afternoon, second_day_morning, second_day_afternoon)
        @first_day_morning = first_day_morning
        @first_day_afternoon = first_day_afternoon
        @second_day_morning = second_day_morning
        @second_day_afternoon = second_day_afternoon
    end

    attr_accessor :first_day_morning, :first_day_afternoon, :second_day_morning, :second_day_afternoon
    
end
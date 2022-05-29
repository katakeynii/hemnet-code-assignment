class Period
    include Comparable
    attr_reader :start_date, :end_date
    def initialize(start_date, end_date)
        @start_date, @end_date = start_date, end_date
    end

    def ==(other)
        start_date === other.start_date && start_date === other.start_date
    end

    def <=>(other)
        amount <=> other.amount
    end
end
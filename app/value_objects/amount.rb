class Amount
    include ActiveModel::Validations
    include Comparable

    attr_reader :value

    validates :value, 
        presence: true,
        numericality: { 
            greater_than_or_equal_to: 0
        }
    def initialize(amount)
        @value = amount
    end

    def ==(other)
        value === other
    end
    def <=>(other)
        value <=> other
    end
end
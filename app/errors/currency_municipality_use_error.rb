class CurrencyMunicipalityUseError < StandardError
    def message
        "Using this currency is not allowed in the targeted municipality"
    end
end
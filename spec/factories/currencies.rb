CURRENCIES = ["USD", "EUR", "XOF", "GBP", "SEK"]
FactoryBot.define do
  factory :currency do
    name {CURRENCIES.sample}
    code {CURRENCIES.sample}
    symbol {CURRENCIES.sample}
    decimal_mark { "." }
    thousand_mark { "," }
  end
end

namespace :seed do

  desc ""
  task all: :environment do
    Price.delete_all 
    AcceptedCurrency.delete_all 
    Package.delete_all 
    Municipality.delete_all 
    Currency.delete_all 

    Rake::Task['seed:packages'].invoke
    Rake::Task['seed:municipalities'].invoke
    Rake::Task['seed:currencies'].invoke
    Rake::Task['seed:currencies_in_municipality'].invoke
    Rake::Task['seed:prices'].invoke
  end

  desc "Creating packages "
  task packages: :environment do
    Package.delete_all 
    packages = ["Basic", "Plus", "Premium"]
    packages.each do |package|
      Package.create! name: package
    end
  end

  desc "Creating municipalities "
  task municipalities: :environment do
    Municipality.delete_all 
    municipalities = ["Dakar", "Paris", "Stockholm", "New York"]
    municipalities.each do |name|
      Municipality.create! name: name
    end
  end


  desc "Creating currencies "
  task currencies: :environment do
    Currency.delete_all 
    codes = ["USD", "EUR", "GBP", "XOF", "SEK"]
    def get_currency code
      { decimal_mark: ".", name: code, symbol: code, thousand_mark: ",", code: code }
    end
    currencies = codes.map { |code| get_currency code }
    currencies.each do |hash|
      Currency.create! hash
    end
  end

  desc "Creating currencies "
  task currencies_in_municipality: :environment do
    AcceptedCurrency.delete_all 
    data = [
      {
        municipality: "dakar",
        currency: ["XOF"],
        start_date: DateTime.now
      },
      {
        municipality: "paris",
        currency: ["EUR", "USD"],
        start_date: DateTime.now
      },
      {
        municipality: "new-york",
        currency: ["EUR", "USD"],
        start_date: DateTime.now
      },
      {
        municipality: "stockholm",
        currency: ["SEK", "USD", "EUR"],
        start_date: DateTime.now
      }
    ]
    data.each do |link| 
      municipality = Municipality.find_by(slug: link[:municipality])
      puts link[:currency]
      currencies = Currency.where(code: link[:currency])
      municipality.currencies = currencies
    end
  end

  desc "Creating prices"
  task prices: :environment do
    Price.delete_all 
    packages = [
      {
        package_name: 'basic',
        municipalities: [
          {
            slug: "paris",
            prices: [
              {amount: 100, currency: "USD"}
            ]
          },
          {
            slug: "stockholm",
            prices: [
              {amount: 100, currency: "SEK"},
              {amount: 90, currency: "USD"},
            ]
          }
        ]
      },
      {
        package_name: 'plus',
        municipalities: [
          {
            slug: "dakar",
            prices: [
              {amount: 100, currency: "XOF"}
            ]
          },
          {
            slug: "new-york",
            prices: [
              {amount: 100, currency: "USD"},
              {amount: 100, currency: "EUR"},
            ]
          }
        ]
      }
    ]

    packages.each do |data|
      package = Package.friendly.find(data[:package_name])
      data[:municipalities].each do |info|
        municipality = Municipality.friendly.find(info[:slug])
        info[:prices].each do |price|
          currency = Currency.find_by(code: price[:currency])
          Price.create! amount: price[:amount], 
            currency: currency, 
            package: package,
            currency_code: currency.code,
            municipality: municipality
        end
      end
    end
  end


end

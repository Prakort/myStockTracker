class Stock < ApplicationRecord

  has_many :user_stocks
  has_many :users, through: :user_stocks

  validates :name, :ticker, presence: true
  
  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: 'Tpk_4a5046887edf4a19832822a2bdd5765d',
      secret_token: 'Tsk_3a5c647612a446bea0d16f2e83615e73',
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    begin
      company = client.company(ticker_symbol)
      price = client.price(ticker_symbol)
      new(ticker: ticker_symbol ,name: company.company_name, last_price: price)
    rescue => exception
      return nil
    end
  end
  
  def self.check_db(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
end

require "fora/version"
require "contracts"
require "date"

module Fora
  include ::Contracts
  C = Contracts

  protected

  Contract C::Or[Date, DateTime] => String
  def date_format(date)
    date.strftime("%m/%d/%Y")
  end

  Contract C::Or[Time, DateTime] => String
  def time_format(time)
    time.strftime("%m-%d-%Y %H:%M")
  end

  # Not the most robust regex, just a quick check
  Contract C::And[String, /\A[0-1][0-9]\/[0-3][0-9]\/[1-2][0-9]{3}/] \
           => Date
  def parse_us_date(date)
    Date.strptime(date, "%m/%d/%Y")
  end

  # Not the most robust regex, just a quick check
  Contract C::And[String, /\A[0-1][0-9]-[0-3][0-9]-[1-2][0-9]{3}\s\d{2}:\d{2}/],
           C::Maybe[ C::And[String, /\A[a-zA-Z]{3}/] ] \
           => Time
  def parse_us_time(time, zone = "UTC")
    opts = "%m-%d-%Y %H:%M %Z"
    t = [time, zone].join(" ")
    if zone == "UTC"
      DateTime.strptime(t, opts).to_time.utc # perfer time object return
    else
      DateTime.strptime(t, opts).to_time
    end
  end

end

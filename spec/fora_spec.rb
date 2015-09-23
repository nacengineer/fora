require 'spec_helper'

describe Fora do

  let(:date_string)  {"12/31/2015"}
  let(:bad_date_str) {"012/31/2015"}
  let(:time_string)  {"12-31-2015 13:00"}
  let(:bad_time_str) {"12-31-2015 013:00"}

  let(:offset)     {Time.now.utc_offset / 3600}
  let(:date)       {Date.new(2015, 12, 31)}
  let(:datetime)   {DateTime.new(2015, 12, 31, 13, 00, 00, offset)}
  let(:local_time) {Time.new(2015, 12, 31, 13, 00, 00)}
  let(:utc_time)   {local_time.utc}

  subject!(:object) {o = Object.new; o.extend Fora; o}

  it 'has a version number' do
    expect(Fora::VERSION).to_not be nil
  end

  it {expect(object.send :date_format, date ).to eq date_string}
  it {expect(object.send :date_format, datetime ).to eq date_string}
  it {expect {object.send :date_format, bad_date_str}.to raise_error}

  it {expect(object.send :parse_us_date, date_string ).to eq date}
  it {expect {object.send :parse_us_date, bad_date_str }.to raise_error}

  it {expect(object.send :time_format, local_time).to eq time_string}

  it "Fora#parse_us_time works" do
    expect(object.send(:parse_us_time, time_string).mon).to eq utc_time.utc.mon
    expect(object.send(:parse_us_time, time_string).day).to eq utc_time.utc.day
    expect(object.send(:parse_us_time, time_string).year).to eq utc_time.utc.year
    expect(object.send(:parse_us_time, time_string).hour).to eq utc_time.utc.hour
    expect(object.send(:parse_us_time, time_string).min).to eq utc_time.utc.min
    expect(object.send(:parse_us_time, time_string).zone).to eq utc_time.utc.zone
  end

  it "Fora#parse_us_time works w/ time zone" do
    expect(object.send(:parse_us_time, time_string, "CST").mon).to eq local_time.mon
    expect(object.send(:parse_us_time, time_string, "CST").day).to eq local_time.day
    expect(object.send(:parse_us_time, time_string, "CST").year).to eq local_time.year
    expect(object.send(:parse_us_time, time_string, "CST").hour).to eq local_time.hour
    expect(object.send(:parse_us_time, time_string, "CST").min).to eq local_time.min
    expect(object.send(:parse_us_time, time_string, "CST").zone).to eq local_time.zone
  end

  it {expect {object.send :parse_us_time, bad_time_str}.to raise_error}

end

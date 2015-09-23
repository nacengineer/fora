require 'spec_helper'

describe Fora do

  let(:date_string)    {"12/31/2015"}
  let(:bad_date_str)   {"012/31/2015"}
  let(:bad_time_str)   {"12-31-2015 013:00"}

  let(:offset)     {Time.now.utc_offset / 3600}
  let(:date)       {Date.new(2015, 12, 31)}
  let(:datetime)   {DateTime.new(2015, 12, 31, 13, 00, 00, offset)}
  let(:local_time) {Time.new(2015, 12, 31, 13, 00, 00)}
  let(:utc_time)   {local_time.utc}

  let(:local_time_str) {local_time.strftime("%m-%d-%Y %H:%M")}
  let(:utc_time_str)   {utc_time.strftime("%m-%d-%Y %H:%M")}

  subject!(:object) {o = Object.new; o.extend Fora; o}

  it 'has a version number' do
    expect(Fora::VERSION).to_not be nil
  end

  it {expect(object.send :date_format, date ).to eq date_string}
  it {expect(object.send :date_format, datetime ).to eq date_string}
  it {expect {object.send :date_format, bad_date_str}.to raise_error}

  it {expect(object.send :parse_us_date, date_string ).to eq date}
  it {expect {object.send :parse_us_date, bad_date_str }.to raise_error}

  it {expect(object.send :time_format, local_time).to eq local_time_str}


  it "Fora#parse_us_time works w/ time zone (as local time)" do
    expect(object.send(:parse_us_time, local_time_str, "CST").mon).to eq local_time.mon
    expect(object.send(:parse_us_time, local_time_str, "CST").day).to eq local_time.day
    expect(object.send(:parse_us_time, local_time_str, "CST").year).to eq local_time.year
    expect(object.send(:parse_us_time, local_time_str, "CST").hour).to eq local_time.hour
    expect(object.send(:parse_us_time, local_time_str, "CST").min).to eq local_time.min
    expect(object.send(:parse_us_time, local_time_str, "CST").zone).to eq local_time.zone
  end

  it "Fora#parse_us_time works (as UTC)" do
    expect(object.send(:parse_us_time, utc_time_str).mon).to eq utc_time.mon
    expect(object.send(:parse_us_time, utc_time_str).day).to eq utc_time.day
    expect(object.send(:parse_us_time, utc_time_str).year).to eq utc_time.year
    expect(object.send(:parse_us_time, utc_time_str).hour).to eq utc_time.hour
    expect(object.send(:parse_us_time, utc_time_str).min).to eq utc_time.min
    expect(object.send(:parse_us_time, utc_time_str).zone).to eq utc_time.zone
  end

  it {expect {object.send :parse_us_time, bad_time_str}.to raise_error}

end

require "rails_helper"

class Validator
  include ActiveModel::Validations
  attr_accessor :date
  validates :date, future_date: true
end

describe FutureDateValidator do
  subject { Validator.new }
  
  context "when date is before current date" do
    before { subject.date = 1.day.ago }

    it "should be invalid" do
      expected(subject.valid?).to be_falsey
    end

    it "adds an error on model" do
      subject.valid?
      expected(subject.errors.keys).to include(:date)
    end
  end

  context "when date is equal current date" do
    
  end

  context "when date is greater than current date" do
    
  end
end
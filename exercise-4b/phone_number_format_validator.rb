# frozen_string_literal: true

class PhoneNumberFormatValidator < ActiveModel::Validator
  PHONE_REGEX = /^[0-9]{9}$/

  def validate(record)
    unless valid_number?
      record.errors[:phone_number] << "invalid phone number format"
    end
  end

  def valid_number?(record)
    !(record.phone_number.nil?) && !(record.phone_number =~ PHONE_REGEX)
  end
end

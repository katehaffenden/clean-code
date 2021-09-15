# frozen_string_literal: true

class PhoneNumberFormatValidator < ActiveModel::Validator
  PHONE_REGEX = /^[0-9]{9}$/

  def validate(record)
    if invalid_number?(record)
      record.errors[:phone_number] << "invalid phone number format"
    end
  end

  def invalid_number?(record)
    record.phone_number.present? && !(record.phone_number =~ PHONE_REGEX)
  end

end

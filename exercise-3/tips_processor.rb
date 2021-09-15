# frozen_string_literal: true

class TipsProcessor

  def initialize(form:)
    @form = form
  end

  def call
    SmsNotifier.new.call(text: sms_text)
  end

  private

  attr_reader :form

  def sms_text
    "You tips have been processed. Total amount is: #{total_amount}"
  end

  def tip_calculator
    @tip_calculator ||= TipCalculator.new(amount: form.amount,
                                  discount_percentage: form.discount_percentage,
                                  tip_percentage: form.tip_percentage)
  end

  def total_amount
    @tip_calculator.total
  end

end

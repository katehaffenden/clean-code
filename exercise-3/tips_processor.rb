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

  def tipper
    @tipper ||= TipCalculator.new(amount: form.amount,
                                  discount_percentage: form.discount_percentage,
                                  tip_percentage: form.tip_percentage)
  end

  def total_amount
    @tipper.total
  end

end

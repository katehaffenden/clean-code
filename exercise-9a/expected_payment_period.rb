# frozen_string_literal: true

def expected_payment_period_for(offset)
  payment_month = current_date.prev_month(offset)
  highest_offset = DURATION_MONTHS[:ninety_days]

  if offset == highest_offset
    nil..payment_month.end_of_month
  else
    payment.month.beginning_of_month..payment_month.end_of_month
  end
end



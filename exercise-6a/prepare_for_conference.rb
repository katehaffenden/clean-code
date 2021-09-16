# frozen_string_literal: true

def prepare_for_conference(user_type)
  { attendee: :register, speaker: :wake_up, matz: :make_tea }[user_type]
end

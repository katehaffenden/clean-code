# frozen_string_literal: true

class CreateUserUnit

  def initialize(form)
    @form = form
  end

  def call
    User.create!(email: form.email, phone: form.phone, name: form.name)
  end

end

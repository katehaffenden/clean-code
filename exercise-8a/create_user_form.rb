# frozen_string_literal: true

class CreateUserForm
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :email, :name, :phone

  validates :email, :name, :phone, presence: true

end

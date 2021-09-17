# frozen_string_literal: true

def call
  input = CalculatorInput.new(params: params)
  calculator = Calculator.new(input)

  GetValuationService.new(calculator).call
end


# Some points regarding such an approach:
#   1. It looks beautiful, but why?
#   2. In fact, there is no way easy to debug it and check input params
#   3. ...and no way to describe the code by meaningful naming

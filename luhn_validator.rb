# frozen_string_literal: true

# Luhn algorithm validator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    # TODO: use the integers in nums_a to validate its last check digit
    raise 'No valid credit card number provided' if nums_a.count < 2

    sum = nums_a[0...-1].each_with_index.reduce(0) do |t, (d, i)|
      t + (d.to_i * (i.even? ? 1 : 2)).digits.sum
    end
    nums_a.last == (10 - sum % 10) % 10
  end
end

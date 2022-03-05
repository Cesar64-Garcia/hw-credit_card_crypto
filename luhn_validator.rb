# frozen_string_literal: true

# Luhn algorithm validator
module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)

    raise 'No valid credit card number provided' if nums_a.count < 2

    sum = nums_a[0...-1]
          .reverse
          .each_with_index
          .reduce(0) do |t, (d, i)|
            t + calc_card_digit_value(d, i)
          end
    nums_a.last == calc_checksum(sum)
  end

  def calc_card_digit_value(number, index)
    (number * (index.even? ? 2 : 1)).digits.reduce { |d1, d2| d1 + d2 }
  end

  def calc_checksum(sum)
    (10 - sum % 10) % 10
  end
end

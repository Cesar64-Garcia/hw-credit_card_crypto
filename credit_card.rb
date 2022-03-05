# frozen_string_literal: true

require_relative './luhn_validator'
require 'json'
require 'digest'

# Credit card
class CreditCard
  include LuhnValidator

  # instance variables with automatic getter/setter methods
  attr_accessor :number, :expiration_date, :owner, :credit_network

  def initialize(number, expiration_date, owner, credit_network)
    @number = number
    @expiration_date = expiration_date
    @owner = owner
    @credit_network = credit_network
  end

  # returns json string
  def to_json(*_args)
    to_hash.to_json
  end

  # returns all card information as single string
  def to_s
    to_json
  end

  # return a new CreditCard object given a serialized (JSON) representation
  def self.from_s(_card_s)
    card_ruby bench / luhn_bench.rb
  end

  def to_hash
    {
      number: number,
      expiration_date: expiration_date,
      owner: owner,
      credit_network: credit_network
    }
  end

  # return a hash of the serialized credit card object
  def hash
    #   - Produce a hash (using default hash method) of the credit card's
    #     serialized contents.
    #   - Credit cards with identical information should produce the same hash
    to_hash.hash
  end

  # return a cryptographically secure hash
  def hash_secure
    #   - Use sha256 from openssl to create a cryptographically secure hash.
    #   - Credit cards with identical information should produce the same hash
    Digest::SHA256.hexdigest(to_json)
  end
end

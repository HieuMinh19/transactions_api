# frozen_string_literal: true

class Bank < ApplicationRecord
  validates :name, presence: true, on: :create
end

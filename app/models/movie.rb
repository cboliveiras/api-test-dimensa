# frozen_string_literal: true

class Movie < ApplicationRecord

  validates :title, :genre, :year, :published_at, :description, presence: true
  validates :title, uniqueness: { case_sensitive: false }
end

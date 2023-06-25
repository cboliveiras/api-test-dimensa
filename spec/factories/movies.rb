# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    genre = %w[Action Comedy Drama Horror Thriller].sample
    country = %w[Canada United\ States Brazil].sample

    sequence(:title) { |n| "Movie #{n}" }
    genre { genre }
    year { rand(1900..2023) }
    country { country }
    published_at { 'January 13, 2019' }
    description { 'A sample movie' }
  end
end

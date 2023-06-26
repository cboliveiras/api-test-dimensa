# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesFilterService do
  let(:movies) { create_list(:movie, 3) }

  describe '#filter' do
    context 'with valid params' do
      it 'filters movies by year' do
        params = { year: '2020' }
        filtered_movies = described_class.new(params).filter

        expect(filtered_movies.pluck(:year)).to all(eq('2020'))
      end

      it 'filters movies by genre' do
        params = { genre: 'Action' }
        filtered_movies = described_class.new(params).filter

        expect(filtered_movies.pluck(:genre)).to all(eq('Action'))
      end

      it 'filters movies by country' do
        params = { country: 'United States' }
        filtered_movies = described_class.new(params).filter

        expect(filtered_movies.pluck(:country)).to all(eq('United States'))
      end

      it 'filters movies by published_at' do
        params = { published_at: '2022-01-01' }
        filtered_movies = described_class.new(params).filter

        expect(filtered_movies.pluck(:published_at)).to all(eq('2022-01-01'))
      end
    end

    context 'with invalid params' do
      it 'returns all movies when no params are provided' do
        filtered_movies = described_class.new({}).filter

        expect(filtered_movies).to match_array(movies)
      end
    end
  end
end

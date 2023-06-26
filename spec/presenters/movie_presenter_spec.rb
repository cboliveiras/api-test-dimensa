# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviePresenter do
  let(:movies) do
    [
      double('Movie', id: 1, title: 'Movie 1', genre: 'Action', year: '2022', country: 'United States',
             published_at: 'August 12, 1991', description: 'Description 1'),
      double('Movie', id: 2, title: 'Movie 2', genre: 'Drama', year: '2020', country: 'Canada',
             published_at: 'January 16, 2021', description: 'Description 2')
    ]
  end

  subject { described_class.new(movies) }

  describe '#format_response' do
    it 'formats the movie response correctly' do
      expected_response = [
        { id: 2, title: 'Movie 2', genre: 'Drama', year: '2020', country: 'Canada',
          published_at: '2021/01/16', description: 'Description 2' },
        { id: 1, title: 'Movie 1', genre: 'Action', year: '2022', country: 'United States',
          published_at: '1991/08/12', description: 'Description 1' }
      ]

      expect(subject.format_response).to eq(expected_response)
    end
  end
end

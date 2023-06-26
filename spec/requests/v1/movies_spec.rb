# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  describe 'POST /movies/import' do
    let(:csv_data) { File.read(Rails.root.join('data', 'netflix_titles.csv')) }

    context 'when the import is successful' do
      before { allow_any_instance_of(ImportCsvFileService).to receive(:import?).and_return(true) }

      it 'imports the movies from the CSV file' do
        post '/v1/movies/import', params: { file: csv_data }

        expect(response).to have_http_status(:ok)
        expect(response.body).to include('Import successful')
      end
    end

    context 'when the import fails' do
      before do
        allow_any_instance_of(ImportCsvFileService).to receive(:import?).and_return(false)
        allow_any_instance_of(ImportCsvFileService).to receive(:errors).and_return(["Title can't be blank"])
      end

      it 'returns an array with errors' do
        post '/v1/movies/import', params: { file: nil }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Title can't be blank")
        expect(Movie.count).to eq(0)
      end
    end
  end

  describe 'GET /movies' do
    let!(:movies) { create_list(:movie, 3) }

    it 'returns a JSON response with formatted movie data' do
      get '/v1/movies'

      expect(response).to have_http_status(:ok)

      response_body = JSON.parse(response.body)
      expect(response_body.size).to eq(movies.size)
    end
  end
end

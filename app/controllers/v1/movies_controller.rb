# frozen_string_literal: true

module V1
  class MoviesController < ApplicationController
    def import
      csv_text = File.read(Rails.root.join('data', 'netflix_titles.csv'))
      service = ImportCsvFileService.new(csv_text)

      if service.import?
        render json: { message: 'Import successful' }, status: :ok
      else
        render json: { errors: service.errors }, status: :unprocessable_entity
      end
    end

    def index
      movies = MoviesFilterService.new(params).filter
      presenter = MoviePresenter.new(movies)

      render json: presenter.format_response, status: :ok
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :description, :year, :genre, :country, :published_at)
    end
  end
end

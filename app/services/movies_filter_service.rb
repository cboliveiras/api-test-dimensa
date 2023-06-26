# frozen_string_literal: true

class MoviesFilterService
  def initialize(params)
    @params = params
  end

  def filter
    movies = Movie.order(:year)
    movies = movies.where(year: @params[:year]) if @params[:year].present?
    movies = movies.where(genre: @params[:genre]) if @params[:genre].present?
    movies = movies.where(country: @params[:country]) if @params[:country].present?

    if @params[:published_at].present?
      year = @params[:published_at]
      movies = movies.where("published_at LIKE ?", "%#{year}%")
    end

    movies
  end

  private

  def extract_year(date)
    Date.parse(date).year
  end
end

# fro zen_string_literal: true

class MoviesFilterService
  def initialize(params)
    @params = params
  end

  def filter
    movies = Movie.order(:year)
    movies = movies.where(year: @params[:year]) if @params[:year].present?
    movies = movies.where(genre: @params[:genre]) if @params[:genre].present?
    movies = movies.where(country: @params[:country]) if @params[:country].present?
    movies = movies.where(published_at: @params[:published_at]) if @params[:published_at].present?

    movies
  end
end

# frozen_string_literal: true

class MoviePresenter
  def initialize(movies)
    @movies = movies
  end

  def format_response
    @movies.sort_by(&:year).map do |movie|
      {
        id: movie.id,
        title: movie.title,
        genre: movie.genre,
        year: movie.year,
        country: movie.country,
        published_at: format_date(movie.published_at),
        description: movie.description
      }
    end
  end

  private

  def format_date(date)
    return unless date

    formatted_date = date.gsub('\\', '')
    parsed_date = Date.parse(formatted_date)
    parsed_date.strftime('%Y/%m/%d')
  end
end

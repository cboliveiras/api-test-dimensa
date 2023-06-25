# frozen_string_literal: true
require 'csv'

class ImportCsvFileService
  attr_accessor :errors

  def initialize(csv_text)
    @csv_text = csv_text
    @errors = []
  end

  def import?
    csv = CSV.parse(@csv_text, headers: true)
    csv.each do |row|
      movie_attributes = {}
      row.each do |column, value|
        next unless column_mapping.key?(column)
        # binding.pry

        attribute = column_mapping[column]
        movie_attributes[attribute] = value
      end

      movie = Movie.create(movie_attributes)

      handle_error(movie) unless movie.persisted?
    end

    @errors.empty? ? true : false
  end

  private

  def column_mapping
    {
      'type' => :genre,
      'title' => :title,
      'country' => :country,
      'release_year' => :year,
      'date_added' => :published_at,
      'description' => :description
    }
  end

  def handle_error(movie)
    @errors << "#{movie.errors.full_messages.join(', ')}"
  end
end



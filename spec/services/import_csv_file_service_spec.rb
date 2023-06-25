# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportCsvFileService do
  describe '#import?' do
    let(:csv_text) { File.read(Rails.root.join('data', 'netflix_titles.csv')) }
    let(:service) { ImportCsvFileService.new(csv_text) }

    context 'when import is successful' do
      it 'returns true and has no errors' do
        expect(Movie).to receive(:create).exactly(131).times.and_return(double('Movie', persisted?: true))

        expect(service.import?).to be true
        expect(service.errors).to be_empty
      end
    end

    context 'when import fails' do
      it 'returns false and captures errors' do
        expect(Movie).to receive(:create).exactly(131).times.and_return(double('Movie', persisted?: false,
                                                                                      errors: double(
                                                                                        'errors',
                                                                                        full_messages: ['Error message']
                                                                                      )))

        expect(service.import?).to be false
        expect(service.errors).to eq(Array.new(131, 'Error message'))
      end
    end
  end
end

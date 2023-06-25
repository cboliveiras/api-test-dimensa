require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:published_at) }
    it { should validate_presence_of(:description) }
  end
end

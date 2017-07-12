require 'rails_helper'

RSpec.describe User, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:email) }

  it { should have_many(:articles) }
end

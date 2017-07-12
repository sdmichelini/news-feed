require 'rails_helper'

# Test suite for the Article model
RSpec.describe Article, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:shared_by) }
  it { should validate_presence_of(:url) }

  it { should belong_to(:user) }
end
class Article < ApplicationRecord
    belongs_to :user
    # validations
    validates_presence_of :title, :url, :shared_by
end

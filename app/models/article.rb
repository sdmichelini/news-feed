class Article < ApplicationRecord
    belongs_to :user, optional: true
    # validations
    validates_presence_of :title, :url, :shared_by
end

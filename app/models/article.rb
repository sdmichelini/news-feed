class Article < ApplicationRecord
    # validations
    validates_presence_of :title, :url, :shared_by
end

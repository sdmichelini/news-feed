class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates_presence_of :username, :email, :password
end

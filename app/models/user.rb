class User < ApplicationRecord
  has_one :superior, class_name: :User
  has_many :employees, class_name: :User, foreign_key: :superior_id
end

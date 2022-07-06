class Like < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
end

Like.create(author: first_user, post: first_post)

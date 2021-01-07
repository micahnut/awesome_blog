class Micropost < ApplicationRecord
        belongs_to :user

        default_scope -> { order('created_at DESC') }

        validates :content, presence: true, length: {minimum: 1, maximum: 140 }

        validates :user_id, presence: true
end

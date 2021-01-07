class Relationship < ApplicationRecord
    #since there is neither a Followed nor a follower model,
    # we need to supply the class name User

    belongs_to :follower, class_name: "User"
    belongs_to :followed, class_name: "User"
    validates :follower_id, presence: true
    validates :followed_id, presence: true
end

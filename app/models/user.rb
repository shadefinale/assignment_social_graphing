class User < ActiveRecord::Base
  has_many :posts

  has_many :initiated_followings, foreign_key: :following_id,
                                  class_name: "Following"
  has_many :followed_users, through: :initiated_followings,
                            source: :follow_recipient

  has_many :received_followings, foreign_key: :followed_id,
                                  class_name: "Following"
  has_many :following_users, through: :received_followings,
                            source: :follow_initiator
end

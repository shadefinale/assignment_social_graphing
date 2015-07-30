class Following < ActiveRecord::Base
  belongs_to :follow_initiator, foreign_key: :following_id,
                                class_name: "User"

  belongs_to :follow_recipient, foreign_key: :followed_id,
                                class_name: "User"

  validates :following_id, uniqueness: {scope: :followed_id}
end

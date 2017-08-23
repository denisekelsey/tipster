class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email

  validates :message, presence: true, length: { maximum: 200, minimum: 3 }
 

  RATINGS = {
    "0stars.png": '0_stars',
    "1star.png":  '1_star',
    "2stars.png": '2_stars',
    "3stars.png": '3_stars',
    "4stars.png": '4_stars',
    "5stars.png": '5_stars' 
  }

  def rating_image
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
  
  
end

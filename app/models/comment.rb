class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :place
  after_create :send_comment_email
 

  RATINGS = {
    "1star.jpg":  '1_star',
    "2stars.png": '2_stars',
    "3stars.png": '3_stars',
    "4stars.jpg": '4_stars',
    "5stars.png": '5_stars'
  }

  def rating_image
    RATINGS.invert[self.rating]
  end

  def send_comment_email
    NotificationMailer.comment_added(self).deliver
  end
  
  
end

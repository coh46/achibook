class Topic < ActiveRecord::Base
    validates :title, presence: true
    
    mount_uploader :picture, AvatarUploader
    
    belongs_to :user
    
end

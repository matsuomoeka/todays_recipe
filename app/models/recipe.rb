class Recipe < ApplicationRecord
  belongs_to :user
  has_one_attached :recipe_image
  
  #validates :title, precense: true
  #validates :body, precence: true
  
  #def get_recipe_image(width,height)
    #unless recipe_image.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      #recipe_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    #end
    #recipe_image.variant(resize_to_limit: [width,height]).processed
  #end
  
  def get_recipe_image(width,height)
    unless recipe_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      recipe_image.attach(io:File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      recipe_image.variant(resize_to_limit: [width,height]).processed
  end
  
end
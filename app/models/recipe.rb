class Recipe < ApplicationRecord
    belongs_to :user
    attachment :image
    
    # with_options presence: true do
    #     validates :title
    #     validates :image
    #     validates :body
    # end
end

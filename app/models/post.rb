class Post < ApplicationRecord
    
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :title_must_have_clickbait

    def title_must_have_clickbait    
        unless title.match?(/Won't Believe/)
            errors.add(:title, "Must contain clickbait!") 
        end
    end
    
end

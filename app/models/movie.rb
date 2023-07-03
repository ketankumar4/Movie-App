class Movie < ApplicationRecord

    validates :name, presence: true, uniqueness: {scope: :name}
    validates :detail, presence: true

    def favourite?
        self.fav == true
    end

    def button_text
        if self.fav == true
            "remove from fav list"
        elsif self.fav == false
            "add to fav list"
        end
    end
end

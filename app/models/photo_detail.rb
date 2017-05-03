class PhotoDetail < ActiveRecord::Base
    
    def self.photo (year=2010)
        
        return PhotoDetail.where("strftime('%Y',date_taken) >= ?", year.to_s)

    end
end

class IndexController < ApplicationController
    def main
       @photos = PhotoDetail.photo
       gon.photos = @photos
    end
end

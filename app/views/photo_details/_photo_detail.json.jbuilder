json.extract! photo_detail, :id, :title, :place_taken, :date_taken, :link, :story, :created_at, :updated_at
json.url photo_detail_url(photo_detail, format: :json)
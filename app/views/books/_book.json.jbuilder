json.extract! book, :id, :title, :author, :status, :checked_out_by, :library_zone_id, :created_at, :updated_at
json.url book_url(book, format: :json)

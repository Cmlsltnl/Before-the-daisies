json.array!(@items) do |item|
  json.extract! item, :id, :title, :description, :location, :completed, :importance, :completed_date, :user_id
  json.url item_url(item, format: :json)
end

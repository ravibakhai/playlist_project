json.array!(@playlists) do |playlist|
  json.extract! playlist, :id, :name, :url, :image, :description, :comment
  json.url playlist_url(playlist, format: :json)
end

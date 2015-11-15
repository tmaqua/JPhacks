json.array!(@plains) do |plain|
  json.extract! plain, :id, :boke, :tsukkomi
  json.url plain_url(plain, format: :json)
end

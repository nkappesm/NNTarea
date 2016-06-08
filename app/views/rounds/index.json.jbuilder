json.array!(@rounds) do |round|
  json.extract! round, :id, :result
  json.url round_url(round, format: :json)
end

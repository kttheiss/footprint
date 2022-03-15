json.extract! footprint_tally, :id, :footprint_level_word,
              :footprint_level_number, :created_at, :updated_at
json.url footprint_tally_url(footprint_tally, format: :json)

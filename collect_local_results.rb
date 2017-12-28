require 'google/apis/customsearch_v1'

locations = [
	'Pill Hill',
	'Lakeshore',
]

services = [
	'home improvement',
	'house remodeling',
	'Commercial tenant improvement',
	'handicap accessible restroom',
	'Restaurant remodel',
	'Retail TI',
	'Office tenant improvement',
	'General contractor',
	'building addition',
	'building permit',
	'residential remodels',
	'Kitchen construction',
	'Kitchens',
	'Master Bath',
	'Guest Bathroom',
	'Bathrooms',
	'Redwood Deck',
	'deck builder',
	'Timberline Decks',
	'Trex synthetic Decking',
	'Ipe balcony',
	'Seismic Retrofit',
	'bearing walls',
	'window Retrofitting',
	'Door installation',
	'framing',
	'post and beam',
	'finish carpentry',
	'hardwood flooring',
	'tile',
	'sheetrock',
	'paint',
	'electrical',
	'restoration',
	'victorian',
	'Craftsman',
	'Mid Century Modern',
	'Thermador',
	'Viking',
	'Heath Tile',
	'Ceaserstone',
]

filename = "search_results_" + Time.now.utc.iso8601
file = File.new(filename, 'w')

searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
searcher.key = ENV['CUSTOM_SEARCH_API_KEY']
engine = "001373072520138917942:w1tlsaygtke"


locations.each do |location|
	services.each do |service|
		query = location + " " + service
		puts "searching for #{query}"
		result = searcher.list_cses(query, {cx: engine})
		file.puts result.to_json
	end
end

file.close
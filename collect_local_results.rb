require 'google/apis/customsearch_v1'

locations = [
	'Piedmont',
	'Montclair',
]

services = [
	'home improvement',
	'seismic retrofit',
]

filename = "search_results_" + Time.now.utc.iso8601
file = File.new(filename, 'w')

searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
searcher.key = ENV['CUSTOM_SEARCH_API_KEY']
engine = "001373072520138917942:w1tlsaygtke"


locations.each do |location|
	services.each do |service|
		query = location + " " + service
		result = searcher.list_cses(query, {cx: engine})
		file.puts result.to_json
	end
end

file.close
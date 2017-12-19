require 'google/apis/customsearch_v1'

locations = [
	'Piedmont',
]

services = [
	'home improvement',
]


searcher = Google::Apis::CustomsearchV1::CustomsearchService.new
searcher.key = ENV['CUSTOM_SEARCH_API_KEY']

result = searcher.list_cses("what", {cx: "001373072520138917942:w1tlsaygtke"})

p result

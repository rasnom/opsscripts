require 'json'

summary = File.open('summary.csv','w')

File.readlines('search_results_2017-12-19T22:49:43Z').each do |line|
	results = JSON.parse(line)
	p results['queries']['request'][0]['searchTerms']
end

summary.close

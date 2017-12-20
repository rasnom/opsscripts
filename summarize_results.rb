require 'json'

summary = File.open('summary.csv','w')

File.readlines('search_results_2017-12-19T22:49:43Z').each do |line|
	toWrite = []
	results = JSON.parse(line)
	toWrite << results['queries']['request'][0]['searchTerms']
	results['items'].each do |result|
		toWrite << result['link']
	end
	summary.puts toWrite.join(',')
end

summary.close

set -ev
require 'open-uri'
require 'json'
data = open("http://finracrd.elasticbeanstalk.com/").read
puts data
build = JSON.parse(data)
curr_id =  build[0]["buildid"]
id =  (curr_id.to_i).to_s
puts "http://finracrd.elasticbeanstalk.com/results/#{id}/integration/PASS"
data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/integration/PASS").read
=begin
uri = URI('http://finracrd.elasticbeanstalk.com/')
req = Net::HTTP::Post.new(uri)
req.set_form_data('buildid' => curr_id + 1)
#res = Net::HTTP.post_form(uri, 'buildid' => curr_id+1)


Net::HTTP.new('http://finracrd.elasticbeanstalk.com/').start { |http|
	http.request(req)
}
=end
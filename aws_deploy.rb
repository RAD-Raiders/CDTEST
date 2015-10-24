require 'open-uri'
require 'json'
require 'net/ping'
data = open("http://finracrd.elasticbeanstalk.com/").read
puts data
build = JSON.parse(data)
curr_id =  build[0]["buildid"]
id =  (curr_id.to_i).to_s
puts "http://finracrd.elasticbeanstalk.com/results/#{id}/health/PASS"
data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/health/PASS").read


def up?(host)
    check = Net::Ping::External.new(host)
    check.ping?
end

chost = 'http://rails-env-dev-jmzm5tk3fp.elasticbeanstalk.com/'
if up?(chost) # returns true if ping replies
	puts "http://finracrd.elasticbeanstalk.com/results/#{id}/smoke/PASS"
	data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/smoke/FAIL").read
else
	puts "http://finracrd.elasticbeanstalk.com/results/#{id}/smoke/PASS"
    data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/smoke/FAIL").read
end
=begin
uri = URI('http://finracrd.elasticbeanstalk.com/')
req = Net::HTTP::Post.new(uri)
req.set_form_data('buildid' => curr_id + 1)
#res = Net::HTTP.post_form(uri, 'buildid' => curr_id+1)


Net::HTTP.new('http://finracrd.elasticbeanstalk.com/').start { |http|
	http.request(req)
}
=end
require 'open-uri'
require 'json'
require 'active_record'
data = open("http://finracrd.elasticbeanstalk.com/").read
puts data
build = JSON.parse(data)
curr_id =  build[0]["buildid"]
id =  (curr_id.to_i + 1).to_s
puts "http://finracrd.elasticbeanstalk.com/results/#{id}/unit/FAIL"
data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/unit/FAIL").read


puts "http://finracrd.elasticbeanstalk.com/results/#{id}/deploy/FAIL"
data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/deploy/FAIL").read

puts "http://finracrd.elasticbeanstalk.com/results/#{id}/build/FAIL"
data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/build/FAIL").read

puts "http://finracrd.elasticbeanstalk.com/results/#{id}/health/FAIL"
data = open("http://finracrd.elasticbeanstalk.com/results/#{id}/health/FAIL").read
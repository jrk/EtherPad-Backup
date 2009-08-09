require 'net/http'
require 'net/https'
# no idea wtf im doing :)
username  = ""
email     = ""
password  = ""
format    = "txt"
path      = "https://#{username}.etherpad.com/ep/account/sign-in?cont=https%3a%2f%2f#{username}.etherpad.com%2f"

http = Net::HTTP.new("#{username}.etherpad.com", 443)
http.use_ssl = true
http.start do |http|
  resp, data = http.get(path, nil)
  cookie = resp.response['set-cookie']
  data = "email=#{email}&password=#{password}"
  headers = {
    'Cookie'       => cookie,
    'Referer'      => 'http://etherpad.com',
    'Content-Type' => 'application/x-www-form-urlencoded'
  }
  resp, data = http.post(path, data, headers)
  pad = 3 # just testing
  getfile = Net::HTTP::Get.new("https://#{username}.etherpad.com/ep/pad/export/#{pad}/latest?format=txt")
  asdf = http.request(getfile)
  ans = asdf.body
  puts ans
end

  
#rescue SocketError
#  raise "Host " + host 
#end
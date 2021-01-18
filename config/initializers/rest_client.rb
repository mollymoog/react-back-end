require 'rest-client'
require 'rails/configuration'


page_num = rand(1..40)
num_pics = 25
images_url = "https://picsum.photos/v2/list?page=#{page_num}&limit=#{num_pics}"

data = JSON.parse(RestClient.get("#{images_url}"))

data.each.with_index(1) do |image, index|
    newer_image = Image.new(url: image["download_url"])
    
    if index.even?
        newer_image.color = "team1"
    elsif index == 17
        newer_image.color = "dead"
    else
        newer_image.color = "team2"
    end
    newer_image.save
end


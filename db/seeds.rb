# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

image_url = 'https://picsum.photos/200'

16.times do Image.create(
    url: image_url
)
end



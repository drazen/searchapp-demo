puts "Deleting all products..."
Product.delete_all

i = 0
length = 5

while i < ENV['MILLION'].to_i * 1000000 do
  print "Generating products..."

  random1 = (0...length).map { (65 + rand(26)).chr }.join
  random2 = (0...length).map { (65 + rand(26)).chr }.join
  random3 = (0...length).map { (65 + rand(26)).chr }.join
  if i % 100 == 0
    random3 = ENV['WORD']
    print "#{ENV['WORD'].pluralize} be here!"
  end
  product_name = random1 + " " + random2 + " " + random3
  product_description = rand(5..100).times.reduce(" ") {|desc| desc << (0...length).map { (65 + rand(26)).chr }.join }
  product_price = rand(1000)

  Product.create name: product_name, description: product_description, price: product_price, published_on: rand(5).days.ago.utc

  i += 1
end

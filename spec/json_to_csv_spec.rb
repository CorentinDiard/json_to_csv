require 'json'
require 'csv'
require 'ostruct'

puts "Verifying json file"

file_path = File.expand_path('resources/json/users.json')

puts "It should be an existing users.json file in resources folder"

  if File.exist?(file_path)
    puts "\e[32mtrue\e[0m"
  else
    puts "\e[31mfile doesn't exist\e[0m"
  end

puts "It should be good format json"

  file = File.open(file_path)
  users = JSON.load file
  users = JSON.parse(users.to_json, object_class: OpenStruct)

  no_break = true

  users.each_with_index do |user, index|
    unless user.id.is_a? Integer
      puts "\e[31mid value is not an integer or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
    unless user.email.is_a? String
      puts "\e[31memail value is not a String or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
    unless user.tags.is_a? Array
      puts "\e[31mtags value is not an Array or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
    unless user.profiles.facebook.id.is_a? Integer
      puts "\e[31mfacebook id value is not an Integer or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
    unless user.profiles.facebook.picture.is_a? String
      puts "\e[31mfacebook picture value is not an string or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
    unless user.profiles.twitter.id.is_a? Integer
      puts "\e[31mtwitter id value is not an Integer or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
    unless user.profiles.twitter.picture.is_a? String
      puts "\e[31mtwitter picture value is not an string or nil, array index #{index}\e[0m"
      no_break = false
      break
    end
  end
  
if no_break
  puts "\e[32mtrue\e[0m"
  puts "\e[32m0 failures good job\e[0m" 
end

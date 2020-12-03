module JsonToCsv
  require 'json'
  require 'csv'
  require 'ostruct'

  file = File.open("resources/json/users.json")
  my_hash = JSON.load file
  json = JSON.parse(my_hash.to_json, object_class: OpenStruct)

  CSV.open("resources/csv/converted_file.csv", "wb",
  :write_headers => true,
  :headers => ["Id", "email", "tags", "profiles.facebook.id", "profiles.facebook.picture", "profiles.twitter.id", "profiles.twitter.picture"]) do |csv|
    json.each do |object|
      csv << [object.id, object.email, object.tags.join(","), object.profiles.facebook.id, object.profiles.facebook.picture, object.profiles.twitter.id, object.profiles.twitter.picture ]
    end
  end
end
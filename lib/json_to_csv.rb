module JsonToCsv
  require 'json'
  require 'csv'
  require 'ostruct'

  file = File.open("resources/json/users.json")
  users = JSON.load file
  users = JSON.parse(users.to_json, object_class: OpenStruct)

  CSV.open("resources/csv/users.csv", "wb",
  :write_headers => true,
  :headers => ["id", "email", "tags", "profiles.facebook.id", "profiles.facebook.picture", "profiles.twitter.id", "profiles.twitter.picture"]) do |csv|
    users.each do |user|
      csv << [user.id, user.email, user.tags.join(","), user.profiles.facebook.id, user.profiles.facebook.picture, user.profiles.twitter.id, user.profiles.twitter.picture ]
    end
  end
end
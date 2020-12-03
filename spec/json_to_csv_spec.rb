require 'json'
require 'csv'
require 'ostruct'

describe "Verifying json file" do
  file_path = File.expand_path('resources/json/users.json')

  it "Should be an existing users.json file in resources folder" do
    expect(File.exist?(file_path)).to be true
  end

  it "Should be good format json" do
    file = File.open(file_path)
    users = JSON.load file
    users = JSON.parse(users.to_json, object_class: OpenStruct)

    users.each do |user|
      expect(user.id).to be_an(Integer)
      expect(user.email).to be_an(String)
      expect(user.tags).to be_an(Array)
      expect(user.profiles.facebook.id).to be_an(Integer)
      expect(user.profiles.facebook.picture).to be_an(String)
      expect(user.profiles.twitter.id).to be_an(Integer)
      expect(user.profiles.twitter.picture).to be_an(String)
    end
  end
end

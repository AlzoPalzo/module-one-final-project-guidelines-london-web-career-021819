# require 'net/http'
# require "rest-client"
# require 'json'
# require 'pry'
# require 'launchy'

  #TOKEN = qiUbrTcu1VFoibIyvd1OkO7nbW6AywKVHUPNTd8F

  # URL = "https://freesound.org/apiv2/search/text/?query="

  def welcome
    puts "Find a sample!"
  end

  def get_search_term
    puts "Enter a search term:"
    gets.chomp
  end

  def get_sound(search_term)
    response = RestClient.get("https://freesound.org/apiv2/search/text/?query=#{search_term}&token=qiUbrTcu1VFoibIyvd1OkO7nbW6AywKVHUPNTd8F")
    data = JSON.parse(response)
    sound_ids = data["results"].map{|sound| sound["id"].to_s + " - " + sound["name"]}
    sound_ids
  end

  def get_sample_url
    puts "Input the id of the sound you want"
    sound_id = gets.chomp
    response_json = RestClient.get ("https://freesound.org/apiv2/sounds/#{sound_id}/?fields=name%2Cpreviews&format=json&token=qiUbrTcu1VFoibIyvd1OkO7nbW6AywKVHUPNTd8F")
    response = JSON.parse(response_json)
    path = response["previews"]["preview-hq-mp3"]
    Launchy.open(path)
  end

  def main
    welcome
    search_term = get_search_term
    puts get_sound(search_term)
    get_sample_url
  end

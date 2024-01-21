require 'net/http'
require 'json'

class CharactersController < ApplicationController
  def index
    @characters_by_film = fetch_characters
  end

  private

  def fetch_characters
    uri = URI('https://swapi.dev/api/people')
    response = Net::HTTP.get(uri)
    @characters = JSON.parse(response)['results'].select do |char|
      char['mass'].to_i > 75 && char['mass'] != 'unknown'
    end

    characters_with_details = @characters.map do |char|
      homeworld = fetch_homeworld(char['homeworld'])
      films = fetch_films(char['films'])
      Character.new(char['name'], char['mass'], homeworld, films)
    end

    characters_with_details.group_by { |char| char.films }.transform_values { |chars| chars.sort_by(&:name) }
  end

  def fetch_homeworld(url)
    response = Net::HTTP.get(URI(url))
    JSON.parse(response)['name']
  end

  def fetch_films(film_urls)
    film_urls.map do |url|
      response = Net::HTTP.get(URI(url))
      JSON.parse(response)['title']
    end
  end
end

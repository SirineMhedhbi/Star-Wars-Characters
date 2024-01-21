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
    characters_data = JSON.parse(response)['results'].select do |char|
      char['mass'].to_i > 75 && char['mass'] != 'unknown'
    end

    characters_by_film = {}

    characters_data.each do |char|
      homeworld = fetch_homeworld(char['homeworld'])
      films = fetch_films(char['films'])

      films.each do |film|
        characters_by_film[film] ||= []
        characters_by_film[film] << Character.new(char['name'], char['mass'], homeworld, film)
      end
    end

    characters_by_film.transform_values { |chars| chars.sort_by(&:name) }
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

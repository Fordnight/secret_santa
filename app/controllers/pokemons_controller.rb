class PokemonsController < ApplicationController

  def index
    url = 'https://pokeapi.co/api/v2/pokemon?limit=151&offset=0'
    response = RestClient.get url
    result = JSON.parse response.to_str
    @pokemons = []

    result['results'].each do |idpoke|
      response = RestClient.get idpoke['url']
      temp = JSON.parse response.to_str

       @pokemons << {
        name: temp['forms'][0]['name'],
        image: temp['sprites']['versions']['generation-v']['black-white']['animated']['front_default'],
        abilities: temp['abilities'].map { |ability| ability['ability']['name']},
        type: temp['types'][0]['type']['name']
      }
    end

  end

  def show
    @name = params[:name]

    url = "https://pokeapi.co/api/v2/pokemon/#{@name}"
    response = RestClient.get url
    @result = JSON.parse response.to_str
    name = @result['forms'][0]['name']
    puts "pokemon: #{name}"

    #render json: @result
  end


end
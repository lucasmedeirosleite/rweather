module ApiDoc
  module V1
    module Cities
      extend Dox::DSL::Syntax

      document :api do
        resource 'Cities' do
          endpoint '/api/cities'
          group 'Cities'
        end
      end

      search_params = {
        lat: {
          type: :number,
          required: :required,
          value: -3.72,
          description: 'Location latitude'
        },
        lon: {
          type: :number,
          required: :required,
          value: -38.52,
          description: 'Location longitude'
        }
      }

      document :search do
        action 'Search for a city forecast' do
          path '/api/cities/search'
          verb 'GET'
          params search_params
          desc 'Searches for a city forecast by its latitude and longitude'
        end
      end

      document :random do
        action 'Search random forecasts of cities' do
          path '/api/cities/random'
          verb 'GET'
          desc 'Returs a random collection of cities forecasts'
        end
      end
    end
  end
end

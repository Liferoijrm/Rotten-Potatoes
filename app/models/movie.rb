class Movie < ApplicationRecord
    def self.search_TMDb(movie_name)
        api_key = ENV['TMDB_KEY'] # chave definida no .env
        base_url = "https://api.themoviedb.org/3/search/movie"
    
        response = HTTParty.get(base_url, query: { api_key: api_key, query: movie_name })

        if response.success? && response["results"].any?
            data = response["results"].first # Pega o primeiro resultado da busca
            
            if data["title"].strip.casecmp?(movie_name)
                new(
                    title: data["title"],
                    description: data["overview"],
                    release_date: data["release_date"]
                    # rating = ?     # a API não a classificação indicativa de forma fácil
                )
            else
                nil
            end
        else
            nil
        end
    end
end

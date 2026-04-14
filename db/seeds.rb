# Seed the RottenPotatoes DB with some movies .
more_movies = [
    { title: 'Aladdin', rating: 'G', release_date: Date.new(1992, 11, 25) },
    { title: 'When Harry Met Sally', rating: 'R', release_date: Date.new(1989, 7, 21) },
    { title: 'The Help', rating: 'PG -13 ', release_date: Date.new(2011, 8, 10) },
    { title: 'Raiders of the Lost Ark', rating: 'PG ', release_date: Date.new(1981, 6, 12) }
]

more_movies.each do |movie|
    Movie.create(movie)
end

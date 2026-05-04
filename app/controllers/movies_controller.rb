class MoviesController < ApplicationController
  def index
    sort = params[:sort_by]
    if sort == 'title' || sort == 'release_date'
      @movies = Movie.all.order(sort)
    else
      @movies = Movie.all
    end
  end

  def search_TMDb
    movie_name = params[:query]
    @movie = Movie.search_TMDb(movie_name)
    if @movie && @movie.save
      redirect_to root_path
    else
      flash[:warning] = "'#{params[:query]}' was not found in TMDb"
      redirect_to root_path
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    # instancia um novo movie com o método product_params para segurança
    @movie = Movie.new(movie_params)
    # tenta salvar no banco
    if @movie.save
      redirect_to root_path
    else
      # re-renderiza o form de criação para corrigir campos, com as alterações anteriores salvas
      render :new, status: :unprocessable_entity
    end
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
  end

  def edit
    id = params[:id]
    @movie = Movie.find(id)
  end

  def update
    id = params[:id]
    @movie = Movie.find(id)
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    id = params[:id]
    @movies = Movie.find(id)
    @movies.destroy
    redirect_to movies_path
  end

  private
    def movie_params
      params.expect(movie: [ :title, :description, :rating, :release_date ])
    end
end

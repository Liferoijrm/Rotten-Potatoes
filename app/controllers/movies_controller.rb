class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    # instancia um novo movie com o método product_params para segurança
    @movie = Movie.new(movie_params)
    # tenta salvar no banco
    if @movie.save 
      # redirect_to vai pra página de show
      redirect_to @movie
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

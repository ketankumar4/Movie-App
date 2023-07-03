class MoviesController < ApplicationController

    http_basic_authenticate_with name: "abc", password: "password", only: :destroy
    def index
        if params[:search]
            @movies = Movie.where(name: params[:search])
        else
            @movies = Movie.all
        end
        @fav_movies = Movie.where(fav: true)
    end

    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(new_movie_params)
    
        if @movie.save
          redirect_to @movie
        else
          render :new, status: :unprocessable_entity
        end
    end

    def show
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])
        @movie.update(movie_params)
    
        redirect_to root_path
    end

    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
    
        redirect_to root_path, status: :see_other
    end

    private

    def movie_params
        params.require(:movie).permit(:fav)
    end

    def new_movie_params
        params.require(:movie).permit(:name, :detail, :fav)
    end

end

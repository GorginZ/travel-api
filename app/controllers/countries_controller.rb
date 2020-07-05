class CountriesController < ApplicationController
  before_action :set_country, only: [:show, :update, :destroy]
    def index
      @countries = Country.all
      render json: @countries
    end
  
    def show 
      render json: @country
    end 
  
    def create 
      Country.create(country_params)
      render json: "country", status: 200 
    end 
  
    def update 
      @country.update(country_params)
      render json: "country updated", status: 200
    end 
  
    def destroy
      @country.destroy
      render json: "country entry deleted", status: 200
    end 
  
    private 
  
    def country_params 
      params.require(:country).permit(:name, :description, :url)
    end 
  
    def set_country 
      @bookmark = Bookmark.find(params[:id])
    end 
  end
  
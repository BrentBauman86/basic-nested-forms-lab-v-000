class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new

    2.times {@recipe.ingredients.build}

  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save 
    redirect_to recipe
    else 
      '/'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
      @recipe.ingredients.build
    end
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update(recipe_params)
    redirect_to recipe
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:id, :name, :quantity])
  end
end

class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new

    @recipe.ingredients.build(name: "pep")

    @recipe.ingredients.build(name: "sausage")

  end

  def create
    @recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

  private 

  def recipe_params
    params.require(:recipe).permit(:name)
  end
end

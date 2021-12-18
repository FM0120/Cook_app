class RecipesController < ApplicationController
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new(recipe_params)
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end
  
  
  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to user_path(recipe.user), notice: "レシピを削除しました。"
  end
  
  private
  def recipe_params
     params.require(:recipe).permit(:title, :body, :image, :comment)
  end
  
end

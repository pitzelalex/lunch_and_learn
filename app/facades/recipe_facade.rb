class RecipeFacade
  def self.country(country)
    recipe_data = RecipeService.get(country)

    recipes = recipe_data[:hits].map do |recipe|
      Recipe.new(recipe, country)
    end

    {
      recipes: recipes,
      next_page: recipe_data[:_links][:next][:href]
    }
  end
end

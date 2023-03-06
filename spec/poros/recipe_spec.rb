require 'rails_helper'

RSpec.describe Recipe do
  describe '#initialize' do
    it 'exists and has attributes' do
      recipe_data = JSON.parse(File.read('spec/fixtures/recipe_fixture.json'), symbolize_names: true)

      recipe = Recipe.new(recipe_data, 'thailand')

      expect(recipe).to be_a Recipe
      expect(recipe.title).to eq("Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")
      expect(recipe.url).to eq("https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html")
      expect(recipe.country).to eq('thailand')
      expect(recipe.id).to eq(nil)
      expect(recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/611/61165abc1c1c6a185fe5e67167d3e1f0.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEFEaCXVzLWVhc3QtMSJHMEUCIQDCTR9hfSHbiJ0IGU6lb2qSmqlW9JVQi4MAYMc47uBvBgIgIL3kCQxla3yCuOJoWgQnGD9ocv5%2BwJgLMmVOAeguMR8qwgUI%2Bv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDPFKZlWj0dadjWCFZSqWBbsG66bbSrza%2Fn%2BRDuscx4B8k5IklSL0lz%2FJvCBeYhUUlEAGqtIruaqxFdqWwQRM35hR4GpWTv8Ijt7PKiXjBU3X%2BJ3ylTAuDQc3srOHCC43LM4RhmTOI%2BJClDqjiRVImFjaMisYx1vMo82qxMOb8HS9rv%2FcY1MoX117AqxkXnaqAcXDwNI27f6UUXhYcBgm86rfFZjBYXYmli6PazVXLoyvzbG5CkfatHso3KWn7mywVMvsjOP9fG04lthyk%2F5KklmIP5t6AVn9J2Zm%2FPCwAR1kWJUC9D4zRbqVN6QLPmth%2FTybx8EO8Dn1XkQ8w8GmMz4Eh4aUBSRFIHTwnG2ThaTsgUG%2BLlvBfek%2B8OlvdBAIXSRIR8rHthGPEEH2FB0ahzbNMt1uaXvBHOdhEMdD1yOai0qeo7WCKlu5EYDjBj7E15M6FJI2d2VJksPDbI18JSGib214AKAkbIEhSeKn9Us9LAIzCORVG51MI0KH9CbRzDMyBEyCmxMMV8pECjLEv%2Ffwz%2Ff0w6jdTbxFEwLkijhDRHN3Ovbs%2BgjadUGbz%2FGbEma2YZjIqRlnM1rFHnnjG%2F4oz9lOfvYZRp%2BE3Xk4luJAl0tbVDcyj9uIjMXGOnyNnxEj9RCC1eH6cMz57nMaFZDRzdQrRTeHP2zbbgXfrlMKjDK2hmqQVNDfpkKA24akaKP1MLGwuYyKbG1jLIxzePCqZ7M%2BKzpmZvyoFggmeyukIVCojdJT%2BiCMEnGW6REWLfFY0Js11z%2Fysel0BcINwNdZKNqcv74RJI6OGkoiaLJ%2BXLAhlP32DaKQd6p1hHAxeoJGTj2NEUtzu%2FY5qQ%2FKmXAZQlRMk5JyAUikzZ4vJBRpXpk1u5YCcJ92yUpAg%2FdlWS8L%2BqG9MMzxlKAGOrEBeDJOakfIzUGV2HZxPQhTYM77lL7lGzev8dc3Yfqz2RbL4XygCjW%2FOY75AykdxypO0V0MJBLYNvBgWjxmeEUH3hi5SZSsKCk4Tmsm6JBpC2hUrqc0e7ArRMKQSCV%2Bs0ziEvmjnCMCVM2h%2FSSTXkm8MSCRWi6P0QipTwHdXzGjFeKOUn2c%2FyHewGNe5Tlh1YvhNUX3S5H1MC2vsibNcKXTwnYjn7c2dCiKNyytbiETcoty&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20230306T020955Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFDD7JSXSH%2F20230306%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=804b9d10c6f125061b800c685ecc414c9b3292fee847aac6ca72113593018dbd")
    end
  end
end

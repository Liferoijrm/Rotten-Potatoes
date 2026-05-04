When('I follow {string}') do |link_name|
  click_link link_name
end

When('I sort the movies by title') do
  click_link "Movie Title"
end

When('I select {string} from {string}') do |option, field|
    select option, from: field
end

Then('I should be on the Create New Movie page') do
  expect(page).to have_current_path(new_movie_path)
end

Then('I should see {string} before {string}') do |item1, item2|
  expect(page.body).to match(/#{item1}.*#{item2}/m)
end

# Steps do Scenario declarativo
When('I add {string} to the movies list with rating {string}') do |title, rating|
  steps %Q{
    When I follow "Add new movie"
    And I fill in "Title" with "#{title}"
    And I select "#{rating}" from "Rating"
    And I press "Save Changes"
  }
end
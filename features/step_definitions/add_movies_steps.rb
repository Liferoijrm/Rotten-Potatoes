Given('I am on the RottenPotatoes home page') do
  visit root_path
end

Then('I should see {string}') do |string|
  expect(page).to have_content(string)
end

When('I fill in {string} with {string}') do |field, content|
  fill_in field, with: content
end

When('I press {string}') do |button_name|
  click_button button_name
end

Then('I should be on the RottenPotatoes home page') do
  expect(page).to have_current_path(root_path)
end
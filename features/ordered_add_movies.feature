Feature: User can order movie list by title
    As a movie fan 
    So that I can order the movie list by title in alphabetical order without manual tedium
    I want to see the list ordered after pressing "Movie title"

Scenario: View movie list after adding 2 movies (Imperative)
  Given I am on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Zorro"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  When I follow "Add new movie"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Apocalypse Now"
  And I select "R" from "Rating"
  And I press "Save Changes"
  Then I should be on the RottenPotatoes home page
  When I follow "Movie Title"
  Then I should see "Apocalypse Now" before "Zorro"

Scenario: View movie list after adding 2 movies (Declarative)
  Given I am on the RottenPotatoes home page
  When I add "Zorro" to the movies list with rating "PG"
  And I add "Apocalypse Now" to the movies list with rating "R"
  Then I should be on the RottenPotatoes home page
  When I sort the movies by title
  Then I should see "Apocalypse Now" before "Zorro"
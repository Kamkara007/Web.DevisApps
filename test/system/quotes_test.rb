require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    @quote = quotes(:first) # Reference to the first fixture quote
  end

  test "Creating a new quote" do
    #when the user visits the Quotes#index page
    #they should see and a list of quotes
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    #when the user clicks on "New Quote"
    #they should be on the Quotes#new page
    click_on "New Quote"
    assert_selector "a", text: "Create a new quote"

    #when we fill in the name input with "capybara Quote"
    #and click on "Create Quote"
    fill_in "Name", with: "Capybara Quote"
    click_on "Create Quote"

    #we expect to be back on the page with the title "Quotes"
    #and we see "capybara Quote" added to the list

    assert_selector "h1", text: "Quotes"
    assert_text "Capybara Quote"
  end

  test "Showing a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    assert_text "First quote"
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
    assert_text "First quote"
    
    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"

    fill_in "Name", with: "Updated quote"
    click_on "Update Quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Deleting a quote" do
    visit quotes_path
    assert_text "First quote"
    click_on "Delete", match: :first
    assert_no_text "First quote"
  end

end

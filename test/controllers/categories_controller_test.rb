require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "John", email: "John@example.com", password: "password", admin: true) # simulate an Admin is logged in
  end
  
  test "should get categories index" do
    get :index 
    assert_response :success
  end
  
  test "should get new" do
    session[:user_id] = @user.id # simulate a logged in user (Admin John)
    get :new
    assert_response :success
  end
  
  test "should get show" do
    get(:show, {'id' => @category.id}) # will generate route to specific id
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post :create, category: { name: "sports" } # when trying to post 'create' a category, redirect to categories_path b/c user is not Admin. The category count does not change.
    end
    assert_redirected_to categories_path
  end
  
end
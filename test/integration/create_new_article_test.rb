require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest

  def setup 
    @user = User.create(username: "john", email: "john@gmail.com", password: "password", admin: false)
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post_via_redirect articles_path, article: {title: "Test Article", description: "IntegrationTestRocks", category_ids: 2}
    end

  end

end

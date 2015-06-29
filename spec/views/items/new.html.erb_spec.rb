require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :title => "MyString",
      :description => "MyText",
      :location => "MyString",
      :completed => false,
      :importance => 1,
      :user_id => 1
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "textarea#item_description[name=?]", "item[description]"

      assert_select "input#item_location[name=?]", "item[location]"

      assert_select "input#item_completed[name=?]", "item[completed]"

      assert_select "input#item_importance[name=?]", "item[importance]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"
    end
  end
end

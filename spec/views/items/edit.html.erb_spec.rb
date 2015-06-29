require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :title => "MyString",
      :description => "MyText",
      :location => "MyString",
      :completed => false,
      :importance => 1,
      :user_id => 1
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input#item_title[name=?]", "item[title]"

      assert_select "textarea#item_description[name=?]", "item[description]"

      assert_select "input#item_location[name=?]", "item[location]"

      assert_select "input#item_completed[name=?]", "item[completed]"

      assert_select "input#item_importance[name=?]", "item[importance]"

      assert_select "input#item_user_id[name=?]", "item[user_id]"
    end
  end
end

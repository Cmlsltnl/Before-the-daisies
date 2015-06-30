require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      sign_in user
      
    assign(:items, [
      Item.create!(
        :title => "Title",
        :description => "MyText",
        :location => "Location",
        :completed => false,
        :importance => 1,
        :user_id => 1,
        :completed_date => "september"
        
      ),
      Item.create!(
        :title => "Title",
        :description => "MyText",
        :location => "Location",
        :completed => false,
        :importance => 1,
        :user_id => 1,
        :completed_date => "september"
       
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_i, :count => 2
    assert_select "tr>td", :text => 1.to_i, :count => 2
    assert_select "tr>td", :text => "september".to_s, :count => 2
  

  end
end

FactoryGirl.define do

  factory :user do
    username "John"
    email 'user@user.com'
    password "password"
    password_confirmation "password"
  end

  factory :item do
    title 'climb'
    description 'climb mountain'
  end

 factory :user_with_items, :parent => :user do |user|
    items {build_list(:item, 3)}
  end
end 


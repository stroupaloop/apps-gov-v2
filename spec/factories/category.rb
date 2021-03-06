FactoryGirl.define do
  factory :category do
    sequence(:name) { |n| "Subcategory-#{n}" }

    trait :with_products do
      after(:create) do |category|
        products = create_list(:product, 3)
        subcategory = create(:subcategory, category: category)
        sub_subcategory = create(:sub_subcategory, subcategory: subcategory)
        products.each do |product|
          create(
            :product_sub_subcategory,
            sub_subcategory: sub_subcategory,
            product: product
          )
        end
      end
    end
  end
end

FactoryBot.define do
  factory :book do
    # Define the attributes for the book
    title { 'Book 1' }
    author { 'John Doe' }
    status { 'available' }
    checked_out_by { nil }
  end
end

require "csv"

Book.destroy_all
Publisher.destroy_all

filename = Rails.root.join("db/bookPublishingData.csv")

puts "Reading in the file from here #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

books.each do |book|
  publisher = Publisher.find_or_create_by(publisher_name: book["Publisher"])

  if publisher.valid?
    new_book = publisher.books.create(
      book_name: book["Book_Name"],
      publishing_year: book["Publishing_Year"],
      language_code: book["Language_Code"],
      book_average_rating: book["Book_Average_Rating"],
      book_ratings_count: book["Book_Ratings_Count"],
      genre: book["Genre"],
      gross_sales: book["Gross_Sales"],
      sale_price: book["Sale_Price"],
      sale_rank: book["Sale_Rank"],
      units_sold: book["Units_Sold"]
    )
    puts "Unable to create the book #{book["Book_Name"]}" unless new_book.valid?
  else
    puts "Unable to create the publisher name #{book["Publisher"]}"
  end
end

puts "Created #{Publisher.count} Publishers"
puts "Created #{Book.count} Books"

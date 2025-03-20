require "csv"

Book.destroy_all
Publisher.destroy_all

filename = Rails.root.join("db/bookPublishingData.csv")

puts "Reading in the file from here #{filename}"

csv_data = File.read(filename)
books = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

books.each do |row|
  # Find or create the publisher
  publisher = Publisher.find_or_create_by(publisher_name: row["Publisher"])

  if publisher.valid?
    new_book = publisher.books.create(
      book_name: row["Book_Name"],
      publishing_year: row["Publishing_Year"],
      language_code: row["Language_Code"],
      book_average_rating: row["Book_Average_Rating"],
      book_ratings_count: row["Book_Ratings_Count"],
      genre: row["Genre"],
      gross_sales: row["Gross_Sales"],
      sale_price: row["Sale_Price"],
      sale_rank: row["Sale_Rank"],
      units_sold: row["Units_Sold"]
    )

    unless new_book.valid?
      puts "Not able to create the book #{row["Book_Name"]}"
    else
      # Update the publisher's revenue.
      # First, convert the book's gross_sales to a float.
      book_sales = row["Gross_Sales"].to_f
      # Get the current revenue, treating nil as zero.
      current_revenue = publisher.publisher_revenue.to_f
      # Update the publisher's revenue by adding the new book's sales.
      publisher.update(publisher_revenue: current_revenue + book_sales)
    end
  else
    puts "Not able to create the Publisher with name #{row["Publisher"]}"
  end
end

puts "Created #{Publisher.count} Publishers"
puts "Created #{Book.count} Books"

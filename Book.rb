class Book
  attr_accessor :title, :author, :price, :stock

  def initialize(title, author, price, stock)
    @title = title
    @author = author
    @price = price
    @stock = stock
  end

  def book_info
    p "Your book #{@title} by #{@author} is #{@price} PLN. Current stock: #{@stock}"
  end
end


class BookStore
  attr_accessor :books

  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
    p "Book '#{book.title}' has been added."
  end

  def remove_book(title)
    book = @books.find { |book| book.title == title }

    if book
      @books.delete(book)
      p "Book '#{title}' has been removed."
    else
      p "Book '#{title}' not found."
    end
  end

  def find_book(title)
    book = @books.find { |book| book.title == title }

    if book
      p "Book '#{title}' found."
      book.book_info
    else
      p "Book '#{title}' not found."
    end
  end

  def total_value
    @books.sum { |book| book.price * book.stock }
  end

  def store_info
    p "Your all books in store: #{@books.map(&:title).join(', ')}."
    p "Total value: #{total_value} PLN."
  end
end




ruby = Book.new("Ruby Programming", "John Doe", 50, 10)
przyrodnicze = Book.new("Przyrodnicze", "Adam", 50, 10)
travel = Book.new("Travel", "Tom", 60, 5)
history = Book.new("History", "John", 40, 8)
future = Book.new("Future", "Mark", 70, 3)
# Creating store

library = BookStore.new

library.add_book(ruby)
library.add_book(przyrodnicze)
library.add_book(travel)
library.add_book(history)
library.add_book(future)

library.store_info

library.find_book("Travel")
library.remove_book("History")
library.store_info
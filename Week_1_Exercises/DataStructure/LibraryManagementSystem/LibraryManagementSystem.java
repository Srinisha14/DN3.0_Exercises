package LibraryManagementSystem;

public class LibraryManagementSystem {
    public static void main(String[] args) {
        Book[] books = new Book[] {
            new Book(1, "Book 1", "Author 1"),
            new Book(2, "Book 2", "Author 2"),
            new Book(3, "Book 3", "Author 3"),
            new Book(4, "Book 4", "Author 4"),
            new Book(5, "Book 5", "Author 5")
        };

        Library library = new Library(books);

        Book book = library.linearSearchByTitle("Book 3");
        if (book!= null) {
            System.out.println("Book found: " + book.getTitle() + " by " + book.getAuthor());
        } else {
            System.out.println("Book not found.");
        }

        book = library.binarySearchByTitle("Book 3");
        if (book!= null) {
            System.out.println("Book found: " + book.getTitle() + " by " + book.getAuthor());
        } else {
            System.out.println("Book not found.");
        }
    }
}
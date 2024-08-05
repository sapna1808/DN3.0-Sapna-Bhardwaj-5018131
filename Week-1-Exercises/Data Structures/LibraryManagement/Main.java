package LibraryManagement;

import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Book[] books = {
            new Book("B001", "To Kill a Mockingbird", "Harper Lee"),
            new Book("B002", "1984", "George Orwell"),
            new Book("B003", "The Great Gatsby", "F. Scott Fitzgerald"),
            new Book("B004", "Pride and Prejudice", "Jane Austen")
        };

        LibrarySearch librarySearch = new LibrarySearch();

        // Linear Search
        Book foundBook = librarySearch.linearSearch(books, "1984");
        System.out.println("Linear Search: Found " + foundBook);

        // Sort books by title for Binary Search
        Arrays.sort(books, (b1, b2) -> b1.getTitle().compareToIgnoreCase(b2.getTitle()));

        // Binary Search
        foundBook = librarySearch.binarySearch(books, "1984");
        System.out.println("Binary Search: Found " + foundBook);
    }
}

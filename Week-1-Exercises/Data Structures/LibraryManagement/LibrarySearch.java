package LibraryManagement;

public class LibrarySearch {
    public Book linearSearch(Book[] books, String title) {
        for (Book book : books) {
            if (book.getTitle().equalsIgnoreCase(title)) {
                return book;
            }
        }
        System.out.println("Book titled " + title + " not found.");
        return null;
    }

    public Book binarySearch(Book[] books, String title) {
        int left = 0, right = books.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (books[mid].getTitle().equalsIgnoreCase(title)) {
                return books[mid];
            } else if (books[mid].getTitle().compareToIgnoreCase(title) < 0) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        System.out.println("Book titled " + title + " not found.");
        return null;
    }
}

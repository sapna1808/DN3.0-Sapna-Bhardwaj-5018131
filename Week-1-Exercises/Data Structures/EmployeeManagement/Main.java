package EmployeeManagement;

public class Main {
    public static void main(String[] args) {
        EmployeeManagement em = new EmployeeManagement(5);

        Employee e1 = new Employee("E001", "Alice", "Manager", 75000);
        Employee e2 = new Employee("E002", "Bob", "Developer", 60000);
        Employee e3 = new Employee("E003", "Charlie", "Analyst", 50000);

        em.addEmployee(e1);
        em.addEmployee(e2);
        em.addEmployee(e3);

        em.traverseEmployees();

        Employee e = em.searchEmployee("E002");
        System.out.println("Found: " + e);

        em.deleteEmployee("E002");

        em.traverseEmployees();
    }
}

package TaskManagement;

public class Main {
    public static void main(String[] args) {
        TaskList taskList = new TaskList();

        Task t1 = new Task("T001", "Design Module", "In Progress");
        Task t2 = new Task("T002", "Implement Module", "Not Started");
        Task t3 = new Task("T003", "Test Module", "Not Started");

        taskList.addTask(t1);
        taskList.addTask(t2);
        taskList.addTask(t3);

        taskList.traverseTasks();

        Task t = taskList.searchTask("T002");
        System.out.println("Found: " + t);

        taskList.deleteTask("T002");

        taskList.traverseTasks();
    }
}

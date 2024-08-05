package TaskManagement;

public class TaskList {
    private TaskNode head;

    public void addTask(Task task) {
        TaskNode newNode = new TaskNode(task);
        newNode.next = head;
        head = newNode;
        System.out.println("Added: " + task);
    }

    public Task searchTask(String taskId) {
        TaskNode current = head;
        while (current != null) {
            if (current.task.getTaskId().equals(taskId)) {
                return current.task;
            }
            current = current.next;
        }
        System.out.println("Task ID " + taskId + " not found.");
        return null;
    }

    public void traverseTasks() {
        TaskNode current = head;
        while (current != null) {
            System.out.println(current.task);
            current = current.next;
        }
    }

    public void deleteTask(String taskId) {
        TaskNode current = head;
        TaskNode prev = null;
        while (current != null && !current.task.getTaskId().equals(taskId)) {
            prev = current;
            current = current.next;
        }
        if (current != null) {
            if (prev == null) {
                head = current.next;
            } else {
                prev.next = current.next;
            }
            System.out.println("Deleted task with ID " + taskId);
        } else {
            System.out.println("Task ID " + taskId + " not found.");
        }
    }
}

package TaskManagementSystem;
public class TaskManagementSystem {
    public static void main(String[] args) {
        TaskLinkedList taskLinkedList = new TaskLinkedList();
        taskLinkedList.addTask(new Task(1, "Task 1", "In Progress"));
        taskLinkedList.addTask(new Task(2, "Task 2", "Completed"));
        taskLinkedList.addTask(new Task(3, "Task 3", "Pending"));
        taskLinkedList.traverseTasks();
        Task task = taskLinkedList.searchTask(2);
        if (task!= null) {
            System.out.println("Task found: " + task.getTaskName());
        } else {
            System.out.println("Task not found.");
        }
        taskLinkedList.deleteTask(2);
        taskLinkedList.traverseTasks();
    }
}
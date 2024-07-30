package TaskManagementSystem;
public class TaskLinkedList {
    private Node head;

    public TaskLinkedList() {
        head = null;
    }

    public void addTask(Task task) {
        Node node = new Node(task);
        if (head == null) {
            head = node;
        } else {
            Node current = head;
            while (current.getNext()!= null) {
                current = current.getNext();
            }
            current.setNext(node);
        }
    }

    public Task searchTask(int taskId) {
        Node current = head;
        while (current!= null) {
            if (current.getTask().getTaskId() == taskId) {
                return current.getTask();
            }
            current = current.getNext();
        }
        return null;
    }

    public void traverseTasks() {
        Node current = head;
        while (current!= null) {
            System.out.println("Task ID: " + current.getTask().getTaskId() + ", Task Name: " + current.getTask().getTaskName() + ", Status: " + current.getTask().getStatus());
            current = current.getNext();
        }
    }

    public void deleteTask(int taskId) {
        if (head == null) {
            return;
        }
        if (head.getTask().getTaskId() == taskId) {
            head = head.getNext();
            return;
        }
        Node current = head;
        while (current.getNext()!= null) {
            if (current.getNext().getTask().getTaskId() == taskId) {
                current.setNext(current.getNext().getNext());
                return;
            }
            current = current.getNext();
        }
    }
}
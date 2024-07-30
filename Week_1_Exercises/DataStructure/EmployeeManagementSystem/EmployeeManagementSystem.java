package EmployeeManagementSystem;

// EmployeeManagementSystem.java

public class EmployeeManagementSystem {
    private Employee[] employees;
    private int size;

    public EmployeeManagementSystem(int capacity) {
        employees = new Employee[capacity];
        size = 0;
    }

    public void addEmployee(Employee employee) {
        if (size < employees.length) {
            employees[size] = employee;
            size++;
        } else {
            System.out.println("Array is full. Cannot add more employees.");
        }
    }

    public Employee searchEmployee(int employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId() == employeeId) {
                return employees[i];
            }
        }
        return null;
    }

    public void traverseEmployees() {
        for (int i = 0; i < size; i++) {
            System.out.println("Employee ID: " + employees[i].getEmployeeId() + ", Name: " + employees[i].getName() + ", Position: " + employees[i].getPosition() + ", Salary: " + employees[i].getSalary());
        }
    }

    public void deleteEmployee(int employeeId) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId() == employeeId) {
                // Shift elements to the left
                for (int j = i; j < size - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                size--;
                return;
            }
        }
        System.out.println("Employee not found.");
    }

    public static void main(String[] args) {
        EmployeeManagementSystem ems = new EmployeeManagementSystem(5);

        // Add employees
        ems.addEmployee(new Employee(1, "John Doe", "Software Engineer", 50000.0));
        ems.addEmployee(new Employee(2, "Jane Doe", "Marketing Manager", 70000.0));
        ems.addEmployee(new Employee(3, "Bob Smith", "Sales Representative", 40000.0));

        // Traverse employees
        ems.traverseEmployees();

        // Search employee
        Employee employee = ems.searchEmployee(2);
        if (employee != null) {
            System.out.println("Employee found: " + employee.getName());
        } else {
            System.out.println("Employee not found.");
        }

        // Delete employee
        ems.deleteEmployee(2);

        // Traverse employees after deletion
        ems.traverseEmployees();
    }
}
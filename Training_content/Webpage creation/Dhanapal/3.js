document.addEventListener('DOMContentLoaded', () => {
    const userForm = document.getElementById('userForm');
    const taskForm = document.getElementById('taskForm');
    const dateTimeDisplay = document.getElementById('dateTimeDisplay');
    const taskTableBody = document.getElementById('taskTableBody');
    const tableHead = document.getElementById('tableHead');

    userForm.addEventListener('submit', (event) => {
        event.preventDefault();
        const name = document.getElementById('userName').value;
        const city = document.getElementById('userCity').value;
        if (name && city) {
            alert(`Hi ${name}, from ${city}`);
        } else {
            alert('Please fill in all fields.');
        }
    });

    taskForm.addEventListener('submit', (event) => {
        event.preventDefault();
    });

    function updateDateTime() {
        const now = new Date();
        dateTimeDisplay.textContent = now.toLocaleString();
    }
    setInterval(updateDateTime, 1000);

    window.addTask = (priority) => {
        const taskName = document.getElementById('taskName').value;
        if (!taskName) {
            alert('Please enter a task name.');
            return;
        }

        const row = document.createElement('tr');
        const taskCell = document.createElement('td');
        const priorityCell = document.createElement('td');
        const actionCell = document.createElement('td');
        const deleteButton = document.createElement('button');
        const editButton = document.createElement('button');

        taskCell.textContent = taskName;
        priorityCell.textContent = priority;

        deleteButton.innerHTML = '<i class="fas fa-trash-alt"></i>';
        deleteButton.classList.add('btn', 'btn-danger', 'mr-2');
        deleteButton.onclick = () => {
            row.remove();
            updateTableVisibility(); // Update visibility after deletion
        };

        editButton.innerHTML = '<i class="fas fa-edit"></i>';
        editButton.classList.add('btn', 'btn-warning', 'mr-2');
        editButton.onclick = () => {
            const newTaskName = prompt("Edit task name:", taskCell.textContent);
            if (newTaskName !== null) {
                taskCell.textContent = newTaskName;
            }
        };

        if (priority === 'P1') {
            row.classList.add('high-priority');
        } else if (priority === 'P2') {
            row.classList.add('medium-priority-1');
        } else if (priority === 'P3') {
            row.classList.add('medium-priority-2');
        } else if (priority === 'P4') {
            row.classList.add('low-priority');
        }

        actionCell.appendChild(editButton);
        actionCell.appendChild(deleteButton);
        row.appendChild(taskCell);
        row.appendChild(priorityCell);
        row.appendChild(actionCell);
        taskTableBody.appendChild(row);

        // Clear the input field
        document.getElementById('taskName').value = '';

        // Update table heading visibility
        updateTableVisibility();
    };

    function updateTableVisibility() {
        if (taskTableBody.children.length > 0) {
            tableHead.style.display = 'table-header-group';
        } else {
            tableHead.style.display = 'none';
        }
    }
});
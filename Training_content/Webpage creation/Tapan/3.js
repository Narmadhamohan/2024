document.addEventListener('DOMContentLoaded', () => {
            const userForm = document.getElementById('user-form');
            const taskBody = document.getElementById('task-body');
            const currentDateTime = document.getElementById('current-date-time');
            
            userForm.addEventListener('submit', (e) => {
                e.preventDefault();
                const name = document.getElementById('name').value;
                const city = document.getElementById('city').value;
        
                if (!name || !city) {
                    alert('Please fill out all fields');
                    return;
                }
        
                alert(`Name: ${name}\nCity: ${city}`);
            });
            document.querySelectorAll('.add-task-btn').forEach(button => {
            button.addEventListener('click', () => {
                const taskName = document.getElementById('task-input').value;
                const priority = button.dataset.priority;
                if (taskName) {
                    addTask(taskName, priority);
                    document.getElementById('task-input').value = ''; // Clear the input field after adding the task
                } else {
                    //alert('Please enter a task name');
                }
            });
        });

        function addTask(taskName, priority) {
            const taskBody = document.getElementById('task-body');
            const row = document.createElement('tr');
            const taskCell = document.createElement('td');
            const priorityCell = document.createElement('td');

            taskCell.textContent = taskName;
            priorityCell.textContent = priority;

            row.appendChild(taskCell);
            row.appendChild(priorityCell);
            taskBody.appendChild(row);
        }

// Add event listeners to priority buttons


        
        
            function updateDateTime() {
                const now = new Date();
                currentDateTime.textContent = now.toLocaleString();
            }
        
            setInterval(updateDateTime, 1000);
            updateDateTime();
        });
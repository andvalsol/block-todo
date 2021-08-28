pragma solidity ^0.5.0;

contract TodoList {

    struct Task {
        uint ID;
        string content;
        bool completed;
    }

    uint public taskCount;
    mapping(uint => Task) public tasks;

    event TaskCreated(uint ID, string content, bool completed);

    event TaskCompleted(uint ID, bool completed);

    constructor() public {
        taskCount = 1; // Initialize the task count to 0, this can also be set directly into the variable

        // Add a default task
        createTask("Be awesome");
    }

    function createTask(string memory _content) public {
        Task memory task = Task(taskCount, _content, false);

        tasks[taskCount] = task;

        taskCount++;

        emit TaskCreated(taskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];

        _task.completed = !_task.completed;
        tasks[_id] = _task;

        emit TaskCompleted(_id, _task.completed);
    }
}

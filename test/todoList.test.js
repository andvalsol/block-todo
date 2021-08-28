const TodoList = artifacts.require('./TodoList.sol');

contract('TodoList', (accounts) => {
   let todoList;

   before(async () => {
      todoList = await TodoList.deployed();
   });

   it('deploys successfully', async () => {
      const address = await todoList.address;

      assert.ok(address);
   });

   it('Creates tasks', async () => {
      const beforeTaskCount = await todoList.taskCount();

      const result = await todoList.createTask('Enjoy life');
      const event = result.logs[0].args;
      const taskContent = event[1];
      const afterCount = await todoList.taskCount();


      assert.equal(beforeTaskCount.toNumber() + 1, afterCount.toNumber());
      assert.equal('Enjoy life', taskContent)
   })
});

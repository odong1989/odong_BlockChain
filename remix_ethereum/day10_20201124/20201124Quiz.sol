/*
12) To-do list 프로그램을 만드려고 합니다. 오늘 해야할 일을 적어놓고 그 일을 할 때마다 지워나가는 프로그램입니다.
총 4가지의 기능을 가진 프로그램을 만드셔야 합니다. 
첫번째, 할 일을 추가하는 기능, 두번째 한 일은 삭제하는 기능, 세번째 남아 있는 일의 개수, 마지막으로 했던 일의 개수를 구하면 됩니다.

*/

pragma solidity >=0.4.22 < 0.7.0;
contract Quiz1124{
    //구조체 workInf 생성
    struct workInf{
        string job;     // 제품 - 1 
        uint finish;    //완료시 1, 미완료시 0
    }
    
    workInf[] public todoList; //1.보기의 제품1~5를 보관할 workInf[]배열 변수 todoList
    
    //첫번째, 할 일을 추가하는 기능
    function addwork(string memory _job, uint _finish) public{
        todoList.push(workInf(_job,_finish) );
    }
    //두번째 한 일은 삭제하는 기능
    function deletework(uint i) public{
        todoList[i].job="";
        todoList[i].finish=0;
    }

    //세번째 남아 있는 일의 개수
    function CountTodoWork() public view returns(uint count){
        uint count=0;
        for(uint i=0; i< todoList.length;i++){
            if(todoList[i].finish == 0){
                count++;
            }
        }
        return count;
    }    

    //했던 일의 개수
    function CountCompleteWork() public view returns(uint count){
        uint count=0;
        for(uint i=0; i< todoList.length;i++){
            if(todoList[i].finish == 1){
                count++;
            }
        }
        return count;        
    }    



    //확인용)모든 일의 개수
    function CountAllWork() public view returns(uint count){
        return todoList.length;
    }
    
}
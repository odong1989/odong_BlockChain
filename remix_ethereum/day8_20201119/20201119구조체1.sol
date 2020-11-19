
pragma solidity >=0.4.22 < 0.7.0;

contract Structure{
    //구조체 생성
    struct student{
        uint year;
        uint month;
        uint day;
        uint score;
        string credit;
        string name;
    }
    

    student[] public students;    //구조제student 를 받는 배열 students
/*
    function setStudent(uint _year, uint _month, uint _day, uint _score, string memory _credit, string memory _name) public{
        students.push(_year, _month,_day, _score,_credit, _name);
    }
    function getperson(uint i)public view returns(string){
        return students[i].name;
    }
*/

    struct person{
        uint Age;
        string name;
        string sex;
    }

    person[] public people; //  People:  person을 담는 배열 

    function insertPerson(uint _Age,string memory _name,string memory _sex) public{
         people.push(person(_Age,_name,_sex));
    }
    
    function peopleCount() public view returns(uint personCount){
        return people.length;
    }
}
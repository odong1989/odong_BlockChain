
pragma solidity >=0.4.22 < 0.7.0;
/*
학생 구조체를 만들 것
학번, 이름, 성별, 나이, 학점이 구성요소
학생을 등록하는 함수
학생의 숫자를 알아내는 함수
특정 학번의 이름과 학점을 알아내는 함수


성별 비율, 나이의 평균, 점수의 평균, 90이상 A, 80이상 B, 70이상 C 나머지 F를 자동으로 학점 배분하는 함수를 만들어오시오



*/
contract Structure{
    //학생 구조체 생성
    //학번, 이름, 성별, 나이, 학점이 구성요소
    struct student{
        uint number;
        string name;
        string gender;
        uint age;
        string credit; //학점
    }
    
    student[] public studentGroup;    //구조제student 를 받는 배열 class01


        
    //학생을 등록하는 함수
    function insertStudent(uint _number, string memory _name, string memory _gender, uint _age, string memory _credit) public{
        studentGroup.push(student(_number, _name, _gender, _age, _credit));
        // studentGroup이라는 학생구조체를 저장하는 배열에 한명의 학생정보를 저장시킨다
    }

    //학생의 숫자를 알아내는 함수
    function countStudents() public view returns(uint countStudents) {
        return(studentGroup.length);
    }    
    //특정 학번의 이름과 학점을 알아내는 함수
    function checkCodeNumber(uint _number) public view returns(string memory name, string memory credit) {
        for(uint i=0; i< studentGroup.length;i++){
            if(_number == studentGroup[i].number){
                return(studentGroup[i].name , studentGroup[i].credit );
            }
        }
        
        //입력 번호와동일한 경우로 찾는 경우
        //return(studentGroup[number].name, studentGroup[number].credit);

    }    

//성별 비율, 나이의 평균, 점수의 평균, 90이상 A, 80이상 B, 70이상 C 나머지 F를 자동으로 학점 배분하는 함수를 만들어오시오


}
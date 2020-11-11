// 
// https://solidity-kr.readthedocs.io/ko/latest/index.html

/*
3) 성적 평가 문제 

당신이 담당을 하고 있는 반의 학생들이 최근에 시험을 보았습니다. 
각 학생들에게 점수를 입력하고 학점을 부여하세요.
학생 - 1 | 점수 : 70
학생 - 2 | 점수 : 55
학생 - 3 | 점수 : 25
학생 - 4 | 점수 : 15
학생 - 5 | 점수 : 95
학생 - 6 | 점수 : 85
학생 - 7 | 점수 : 90
학생 - 8 | 점수 : 40
학생 - 9 | 점수 : 35
학생 - 10| 점수 : 90

3-1) 점수기반 4개 그룹의 평균을 각각 내야 합니다.


2번째 나 그룹 : 70점 이상을 받은 학생들 
4번째 라 그룹 : 40점 초과 70점 미만을 받은 학생들
3번째 다 그룹 : 40점 이하를 받은 학생들 
1번째 가 그룹 :  반 전체 

추가로, 각 그룹들의 인원을 구하세요. 평균과 인원은 같이 나와야 합니다.

*/

pragma solidity >=0.4.22 < 0.7.0;

contract Quiz3_1{
    uint[] arrayScore; 
    string[] arrayGrade;
    string[] arrayGroup;    

    //1.1. 성적입력
    function inputScore(uint score) public{
    arrayScore.push(score);

        //Grade
        if(score >=90){
            arrayGrade.push("A");
        }
        else if(score >=80 && score <=90 ){
            arrayGrade.push("B");
        }
        else if(score >=70 && score <=80 ){
            arrayGrade.push("C");
       }        
        else if(score >=60 && score <=70){
            arrayGrade.push("D");
        }                        
        else{
            arrayGrade.push("F");        
        }
        
        //Group
        if(score >=70){
            //2번째 나 그룹 : 70점 이상을 받은 학생들
            arrayGroup.push("나");
        }
        else if(score >40 && score <70 ){
            //4번째 라 그룹 : 40점 초과 70점 미만을 받은 학생들
            arrayGroup.push("라");
        }
        else if(score >=40 ){
            //3번째 다 그룹 : 40점 이하를 받은 학생들 
            arrayGroup.push("다");
       }
       else{
            //3번째 다 그룹 : 40점 이하를 받은 학생들 
            arrayGroup.push("미분류");
       }
        
    }
    
    //1.2. 입력결과 확인,등급,그룹확인
    function viewGradeGroup(uint cell) view public returns(uint, string memory, string memory){
        return(arrayScore[cell], arrayGrade[cell],arrayGroup[cell] );
    }    
    function viewArrayLength() view public returns(uint,uint,uint){
        return(arrayScore.length, arrayGrade.length,arrayGroup.length );
    }    
    
    //2.점수기반 4개 그룹의 평균을 각각 내야 합니다. 
    function test() view public returns(uint){
    uint total=0;
        for(uint i=0; i<=arrayScore.length; i++){
            total+=arrayScore[i];
        }
        return total;
    }

    


/*
    function viewGroupAVG() view public returns(uint){
        string memory tempStr="";
        uint total_Na=0; uint count_Na=0;
        
        for(uint i=0; i<=arrayScore.length;i++){
            //tempStr = arrayGroup[i];
            //if( keccak256(bytes(tempStr)) == keccak256(bytes('나')) ){
                //invalid opcode. invalid opcode The execution might have thrown. Debug the transaction to get more information.
                //왜 이런 에러인지는 확인중.

            if(arrayScore[i]>=70){
               total_Na+=arrayScore[i];
               count_Na++;
            }
        }
        return(total_Na/count_Na);
    }
    */
    //추가로, 각 그룹들의 인원을 구하세요. 평균과 인원은 같이 나와야 합니다.    
}
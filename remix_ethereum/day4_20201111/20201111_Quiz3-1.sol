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
        else if(score <=40 ){
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
    function viewAvgGroups() view public returns(uint avgGA,uint avgNA,uint avgDA,uint avgRA, uint cntGA, uint cntNA, uint cntDA, uint cntRA){
    uint total_GA=0; //1번째 '가'그룹 :  반 전체 
    uint total_NA=0; //2번째 '나' 그룹 : 70점 이상을 받은 학생들 
    uint total_RA=0; //4번째 '라' 그룹 : 40점 초과 70점 미만을 받은 학생들
    uint total_DA=0; //3번째 '다' 그룹 : 40점 이하를 받은 학생들 

    uint count_GA=0; //1번째 '가'그룹 :  반 전체 
    uint count_NA=0; //2번째 '나' 그룹 : 70점 이상을 받은 학생들 
    uint count_RA=0; //4번째 '라' 그룹 : 40점 초과 70점 미만을 받은 학생들
    uint count_DA=0; //3번째 '다' 그룹 : 40점 이하를 받은 학생들 
    

        for(uint i=0; i<arrayScore.length; i++){ 
            //[주의&나의실수] 배열의 길이관련 조건설정은 무조건"<"으로 해야한다!(미치고  팔짝뛸 초보적 실수 -ㅅ-;;;)
            //("<="으로 하면 없는 배열의 칸을 찾게됨->못찾음->컴은 에러처리
            //이처럼 에러를 발생시킴에도 컴파일러는 문법오류가 없기에 통과시킨다. 덕분에 시간을 날려먹음... ㅠㅠ

            total_GA += arrayScore[i];
            count_GA ++;

            if(keccak256(bytes(arrayGroup[i])) == keccak256(bytes("나")) ){
                total_NA+=arrayScore[i]; 
                count_NA++; 
           }           
            else if(keccak256(bytes(arrayGroup[i])) == keccak256(bytes("다")) ){
                total_DA+=arrayScore[i]; 
                count_DA++; 
           }           
            else if(keccak256(bytes(arrayGroup[i])) == keccak256(bytes("라")) ){
                total_RA+=arrayScore[i]; 
                count_RA++; 
           }                      

        }
        return( (total_GA/count_GA), (total_NA/count_NA), (total_DA/count_DA), (total_RA/count_RA),
                count_GA,count_NA,count_DA,count_RA);
    }

}
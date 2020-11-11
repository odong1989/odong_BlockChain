/*
3) 성적 평가 문제 

당신이 담당을 하고 있는 반의 학생들이 최근에 시험을 보았습니다. 각 학생들에게 점수를 입력하고 학점을 부여하세요.

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
3-2) 성적 평가 문제

3-1에서 이어집니다. 이번에는 다른 방식으로 학생들의 그룹을 나누려고 합니다. 
80점 이상은 A, 70점 이상은 B, 50점 이상은 C 나머지는 F 입니다. 
각각 A,B,C,F 학점을 받은 학생들의 수와 그 그룹의 평균을 구하세요.

*/

pragma solidity >=0.4.22 < 0.7.0;

contract Quiz3_2{
    uint[] arrayScore; 
    string[] arrayGrade;

    //1.1. 성적입력
    function inputScore(uint score) public{
    arrayScore.push(score);

        //Grade [변경]80점 이상은 A, 70점 이상은 B, 50점 이상은 C 나머지는 F 입니다. 
        if(score >=80){
            arrayGrade.push("A");
        }
        else if(score >=70){
            arrayGrade.push("B");
        }
        else if(score >=50){
            arrayGrade.push("C");
       }        
        else{
            arrayGrade.push("F");        
        }
        
        

    }

    
    //각각 A,B,C,F 학점을 받은 학생들의 수와 그 그룹의 평균을 구하세요.
    function viewAvgGroups() view public returns(uint avgA,uint avgB,uint avgC,uint avgF, uint cntA, uint cntB, uint cntC, uint cntF){
    uint total_A=0;
    uint total_B=0;
    uint total_C=0;
    uint total_F=0;
    
    uint cnt_A=0;
    uint cnt_B=0;
    uint cnt_C=0;
    uint cnt_F=0;

        for(uint i=0; i<arrayScore.length; i++){ 
            //[주의&나의실수] 배열의 길이관련 조건설정은 무조건"<"으로 해야한다!(미치고  팔짝뛸 초보적 실수 -ㅅ-;;;)
            //("<="으로 하면 없는 배열의 칸을 찾게됨->못찾음->컴은 에러처리
            //이처럼 에러를 발생시킴에도 컴파일러는 문법오류가 없기에 통과시킨다. 덕분에 시간을 날려먹음... ㅠㅠ

            if(keccak256(bytes(arrayGrade[i])) == keccak256(bytes("A")) ){
                total_A+=arrayScore[i]; 
                cnt_A++; 
           }           
            else if(keccak256(bytes(arrayGrade[i])) == keccak256(bytes("B")) ){
                total_B+=arrayScore[i]; 
                cnt_B++; 
           }           
            else if(keccak256(bytes(arrayGrade[i])) == keccak256(bytes("C")) ){
                total_C+=arrayScore[i]; 
                cnt_C++; 
           }
           else{
                total_F=arrayScore[i]; 
                cnt_F++; 
           }
           

        }
        return( (total_A/cnt_A), (total_B/cnt_B), (total_C/cnt_C), (total_F/cnt_F),
                cnt_A,cnt_B,cnt_C,cnt_F);
    }

}
pragma solidity >=0.4.22 < 0.7.0;
//김보성
/*
6) 특정 숫자까지의 2의 배수, 3의 배수, 5의 배수 
   그리고 각 자릿수의 숫자를 합쳐서 11의 배수가 되는 숫자들의 개수를 알고 싶다.
   다수의 함수를 구성하여도 좋다.

*/

contract Quiz6{
   
    
    function devideDrainage( uint number) public view returns(uint countTwo, uint countThree, uint countFive){
        uint countTwo=0;
        uint countThree=0;
        uint countFive=0;
        
        for(uint i =0; i <number; i++){
            if(i%2==0){
                countTwo++;
            } 
            if(i%3==0){
                countThree++;
            }
            if(i%5==0){
                countFive++;
            }
        }   
        return(countTwo,countThree,countFive);            
    }
    
    
    function checkEleven(uint number) public view returns(){
        
    }
    
    //최초작성코드. 힌트따라 재실시.--------------------------
    /*
    uint[] numberArrays; 
    uint[] drainageTwo; 
    uint[] drainageThree; 
    uint[] drainageFive;     
    
    function inputNumber(uint userIn) public{
        numberArrays.push(userIn);
    }    
    
    //6-1) 특정 숫자까지의 2의 배수, 3의 배수, 5의 배수 
    function devideDrainage() public view returns(uint countTwo, uint countThree, uint countFive){
    uint countTwo=0;
    uint countThree=0; 
    uint countFive=0;
    
        for(uint i =0; i < numberArrays.length; i++){
            if(numberArrays[i]%2==0){
            //    drainageTwo.push();
                countTwo++;
            } 
            if(numberArrays[i]%3==0){
                countThree++;
            }
            if(numberArrays[i]%5==0){
                countFive++;
            }
            
            //10과 같은 2,5로 나뉘는 경우 고려해서 일일이 if로 실시.
        }
        return(countTwo,countThree,countFive);
    } 
    
    //6)각 자릿수의 숫자를 합쳐서 11의 배수가 되는 숫자들의 개수를 알고 싶다. 
    function devideTotalNines()public view returns(uint countNines){
        uint countNines=0;
        uint tempSaveEach;
        uint jcount=0;
        
        for(uint i =0; i < numberArrays.length; i++){
            for(uint j =1; numberArrays[i]%j!=0 ; j*=10)
            {
                tempSaveEach+=j;
            }
            
            if(tempSaveEach==11)
            {
                countNines+=1;
            }
        }
        return(countNines);
    }
    */

}
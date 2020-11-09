pragma solidity >=0.4.22 <0.7.0;

contract example8 {

    //입력 : 년, 월, 일, 이름 (각각 따로 받을 것)
    //출력 : 4개 전부출력

    //변수선언 
    uint256 year;
    uint256 month;
    uint256 day;
    string name;    
    string quarter;
    
    /*
    function setQuarter(uint256 _month) public {
        if( _month ==1 || _month ==2 || _month ==3 ){
        //if(_month<=3 && month>=1){ 이게 더 낫지.
    
            quarter='1분기';
        }
                
        else if(_month ==4 || _month ==5 || _month ==6 ){
        //_month <=6&&_month>=4
    
            quarter='2분기';
        }
                
        else if(_month ==7 || _month ==8 || _month ==9 ){
            quarter='3분기';
        }
        
        else if(_month ==10 || _month ==11 || _month ==12 ){
            quarter='4분기';
        } 
        
        else{
            quarter='엉뚱한 입력입니다.';
        }
    }
    */
    
    function storeBirthday(uint256 _year,uint256 _month,uint256 _day ) public {
        year = _year;
        month=_month;

        day =_day;
        
                if( _month ==1 || _month ==2 || _month ==3 ){
        //if(_month<=3 && month>=1){ 이게 더 낫지.
    
            quarter='1분기';
        }
                
        else if(_month ==4 || _month ==5 || _month ==6 ){
        //_month <=6&&_month>=4
    
            quarter='2분기';
        }
                
        else if(_month ==7 || _month ==8 || _month ==9 ){
            quarter='3분기';
        }
        
        else if(_month ==10 || _month ==11 || _month ==12 ){
            quarter='4분기';
        } 
        
        else{
            quarter='엉뚱한 입력입니다.';
        }
    }
    
    function store_name(string memory _name) public {
        name = _name;
    }
    

    
    //output
    function retreiveAll() public returns (uint256, uint256,uint256,string memory, string memory){
            return (year,month,day,quarter,name);
        }
    

    
}



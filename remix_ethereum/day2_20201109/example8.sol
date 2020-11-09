pragma solidity >=0.4.22 <0.7.0;

contract example8 {

    //입력 : 년, 월, 일, 이름 (각각 따로 받을 것)
    //출력 : 4개 전부출력

    //변수선언 
    uint year;
    uint month;
    uint day;
    string name;    

    //inputs
    /*
    function storeYear(uint256 _year) public {
        year = _year;
    }
    
    function storeMonth(uint256 _month) public {
        month = _month;
    }
    
    function storeDay(uint256 _day) public {
        day = _day;
    }
    */
    
    function storeBirthday(uint256 _year,uint256 _month,uint256 _day ) public {
        year = _year;
        month=_month;
        day =_day;
    }
    function store_name(string memory _name) public {
        name = _name;
    }
    
    //output
    function retreiveAll() public returns (uint256, uint256,uint256, string memory){
            return (year,month,day,name);
        }
    

    
}
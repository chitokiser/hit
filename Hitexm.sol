// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;
//hit 토큰 가격 수동 결정

interface hitc {     //hit 컨트렉트
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256);
  function automint( ) external;
}
 contract Hitexm {  
     hitc hit;
     uint256  public price;
     uint256 public sold;
     address public admin;
     event justfall(address _from,uint pay);

   constructor(address _hitc,uint256 _price) public {
        hit=hitc(_hitc);
        price=_price;
        admin=msg.sender;
    }

   function buyTokens(uint256 _num)public payable{   //이더 입력
        require(_num>=1,"ether less"); //최소 구매0.000001 ether 이상
        require(msg.value == _num,"no deposit"); //이더 지불
        require(hit.balanceOf(address(this))>=_num*price,"hit less"); //토큰 잔고 체크
        sold +=_num*price; //판매량 증가
        hit.transfer(msg.sender,_num*price); //토큰 이체
        if(hit.balanceOf(address(this))<=1000000000){
          hit.automint();    //잔고가 10억보다 작으면 민트요청
    }
   }  //if문 때문에 대괄호 하나더
     

    function sellTokens(uint256 _num) public payable  {    //토큰입력
        require(_num>=price,"hit less");
        require(hit.balanceOf(msg.sender)>=num."you hit shortage"); 팔려고 하는 토큰 소지 여부
        require(address(this).balance>_num/price,"ether less");  //이더 지불 가능여부 
        uint pay=_num/price;
        hit.transfer( address(this),_num); //from,to,amount
        sold -=_num;
         (bool sent, ) = msg.sender.call{value: pay}("");
        require(sent, "Failed to send Ether");
    
        }
 
    
   function priceup(uint _price) public {
        require ( admin==msg.sender);
    price=_price;
    }
   
  
   function hitbalances() public view returns(uint256) {
    return hit.balanceOf(address(this));//계약이 가지고 있는 토큰 잔고 리턴
    }

   function getbalance()public view returns(uint256){     //이더잔고
   return address(this).balance;
   }
   
   function deposit()external payable{ 

   }
   }

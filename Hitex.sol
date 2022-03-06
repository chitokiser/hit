// SPDX-License-Identifier: MIT


pragma solidity ^0.4.22;
//인터페이스 구축
interface usdc {     //usdethup 컨트렉트
  function ETHUSD() external view returns(uint256);  //이더 : 달러 시세 1200초에 1번 갱신 전역변수 가져오기
}
interface hitc {     //hit 컨트렉트
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256);
}
 contract HitEX {  //제목?
     usdc price;
     hitc hit;
     address public bank;
     uint256 public sold;
     uint256 public tex;
    event Sell(address indexed _buyer, uint256 indexed _amount);
 constructor(address _usdc,address _hitc) public {
        price=usdc(_usdc);
        hit=hitc(_hitc);
    }
   function buyTokens(uint256 _num)public payable{
        require(_num>1ether/1000); //최소 구매0.0001 ether 이상
        require(msg.value == _num); //이더 지불
        require(hit.balanceOf(address(this))>=_num*price.ETHUSD()); //토큰 잔고 체크
        sold +=_num*price.ETHUSD() ; //판매량 증가
        emit Sell(msg.sender, _num*price.ETHUSD());
        det.transfer(msg.sender,_num*price.ETHUSD()); //토큰 이체
        if(hit.balansOf[address (this)]<=1000000000){hit.automint();}//잔고가 10억보다 작으면 민트요청
        else{retrun false;}
    }
    function sellTokens(uint256 _num) public  {
        require(_num>=price.ETHUSD());
        hit.transfer(address(this),_num);
        sold -= _num;
        uint256 memory pay=_num/price.ETHUSD();
        msg.sender.transfer(pay*97/100);
        tax+=pay*3/100
        emit Sell(msg.sender,pay;
        if(tax*price.ETHUSD>=50000000){
          hit.transfer.(bank,tax);
          tax=0;
        }
          else{retrun false;}
      }
    function g2() public view returns(uint256){
     return price.ETHUSD();
    }
   function hitbalances() public view returns(uint256){
     return hit.balansOf[address (this)];//계약이 가지고 있는 토큰 잔고 리턴
    }
  function ethbalances() public view returns(uint256){
   return balans[address (this)];//계약이 가지고 있는 이더잔고 리턴
  }
 }

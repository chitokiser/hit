// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
interface hitc {     //hit 컨트렉트
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256); }

    contract Hitbank {
          hitc hit;
          uint256 public sold; //전체 유동성 제공 증서
          uint256 public price; //계약 1건 가격
          uint256 public allow; //계약 1건  배당 금액
          uint256 public sum;  //토탈 조합원 수 
          uint256[]chart; //가격 변경 챠트 값 푸쉬
          mapping(address => my) public myinfo;
          uint sdrt;  //스페샬 인출 타임

          event Sell(address indexed _buyer, uint256 indexed _amount);
          

         constructor(address _hit,uint256 _allow,uint256 _price,address _admin) public {
             price=_price;
             hit=hitc(_hit);
             sold=_sold;
             myinfo[_admin]level=5; //최초 추천 받기 위해 
             admin.push(_admin);
             allow=_allow;
             price=_price;  }
   
    struct my {
    uint32 st;  //유동성 제공 증서
    uint256 depot; //유동성 제공 시간
    uint256 exp;  //경험치
    uint8 level;  //레벨
    uint256 chip;
    address mento;
    }
function memberjoin(address _mento) public {
 require(myinfo[_mento]level>=5);
 require(hit.msg.value==10000);
 require(myinfo[_mento]level==0);
 myinfo[_mento]exp +=10000;
 myinfo[_mento]level=1;
 myinfo[msg.sender]mento=_mento;
 sum+=1;

function buyst(uint256 _num) public {
       require(myinfo[msg.sender]level>=1);  //조합원 이어야 하고
       require(sold+_num<=5000000);   // 500만개 이하여야 함.
       require(det.msg.value==_num*price);
        myinfo[msg.sender]st+=_num;
        myinfo[msg.sender]depot=now;
        sold+=_num;
        myinfo[msg.sender]exp+=_num*price;
        myinfo[myinfo[msg.sender]mento]exp+=_num*price;
     }
    function sellst( )public returns(bool){    //st 처분
      require(myinfo[msg.sender]st>=1); //
      require(myinfo[msg.sender]depot+30days<now); //한달이  지났는지?
      uint256 memory pay=myinfo[msg.sender]st*price*myinfo[msg.sender]level/100;
      uint256 memory bonus=myinfo[msg.sender]st*allow*level/100; //레벨 상관관계
      det.transfer(msg.sender,pay+bouns);
      sold-=myinfo[msg.sender]st;
      myinfo[msg.sender]st=0;
      myinfo[msg.sender]depot=0;
      return true;
      }

    function priceup( )internal {
      allow=g1()/sold; //잔고/솔드/
      price=allow*10;
      chart.push(price);
    }

    function expup(address _user,uint256 _num)internal { //계약만 호출 가능하게
      require(fa[msg.sendr]>=1); 
      require(myinfo[_user]level>=1);
      myinfo[_user]exp+=_num;

    }
     function chipup(address _user,uint256 _num)internal { //계약만 호출 가능하게
      require(fa[msg.sendr]>=1);
      require(myinfo[_user]level>=1);
      myinfo[_user]chip+=_num;

    }

    function faup(address _fa,uint8 _num)internal returns(bool){
       require(ss[msg.sender]>=3);
       fa[_fa]=_num;
       return true;
    }

    function chipex( )public{
      require(myinfo[msg.sender]chip>=1000);
      hit.transfer(msg.sender,chip);
      myinfo[msg.sender]chip=0;
    }

    function levelup( )public returns(bool){
      require(myinfo[_user]exp>=2**myinfo[_user]level*10000);
      if(myinfo[_user]level<=100){
      myinfo[_user]level+=1;
      myinfo[_user]exp-=2**myinfo[_user]level**10000);
      return true;
    }else{ return false;
      }
  }

  function sdr()public {  //스페샬 인출 
  
   require(hitvote.staff[msg.sender]>=3);
   require(sdrt+30days<now);
   hit.transfer(fa[3],balanceOf(address(this)*10/100);  //hitvote의결기구에 10%이체  
   sdrt=now;
  } 
  function g1() public view returns(uint256){
      return hit.balanceOf(this);
       }
}

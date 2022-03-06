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
        mapping(address => my) private myinfo;
        event Sell(address indexed _buyer, uint256 indexed _amount);
          

    constructor(address _hit,uint256 _allow,uint256 _price) public {
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
    uint256 allowt; //배당 받은 시간
    uint256 exp;  //경험치
    uint8 level;  //레벨
    uint256 chip;  //대출 토큰
    address mento; 

    }

function memberjoin(address _mento) public {
  my storage tmento=myinfo[_menoto];
  my storage tmy=myinfo[msg.sender]; 
    require(tmento.level>=5,"mento level low"); //멘토 레벨 체크
    require(hit.balanceOf(msg.sender)>=10000); //조합비 지불 가능 여부
    require(tmy.level==0);  //최초가입인지 여부
      hit.transfer( address(this),10000); 
       tmy.exp = 10000;
       tmy.level=1;
       tmy.mento=_mento;
      sum += 1;
}

function buyst(uint256 _num) public {     //출자증서 매입
  my storage tmy=myinfo[msg.sender]; 
  my storage tmento=myinfo[myinfo[msg.sender]mento];  //함수 호출자 멘토 인스턴스
    require(tmy.level>=1);  //조합원 이어야 하고
    require(sold+_num<=5000000);   //st 솔드 토탈  500만개 이하여야 함.
    require(hit.balanceOf(msg.sender)>=_num*price); //지불 가능 여부
      hit.transfer(adderss(this),_num*price);  
       tmy.st+=_num
       tmy.depot=now;
       tmy.allowt=now;
       tmy.exp+=_num*price;
       tmento.exp+=_num*price;
      sold+=_num;
    priceup();
}

function sellst( )public returns(bool){    //st 처분
  my storage tmy=myinfo[msg.sender]; 
    require(tmy.st>=1); //st 보유 여부
    require(tmy.depot+1year<now); //일년이 지났는지?
  uint256 memory pay=tmy.st*price*tmy.level/10000;  //매도 차익 실현
    hit.transfer(msg.sender,pay);
    sold -= tmy.st;
      tmy.st = 0;
      tmy.depot = 0;
    priceup();
}

function withdraw( )public returns(bool){    //st 배당
  my storage tmy=myinfo[msg.sender]; 
    require(tmy.st>=1); //st 보유 여부
    require(tmy.allowt+30day<now); //일년이 지났는지?
  uint256 memory pay=tmy.st*allow*tmy.level/10000;  //매도 차익 실현
    hit.transfer(msg.sender,pay);
      tmy.allowt=0;
      return true;
}


function priceup( )private {
    allow=g1()/sold; //토큰 잔고/솔드/
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
pragma solidity ^0.8.0;

interface hitc {     //hit 컨트렉트
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256);
}
interface hitbankc{  
  function chipup(address _addr,uint256 _pay) external;
}

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol"

contract HitNFT is ERC721Token {
  
  hitc hit;
  hitbankc hitbank;
  address admin;  //director 추가 삭제
  uint tax;   //이자 수익 hitbank에 자동이체
  uint256[]nl; //ns리스트 상태 소팅 tid리턴
  mapping (uint256=>mynft)public ns;  //다른 계약에서 호출 가능 해야함
 

  event TokenRegistered(address _by, uint256 _tokenId);

constructor (string _name, string _symbol,address _hitc,address _hitbank) public
  ERC721Token(_name, _symbol) {}
  admin=msg.sender;  //staff 추가 삭제
  hit=hitc(_hitc);
  hitbank=hitbank(_hitbank);

struct mynft{
 uint256 tid; //토큰 아이디
 string  info; //등록 실물에 대한 정보 입력 url  사진,등기부등본
 uint256 price; //최종가격
 uint256 loant; //최초등록 타임스탬프
 uint256 loan;   //대출 신청 후 승인 되면 hitbank와 상호작용
 uint8 key; //론 키
 uint8 state;  //신청=>심사=>결과=>신탁=>대출 신청=>심사=>결과 =>이사회 의결사항
 address owner; //nft승인 후 발행할때 필요
 bool trust; //대출 상환 신용도
 mapping(address=>mapping(bytes32=>uint256)user; //유저지정 중복매핑 주소->이름->사용가능시간 마켓에 등록시 usertime이 0인 상태여만 등록 가능
 uint256[ ]usertime;
 uint8 reputation; //평판 시스템 공유 시스템에서 활용
 }

function opendoor(uint256 _tid)public {
 require(ns[_tid]owner==msg.sender||ns[_tid]user[msg.sender]-now >=600); //오너이거나 유저이면600초 안에는 문 열 수 있음
 require(ns[_tid]trust==true);
 open=true;}

function adduser(uint256 _tid,address _user,bytes32 _name,uint256 _time)public{ //유저추가 
 require(ERC721Token.ownerOf(_tid)==msg.sender);
 require(us[_tid]trust==true );
 require(bytes32<=_name);
 require(_time=>60*60*24&&_time<=60*60*24*365); //1일 이상 자동차 포함
 us[_tid]user[_user][_name]=_time + now;
 us[_tid]usertime.push(_time+now);
}

function initnft(string _info,uint256 _price)public    //최초 발행신청 아무나 가능
uint256 ttid=nl.length+9000000000; //10자리 유니크 NFT발행
require(ns[ttid]tid==0);
require(hit.msg.value==_price*1/1000); //등록 수수료 이 계약에 0.1% 입금
tax+=_price*1/1000;  
ns[ttid]tid=ttid;
ns[ttid]info=_info;
ns[ttid]price=_price;
ns[ttid]state=1;     //상태값 모니터링 하여 신탁가능 여부 승인
ns[ttid]owner=msg.sender;
nl.push(ttid);


function nftok1(uint256 _tid,uint8 _num)public{
  require(ns[_tid]state==1);
  require(director[mag.sender]>=2);
  ns[_tid]state=_num;  //2인경우 불합격 합격3
}

function nftok2(uint256 _tid)public {    //최초 발행 신청 승인 신탁계약 여부 확인
           require(ns[_tid]state==3);
           require(staff[msg.sender]>=1); //staff 자격 여부 판단
           ns[_tid]state+=1;
 if(ns[_tid]state>sumstaff/2){
   nftmint(ns[_tid]owner,ns[_tid]tid,ns[_tid]info);//nft mint
   ns[_tid]trust==true;  //트러스트 승인
 }

function nftmint(address _to,uint256 _tokenId,string  _tokenURI) internal{  //최종승인 됬을경우 발급됨.
        super._mint(_to, _tokenId);
        super._setTokenURI(_tokenId, _tokenURI);
        emit TokenRegistered(_to, _tokenId);
    }

function loanproposal(uint256 _tid )public {    //대출 신청
      require(ns[_tid]owner==msg.sender);
      require(ns[_tid]state>sumstaff/2); //이사회 과반수 찬성
      require(ns[_tid]loan==0); 론 없는 상태여야 함
      hit.balanceOf[hitbank]>=ns[_tid]price*5; //뱅크
      ns[_tid]state=dir; //투표자의 2배수면 대출 승인해줌

function loanok(uint256 _tid)public{
  require(director[msg.sender]>=2);           
               loanfee=ns[_tid]price*70/100; //년 3% 10년 균등상환
               ns[_tid]loan=loanfee*130/100;
               ns[_tid]key=120;
               ns[_tid]loant=now;
               hitbank.chipup(msg.sender,loanfee);//대출신청자,대출금액 칩업처리 해야 함
   }

function loanrepay(uint256 _tid)public returns(bool){
      require(ns[_tid]key>=1);
      require(ERC721Token.ownerOf(_tid)==msg.sender);
      repay=ns[_tid]loan/ns[_tid]key;
      if(tax>=5000000)){hit.transfer(hitbank,tax);
      tax=0;  } //이자수익 이체
      if(ns[_tid]loant+31days>now){
      require(hit.msg.value==repay);
      tax+=repay;
      ns[_tid]loant=now;
      ns[_tid]loan-=repay;
      ns[_tid]key-=1; }
      
      else if(ns[_tid]loant+31days<now&&now<ns[_tid]loant+91days){
      require(hit.msg.value==repay*130/100);
      tax+=repay*130/100;
      ns[_tid]loant=now;
      ns[_tid]loan-=repay;
      ns[_tid]key-=1; 
      return true; }else
      return false;

      }

 function trustup(uint256 _tid,uint8 _num)public  returns(bool) {  //loant 91일 이상 nft 소팅하여 트러스트 상태 업
   require(director[msg.sender]>=2);
   if(_num==1){ns[_tid]trust= false;}
   else if(_num==2){ns[_tid]trust=true;
                  ns[_tid]loant=now;  
                  }else{return false ;
   }
function infoup(uint256 _tid,address _owner,uint256 _price)internal  { 옥션에서 받은 새로운 오너 ,가격 정보
require(hitvote.fa[mag.sender]=>1);  //3번으로 등록된 패밀리 hitnftmarket 
ns[_tid]owner=_owner;
ns[_tid]price=_price;


}
function g1( ) public view returns(uint256){
    return nl.length;  }

function g2(uint256 _num) public view returns(uint256){
    return nl[_num];  }  //tid 출력

function g3(uint256 _tid) public view returns(string,uint256){
require(ns[_tid]state==1);
    return ns[_tid]info;
           ns[_tid]price;  }
function g4(uint256 _tid) public view returns(uint256){  //유저들  가져오기 256까지 필요한가?
    return ns[_tid]usertime.length;  }
function g5(uint256 _tid,uint256 _num) public view returns(uint256){  //유저들  남은시간 가져오기
    return ns[_tid]usertime[_num];  }

function g6(uint256 _num) public view returns(uint256){
require(ns[_tid]loant+91days<now );  //연체자 소팅
return  nl[_num];
function g7(uint256 _tid) public view returns(address){  //nft 오너 가져오기
return  super._owners[_tid];
function g8(uint256 _tid) public view returns(bool){  //nft 신용상태 보기
return  ns.[_tid]trust;
function g9(uint256 _tid) public view returns(bool){  //nft 대출금액 확인
return  ns.[_tid]loan;

      
  
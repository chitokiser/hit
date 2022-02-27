pragma solidity ^0.8.0;

interface hitc {     //hit 컨트렉트
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256);
}

contract Hitvote{
 address admin;
 uint8 sum;
 mapping(address=>uint8)public staff;
 uint256[]al;
 mapping (uint256=>agenda)public as;
 mapping (address=>uint8)public fa;  //패밀리 넘버

constructor(address _hit)public {
admin=msg.sender;
hit=hitc(_hit); 
}

struct agenda{
string name;
uint8  vote;
address requester;
uint256 amount;  //요구 금액
address[]voter;
bool resolve;  //결과
}

function creat(string _name,uint256 _amount)public {  //아젠다 설정
require(staff[msg.sender]=>3); //안건 발의 가능자 3이상
require(_amount=<hit.balanceOf(address(this));
uint256 memory taid=al.length;
as[taid]name=_name;
as[taid]requester=msg.sender;
as[taid]amount=_amount;
as[taid]resolve=false;
}
function voting(uint256 _num)public returns(bool){
    require(staff[msg.sender]>=1);  //레벨1이상 스테프
    require(as[_num]resolve=false);  //미결정 상태
    require(as[_num]voter[msg.sender]==address(0));
    require(as[_num]amount=<hit.balanceOf(address(this));
    as[_num]vote+=1;
    as[_num]voter.push(msg.sender);

    if(as[_num]vote>sum){
        hit.transfer(as[_num]requester,as[_num]amount);
        as[_num]resolve=true;
        return true;
    }

function staffup(address _staff,uint8 _num,uint8 _sum)public {
   require(admin==msg.sender||staff[msg.sender]>=3);
   staff[_staff]=_num;
   sum=_sum;
}
function faup(address _fa,uint8 _num)public {
   require(admin==msg.sender||staff[msg.sender]>=3);
   fa[_fa]=_num;
}

  function g1() public view returns(uint256){
      return hit.balanceOf(this);
}
  function g2() public view returns(uint256){
      return al.length;
}
  function g3(uint256 _num) public view returns(uint256){
      return as[_num]name;
             as[_num]vote;
             as[_num]requester;
             as[_num]amount;
             as[_num]voter.length;
             as[_num]decision;
}
function g4(address _fa) public view returns(uint256){
      return fa[_fa];
}
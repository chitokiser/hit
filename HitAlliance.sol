// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
interface Hitc {     //상호작용 hit 컨트렉트,
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256); }

interface Hitbankc{
  function expup(address _user,uint256 _num)external returns(bool);
}
    contract HitAlliance {
          Hitc hit;
          Hitbankc hitbank;
          uint256 public tax; //500만이상 모이면 뱅크에 자동이체
          uint256[ ]al; //동맹리스트
          mapping(uint256 =>alliance) public as;
         event Sell(address indexed _buyer, uint256 indexed _amount);

         constructor(address _hit,address _hitbank) public {

             hit=Hitc(_hit);
             hibank=Hitbankc(_hitbank);
        

    struct alliance {
    stiring home;  //링크
    uint256 cr; //cashback rate
    uint256 crp;  //누적 cashback rate
    uint256 depo;  //인출 가능 금액
    string img; //로고
    address owner //오너
    uint256 aid; //고유 아이디
    uint32  seg; //나라,지역,업종,온오프 분류 코드 web3에서 물고 들어오기
    }

function alliancing(sting _home,uint256 _cr,string _img,uint32 _seg) public {
 uint26 taid=al.length+1;  //임시 동맹 id
 require(1=<_cr<=50); //캐쉬백 비율 허용치
 as[taid]home = _home //홈페이지 URL
 as[taid]cr = _cr;   //캐쉬백 비율
 as[taid]img = _img; //메인 이미지
 as[taid]aid = _taid;
 as[taid]seg = _seg;
 al.push(taid);

function buy(uint256 _aid,uint256 bet) public returns(bool) {
        uint256 memory fee=as[_aid]cr //캐쉬백 비율
       require( as[_aid]cr >= 1);  //조합원 이어야 하고
       require(_bet>=1000);   // 500만개 이하여야 함.
       require(hit.msg.value==_bet*100-fee/100); //캐쉬백 비율 빼고 결제
        as[_aid]depo+= bet*100-fee/100;
        tax+=bet*fee/100;
        hitbank.expup(msg.sender,bet*fee/100);  //결제액 만큼 경험치 업
        if(tax>=5000000){hit.transfer(hitbank,tax);
        tax=0;
        retrun true;
    }

function withdraw(uint256 _aid)public retruns(bool)
    uint256 memory tdepo=as[_aid]depo; //임시 적립금값
    require(as[_aid]owner==msg.sender);
    require(tdepo=>1000);
    hit.transfer(msg.sender,tdepo);
    tdepo=0;
    return true;


  function g1() public view returns(uint256){
      return hit.balanceOf(this);
       }
  function g2() public view returns(uint256){
           return hitbank.sum; //토탈 조합원 수 고정고객 수
            }
}

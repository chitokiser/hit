pragma solidity ^0.4.23;

interface hitc {     //hit 컨트렉트
  function transfer(address _addr,uint256 _pay) external;
  function balanceOf(address _addr) external view returns(uint256);
}
interface hitbankc{   //hitbank 컨트렉트
  function chipup(address _addr,uint256 _pay) external;
}
interface hitnftc{   //hitbank 컨트렉트
  function g3(uint256 _tids) external;
  function g7(uint256 _tids) external;
  function g8(uint256 _tids) external;
  function g9(uint256 _tids) external;
}

contract HitNFTMarket {
	uint256 tax;
	uint256 [] public al;
 	mapping(address => uint[]) public owner;  //옥션 오너 al 인덱스 
    mapping(uint256=>auction)public as;

	event _creat(address _owner, uint _aId);
	event _end(address _owner, uint _auctionId);

constructor (address _hitc,address _hitbank) public
  admin=msg.sender;  //director 추가 삭제
  hit=hitc(_hitc);
  hitbank=hitbank(_hitbank);

	struct auction {
	  string name; // 옥션제목
	  uint256 tid; // 토큰 아이디
	  uint8 state; //활성화 여부
	  uint256 price; //입찰 가격
	  address higher; //최고가 입찰자
	  uint256 depo;   //입찰 보증금
	  uint256 bidt;  //생성 타임
	  address owner; //옥션 오너
	}

	function creat(uint256 _tid, string _name) public returns(bool) {   //옥션 생성
		uint aid = al.length;
	    require(hitnft.g7(_tid)==msg.sender); //토큰 오너인지 여부
		require(hitnft.g8(_tid)==true);//신용상태 여부
		uint256 memory tprice=hitnft.ns[_tid]price;
		require(hit.msg.value==tprice*1/100)) //보증금 가격의 1% 계약에 입금
		hitnft._transfer(msg.sender,address(this),_tid);                     //계약에 소유권 이전
		as[aid]name = _name;
	    as[aid]tid = _tid;
		as[aid]price = tprice;
		as[aid]depo = tdepo*1/100;
		as[aid]higher = msg.sender;
		as[aid]state = 1; //등록1 
		as[aid]bidt = now;
		as[aid]owner = msg.sender;  
		al.push(aid);
		owner[msg.sender].push(aid);
		emit _creat(msg.sender, aid);
		return true;
	}

	function bid(uint256 _aid,uint256 _price) public {   //입찰 
		require(as[_aid]state>=1);
		require(as[_aid]bidt+3days>now); //3day 이내 
		require(_price*10000 > as[_aid]price);//기존 가격 보다 10000이상  커야 입찰 가능
		require(hit.msg.value==_price*1/100); //제시가격의 1% 보증금 납입
		hit.transfer(as[_aid]higer,as[_aid]depo); //그전 입찰자에게 보증금 돌려 줌
		as[_aid]price=_price;
		as[_aid]depo=_price*1/100;
		as[_aid]higher=msg.sender;
		as[_aid]state+=1;
		}
	
    function dbid(uint256 _aid) public {    //참여자 없을 경우 경매시간 연장 가능
	  require(as[_aid]owner==msg.sender);
	  require(as[_aid]higher==msg.sender);  //최고가 입찰자가 여전히 옥션오너일때 펌핑가능
      as[aid]bidt = now; //타임 리셋
    
	function balanceact(uint256 _aid) public returns(bool) {  //낙찰자 잔금 지불
	  require(as[_aid]bidt+3days<now); //경매시간 경과 확인
	  require(as[_aid]higher==msg.sender);  //최고가 제시자 인지 확인
	  uint256 pay=as[_aid]price-hitnft.g9(as[_aid]tid);    //잔금 산출  가격-대출금액 지불 대출 승계
	  require(hit.transfer(as[_aid]owner,pay)); //잔금 옥션 오너에게 입금 확인
	  tax+= as[_aid]depo;  //기존 보증금 세금 업
	  confirm(_aid,msg.sender); //nft 이체 
	  if(tax>=5000000){ hit.transfer(hitbank,tax);
	  tax=0;}
	  return true;


	function confirm(uint256 raid,address _owner) private returns(bool) {  //최종 확인 이 계약에서만 호출 가능
	   
        hitnft._transfer(address(this),as[raid]higher,as[raid]tid);  //nft토큰 낙찰자에게 이체 from
		hitnft.infoup(uint256[raid]tid,address ,uint256 newprice); //새로운 정보 업그레이드 
	 return true;		
	  	emit _confirm, raid);	
	}

    function g1() public view returns(uint) {
		return al.length;
	}

	function g2(address _owner) public view returns(uint[]) {
		uint[] memory ownera = owner[_owner];  //다수의 리스트 가져오기
		return ownera;
	}

	function g3(address _owner) public view returns(uint) {
		return owner[_owner].length;
	}

	function g4(uint _aId) public view returns(  //g1->차례로 호출
		string name,
		uint256 tid,
		uint8 state,
		uint256 price,
		address higher,
		uint256 depo,
		uint256 bidt,
		address owner,
		{
		return (                //가로 열고 
			as[_aid].name,   //쉼표 찍기 유의
			as[_aid].tid,
			as[_aid].state,
			as[_aid].price,
			as[_aid].higher,
			as[_aid].depo,
			as[_aid].bidt,
			as[_aid].owner) //가로 닫고
	}
	
function g5(uint _aid) public view returns(string)  //nft 메타정보 호출 
return  hitnft.as[as[_aid]tid].info;

	event AuctionCreated(address _owner, uint _aId);
	event AuctionFinalized(address _owner, uint _aId);
}

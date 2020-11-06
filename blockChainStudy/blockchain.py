'''
//(1)3개 터미널로 노드 3개를 실시.
python blockchain.py -p 5000 //5000은 터미널 번호. 터미널 번호는 임의로 가능.

//(2)포스트맨
탭 클릭한다 -> GET으로 설정후 
http://localhost:5000/chain
을 붙여 넣은 후 SEND클릭.
//5000은 터미널 번호. 터미널 번호는 임의로 가능.
포스트맨의 하단 터미널에 
{
    "chain": [
        {
            "index": 1,
            "previous_hash": "1",
            "proof": 100,
            "timestamp": 1603875372.9871192,
            "transactions": []
        }
    ],
    "length": 1
}
라고 현 체인정보가 뜬다.


'''

# https://medium.com/caulink/%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%9C%BC%EB%A1%9C-%EB%B8%94%EB%A1%9D%EC%B2%B4%EC%9D%B8-%EB%A7%8C%EB%93%A4%EA%B8%B0-part-1-4386dbc735e
#[참고]self 이해하기  https://wikidocs.net/1742 , https://velog.io/@magnoliarfsit/RePython-1.-self-%EC%9D%B4%ED%95%B4%ED%95%98%EA%B8%B0

import hashlib
import json
from time import time
from urllib.parse import urlparse
from uuid import uuid4

import requests
from flask import Flask, jsonify, request

'''
블럭의 구조
(1) index       : 블록 넘버
(2) timestamp   : 생성시간
(3) transaction : self.current_transactions
(4) proof       : 작업증명시 사용
(5) prev_hash   : 이전 블록해시 

class Blockchain:
[1]체인의 초기설정
구조(1)    def __init__(self):                         #대기중인 거래 목록

[2]신규 블록생성
구조(2)    def new_block(self, proof, previous_hash):

[3]신규 거래발생시
구조(3)    def new_transaction(self, sender, recipient, amount):   #새로운 거래 생성

[4]채굴 
구조(6)    @app.route('/mine', methods=['GET']) 
           def mine():

구조(4)    def proof_of_work(self, last_block):                     #채굴프로세스(필요재료 : last_block)
구조(5)    def valid_proof(last_proof, proof, last_hash):          #채굴 조건만족(=0000인가?)를 분석한다.
                           | (last_block이 필요합니다! )
구조(미정) def last_block(self):                                   
                           |블록체인 클래스가 있으니 이를 써먹자!
           blockchain.last_block

#[+Alpha] 사용의 편의성을 위해 한듯?
app = Flask(__name__)                            #Flask :웹프레임워크 중 하나. 웹상에서 정보를 주고받기 편하려고 쓴 듯하다. [참고] 플라스크는 무엇인가? https://wikidocs.net/81039
node_identifier = str(uuid4()).replace('-', '') # 노드 인식 방법
blockchain = Blockchain()                       # 블록체인을 인스턴스화

'''

class Blockchain:
    def __init__(self): #구조(1)
        self.current_transactions = []         # 대기중인 거래 목록  
        self.chain = []                        # 체인에는 블록들이 추가될 것.
        self.nodes = set()                     # self.new_block(previous_hash='1', proof=100) # 제네시스 블록 설정

    def register_node(self, address):
        parsed_url = urlparse(address)          #url형태에 따라서 반환하도록 if/elif/else문으로 걸러낸다.
        if parsed_url.netloc:
            self.nodes.add(parsed_url.netloc)
        elif parsed_url.path:
            self.nodes.add(parsed_url.path)
        else:
            raise ValueError('Invalid URL')


    def valid_chain(self, chain):               #옳은 체인이 무엇인지 결정하기 위해 valid_chain을 정의함.
        last_block = chain[0]
        current_index = 1
        while current_index < len(chain):
            block = chain[current_index]
            print(f'{last_block}')
            print(f'{block}')
            print("\n-----------\n")
            last_block_hash = self.hash(last_block)
            if block['previous_hash'] != last_block_hash:
                return False
            if not self.valid_proof(last_block['proof'], block['proof'], last_block_hash):
                return False

            last_block = block
            current_index += 1

        return True

    def resolve_conflicts(self):
        
        neighbours = self.nodes
        new_chain = None

        max_length = len(self.chain)
        for node in neighbours:
            response = requests.get(f'http://{node}/chain')

            if response.status_code == 200:  #
                length = response.json()['length']
                chain = response.json()['chain']

                # 문제 [나의 생각] 기존 체인의 길이 vs 새 체인의 길이 측량 후 가장긴 길이정보 업데이트
                # max_length는 나의 체인길이(우물안 개구리처럼 자기꺼만 아는 상황이라), valid_chain는 이웃의 체인길이
                if length > max_length and self.valid_chain(chain): #
                    max_length = length
                    new_chain = chain #나의 체인이 교체되었다는 의미

        if new_chain: #나의체인>이웃체인 길이일때 실시
            self.chain = new_chain
            return True
        # 문제
        return False


    def new_block(self, proof, previous_hash): #구조(2)
        block = {
            'index': len(self.chain) + 1,                                   #현재의 체인의 끝에 추가됨. 즉, 블록번호의 체인의 길이 +1
            'timestamp': time(),                                            #타임스탬프, 현재시간
            'transactions': self.current_transactions,                      #거래목록
            'proof': proof,                                                 #chain[-1] : 가장 마지막이라는 의미, 현존하는 체인의 마지막 블록은 새로운 블록의 이전 블록.
            'previous_hash': previous_hash or self.hash(self.chain[-1]),    #previous_hash값이 존재하면 previous_hash, 없을시 self.hash(self.chain[-1])를 받아온다.
        }
        self.current_transactions = []                                      #블록이 생성되면 대기 중인 거래 목록을 재초기화시킨다.
        '''
           self.current_transactions = []는 이후에 
            self.current_transactions = []  
            거래 1발생
          ->self.current_transactions = [1]
            거래 2발생
          ->self.current_transactions = [1,2]
            거래 3발생
          ->self.current_transactions = [1,2,3]           
        '''
        self.chain.append(block)                                            #새로운 블록을 현존하는 체인에 추가시킨다.
        return block

    def new_transaction(self, sender, recipient, amount):   #구조(3)새로운 거래 생성 - 거래는 ①송금자의 주소 /②수금자의 주소 / ③금액 3개의 변수구성.
        self.current_transactions.append({
                    'sender': sender,                       #①송금자의 주소
                    'recipient': recipient,                 #②수금자의 주소
                    'amount': amount,                       #③금액 
                })
        return self.last_block['index'] + 1                 #이 거래들은 새로 생성될 블록에 추가될 예정, 가장 마지막 블록의 다음 블록에 추가될 예정.
                                                            #라스트블록 =현재존재하는 체인에서 가장 마지막 블록에 -1을 더함 

#이하 ---------------------------------------------------------------------------------------------------------------------------------------------------
    @property
    def last_block(self):                                   #new_transaction의 last_block을 정의한다.
        return self.chain[-1]                               #마지막 블록은 체인의 가장 마지막 순서.

    @staticmethod
    def hash(block):
        block_string = json.dumps(block, sort_keys=True).encode()   
        '''
        block_string중간의 결과물이라고 할 수 있다. 
        block_string는 제이슨 형식으로 갖고 온다.
        sort_keys=True만 설정하고 싶어서 이렇게 함. 
        #[참고]json—JSON 인코더와 디코더- https://docs.python.org/ko/3/library/json.html
        '''
        return hashlib.sha256(block_string).hexdigest()             # block_string을 hash Library의 sha256형식으로 리턴한다.(inputValue:block_string,)

    def proof_of_work(self, last_block):                            # 구조(4)
        last_proof = last_block['proof']                            # 위에서 설정한 last_block의 proof 값은 last_proof으로 설정
        last_hash = self.hash(last_block)                           # 마지막 블록을 해시한 것이 마지막 해시값        
        proof = 0                                                   # valid proof가 옳게될 때까지 proof 값을 더한다. 

        while self.valid_proof(last_proof, proof, last_hash) is False: #만족체크는 def valid_proof(last_proof, proof, last_hash):에서 실시한다.
            proof += 1                                                 # proof값이 만족할 때까지 proof값을 계속 올린다.(proof는 블록체인의 논스와 같다.)     

        return proof


    @staticmethod
    def valid_proof(last_proof, proof, last_hash):           # 구조(5) # valid proof : proof가 만족했음을 의미하는 단어. proof가 0000이라는 조건을 만족했음을 체크하기 위한 용도.
        guess = f'{last_proof}{proof}{last_hash}'.encode()   # proof값은 계속 변화한다.
        guess_hash = hashlib.sha256(guess).hexdigest()       # 해시 값
        
        return guess_hash[:4] == "0000"                      # 첫 4개가 0이 되어야만 통과(리턴은 True/False 둘 중 하나 리턴된다.)


#[+Alpha] 사용의 편의성을 위해 한듯?
app = Flask(__name__)                            #Flask :웹프레임워크 중 하나. 웹상에서 정보를 주고받기 편하려고 쓴 듯하다. [참고] 플라스크는 무엇인가? https://wikidocs.net/81039
node_identifier = str(uuid4()).replace('-', '') # 노드 인식 방법
blockchain = Blockchain()                       # 블록체인을 인스턴스화 blockchain는 클래스  Blockchain() 의 기능등을 그


# 포스트맵에서 실행 되도록 명령 작성. ================================================================================================================================
@app.route('/mine', methods=['GET'])                #포스맵의 get/post버튼에서 get으로 설정
def mine():                                         #구조(6) 포스트맵에서 채굴기능 실시.
    last_block = blockchain.last_block              #마지막 블록을 정의. (#채굴을 위한 준비물 : 라스트 블록)
    proof = blockchain.proof_of_work(last_block)    #proof정의           (#proof=논스=채굴링채굴링...)

    blockchain.new_transaction(                     #coinbase 거래(#채굴=최초거래)(새로운 블록생성)
        sender="0",
        recipient=node_identifier,
        amount=1,
    )

    previous_hash = blockchain.hash(last_block)          # 이전 블록 해시값 설정, 마지막 블록의 해시값으로 
    block = blockchain.new_block(proof, previous_hash)   # proof와 previous_hash 이용해서 새로운 블록 생성.
 
    response = {                                         # 포스트맨의 하단 커맨드창에 알림해주는 문구내용.
        'message': "New Block Forged",
        'index': block['index'],
        'transactions': block['transactions'],
        'proof': block['proof'],
        'previous_hash': block['previous_hash'],
    }
    return jsonify(response), 200


@app.route('/transactions/new', methods=['POST']) #포스트맨에서 거래 실행을 하는 기능.
def new_transaction():
    values = request.get_json()


    required = ['sender', 'recipient', 'amount']  #
    if not all(k in values for k in required):
        return 'Missing values', 400

    index = blockchain.new_transaction(values['sender'], values['recipient'], values['amount'])

    response = {'message': f'Transaction will be added to Block {index}'}
    return jsonify(response), 201

@app.route('/chain', methods=['GET'])
def full_chain():
    response = {                            #정의했던 체인을 호출합니다. 클래스 Blockchain의 chain길이 -> length로 조회 가능.(len기능 실시)
        'chain': blockchain.chain,
        'length': len(blockchain.chain),
    }
    return jsonify(response), 200


@app.route('/nodes/register', methods=['POST'])
def register_nodes():                                               #노드 등록방법.
    values = request.get_json()

    nodes = values.get('nodes')                                     
    if nodes is None:                                              #조건문 통해 노드등록 확인, 없을시 에러문 출력.
        return "Error: Please supply a valid list of nodes", 400

    for node in nodes:                                              #올바른 주소를 입력하면 node들을 반환함.
        blockchain.register_node(node)

    response = {                                                   # 노드가 등록되었다는 메시지를 반환합니다.
        'message': 'New nodes have been added',
        'total_nodes': list(blockchain.nodes),                     #전체 노드들을 반환
    }
    return jsonify(response), 201


@app.route('/nodes/resolve', methods=['GET'])
def consensus():
    replaced = blockchain.resolve_conflicts()

    if replaced:
        response = {
            'message': 'Our chain was replaced',
            'new_chain': blockchain.chain
        }
    else:
        response = {
            'message': 'Our chain is authoritative',
            'chain': blockchain.chain
        }

    return jsonify(response), 200


if __name__ == '__main__':
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('-p', '--port', default=5000, type=int, help='port to listen on')
    args = parser.parse_args()
    port = args.port

    app.run(host='0.0.0.0', port=port)


@app.route('/transactions/new', methods=['POST'])
def new_transaction() :
    values = request.get_json()

    required = ['sender','recipient','amount']
    if not all(k in values for k in required) :
        return 'Missing values', 400

    index = blockchain.new_transaction(values['sender'],values['recipient'], values['amount'])

    response = {'messsage' : 'Transaction will be added to Block {index}'}
    return jsonify(response), 201

@app.route('/chain', methods=['GET'])
def full_chain

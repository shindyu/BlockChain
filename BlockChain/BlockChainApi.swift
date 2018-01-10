import Foundation

// blockchainの動きをviewで表示するためのエンドポイントの仮実装
class BlockChainApi {
    let blockchain: BlockChain

    init(dateProvider: DateProvider) {
        blockchain = BlockChain(dateProvider: dateProvider)
    }
    
    func createTransaction(sender: String, recipient: String, amount: Int) -> String {
        let index = blockchain.createTransaction(sender:sender, recipient:recipient, amount:amount)
        let jsonObject = ["message": "トランザクションはブロック{\(index)}に追加されました"]
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonObject, options: [])
        let jsonStr = String(bytes: jsonData, encoding: .utf8)!
        return jsonStr
    }

    func mine() -> String {
        let lastBlock = blockchain.lastBlock
        let lastProof = lastBlock.proof
        let proof = BlockChain.proofOfWork(lastProof: lastProof)

        // 採掘報酬
        blockchain.createTransaction(sender: "0", recipient: "miner", amount: 1)

        let newBlock = blockchain.createBlock(proof: proof)

        let data = try! JSONEncoder().encode(newBlock)
        let json = String(data: data, encoding: .utf8)!
        return json
    }

    func fullChain() -> [Block] {
        return blockchain.chain
    }
}

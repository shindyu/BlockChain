import Foundation

// blockchainの動きをviewで表示するためのエンドポイントの仮実装
class BlockChainApi {
    func createTransaction() {

    }

    func mine() {

    }

    func fullChain() {

    }
}
class BlockChainService: NSObject {

    // ブロックチェーンクラスのインスタンス
    let blockchain = BlockChain(dateProvider: DefaultDateProvider())

    // トランザクションのエンドポイント
    func send(sender: String, recipient: String, amount: Int) -> Int {
        return blockchain.createTransaction(sender:sender, recipient:recipient, amount:amount)
    }

    // 採掘のエンドポイント
    func mine(recipient: String) -> Block {
        // 次のプルーフを見つけるためプルーフ・オブ・ワークアルゴリズムを使用する
        let lastBlock = blockchain.lastBlock
        let lastProof = lastBlock.proof
        let proof = BlockChain.proofOfWork(lastProof: lastProof)

        // プルーフを見つけたことに対する報酬を得る
        // 送信者は、採掘者が新しいコインを採掘したことを表すために"0"とする
        blockchain.createTransaction(sender: "0", recipient: recipient, amount: 1)

        // チェーンに新しいブロックを加えることで、新しいブロックを採掘する
        let block = blockchain.createBlock(proof: proof, previousHash: nil)

        return block
    }

    // フルのブロックチェーンを返すエンドポイント
    func chain() -> [Block] {
        return blockchain.chain
    }
}

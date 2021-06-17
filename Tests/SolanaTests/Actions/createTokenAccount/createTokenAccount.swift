import XCTest
import RxSwift
import RxBlocking
@testable import Solana

class createTokenAccount: XCTestCase {
    var endpoint = Solana.RpcApiEndPoint.devnetSolana
    var solanaSDK: Solana!
    var account: Solana.Account { solanaSDK.accountStorage.account! }

    override func setUpWithError() throws {
        let wallet: TestsWallet = .devnet
        solanaSDK = Solana(endpoint: endpoint, accountStorage: InMemoryAccountStorage())
        let account = try Solana.Account(phrase: wallet.testAccount.components(separatedBy: " "), network: endpoint.network)
        try solanaSDK.accountStorage.save(account)
    }
    
    func testCreateTokenAccount() throws {
        let mintAddress = "6AUM4fSvCAxCugrbJPFxTqYFp9r3axYx973yoSyzDYVH"
        let account = try solanaSDK.createTokenAccount( mintAddress: mintAddress).toBlocking().first()
        XCTAssertNotNil(account)
    }
    
    func testCreateAccountInstruction() throws {
        let instruction = Solana.SystemProgram.createAccountInstruction(from: Solana.PublicKey.programId, toNewPubkey: Solana.PublicKey.programId, lamports: 2039280, space: 165, programPubkey: Solana.PublicKey.programId)
        
        XCTAssertEqual("11119os1e9qSs2u7TsThXqkBSRUo9x7kpbdqtNNbTeaxHGPdWbvoHsks9hpp6mb2ed1NeB", Base58.encode(instruction.data))
    }
}

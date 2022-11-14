import Foundation

public struct ConfirmedTransaction: Decodable {
    public let message: Message
    let signatures: [String]
}
public struct ConfirmedTransactionFromBlock: Decodable {
    public let message: MessageWithAccountKeys
    let signatures: [String]
}

public extension ConfirmedTransaction {
    struct Message: Decodable {
        public let accountKeys: [AccountMeta]
        public let instructions: [ParsedInstruction]
        public let recentBlockhash: String
    }
}
public extension ConfirmedTransactionFromBlock {
    struct MessageWithAccountKeys: Decodable {
        public let accountKeys: [String]
        public let instructions: [ParsedInstructionFromBlock]
        public let recentBlockhash: String
    }
}
public struct ParsedInstruction: Decodable {
    public struct Parsed: Decodable {
        public struct Info: Decodable {
            public let owner: String?
            public let account: String?
            public let source: String?
            public let destination: String?

            // create account
            public let lamports: UInt64?
            public let newAccount: String?
            public let space: UInt64?

            // initialize account
            public let mint: String?
            public let rentSysvar: String?

            // approve
            public let amount: String?
            // swiftlint:disable all
            public var delegate: String?
            
            // transfer
            public let authority: String?
            
            // transferChecked
            public let tokenAmount: TokenAccountBalance?
        }
        let info: Info
        let type: String?
    }
    
    let program: String?
    let programId: String?
    public let parsed: Parsed?
    
    // swap
    public let data: String?
    let accounts: [String]?
}
public struct ParsedInstructionFromBlock: Decodable {
    struct Parsed: Decodable {
        struct Info: Decodable {
            let owner: String?
            let account: String?
            let source: String?
            let destination: String?
            
            // create account
            let lamports: UInt64?
            let newAccount: String?
            let space: UInt64?
            
            // initialize account
            let mint: String?
            let rentSysvar: String?
            
            // approve
            let amount: String?
            // swiftlint:disable all
            var delegate: String?
            
            // transfer
            let authority: String?
            
            // transferChecked
            let tokenAmount: TokenAccountBalance?
        }
        let info: Info
        let type: String?
    }
    
    let program: String?
    let programId: String?
    let parsed: Parsed?
    
    // swap
    public let data: String?
    let accounts: [UInt64]?
}

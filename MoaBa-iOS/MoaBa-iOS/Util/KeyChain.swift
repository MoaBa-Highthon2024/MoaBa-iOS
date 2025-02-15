import SwiftUI

class KeyChain {
    
    private static let key = "MoaBaTokenKey"
    private static let service = Bundle.main.bundleIdentifier ?? "com.highthon.Moaba-iOS"
    
    static func create(token: String) -> Bool {
        guard let data = try? JSONEncoder().encode(token) else {
            return false
        }
        
        let query: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData: data
        ]
        
        
        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == -25299 {
            if self.delete() {
                return false
            }
        }
        
        return status == errSecSuccess
        
        
    }
    
    static func read() -> SignInResponse? {
        let query: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue as Any
        ]
        
        var itemCopy: CFTypeRef?
        
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)
        
        if status == errSecSuccess {
            let retrievedData = itemCopy as! Data
            let value = try? JSONDecoder().decode(SignInResponse.self, from: retrievedData)
            return value
        } else {
            return nil
        }
    }
    
    static func update(token: SignInResponse) -> Bool {
        
        guard let data = try? JSONEncoder().encode(token) else {
            print("s")
            return false
        }
        
        let beforeQuery: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
        ]
        
        let updatedQuery: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key,
            kSecValueData: data
        ]
        
        let status = SecItemUpdate(beforeQuery as CFDictionary, updatedQuery as CFDictionary)
        
        return status == errSecSuccess
        
        
    }
    
    static func delete() -> Bool {
        let query: NSDictionary = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: key
        ]
        
        return SecItemDelete(query as CFDictionary) == errSecSuccess
    }
}

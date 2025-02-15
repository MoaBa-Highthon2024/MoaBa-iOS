import SwiftUI

class MBUserDefault {
    private init() {}

    private static let key = "MoaBaTokenKey"
    private static let service = Bundle.main.bundleIdentifier ?? "com.highthon.Moaba-iOS"
    
    static func create(token: String) -> Bool {
        UserDefaults.standard.set(token, forKey: key)
        return UserDefaults.standard.string(forKey: key) == token
    }
    
    static func read() -> String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    static func update(token: String) -> Bool {
        UserDefaults.standard.set(token, forKey: key)
        return UserDefaults.standard.string(forKey: key) != nil
    }
    
    @discardableResult
    static func delete() -> Bool {
        UserDefaults.standard.removeObject(forKey: key)
        return UserDefaults.standard.string(forKey: key) == nil
    }
}

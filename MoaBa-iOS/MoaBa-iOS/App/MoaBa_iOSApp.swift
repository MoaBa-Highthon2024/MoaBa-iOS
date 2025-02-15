//
//  MoaBa_iOSApp.swift
//  MoaBa-iOS
//
//  Created by 홍승재 on 2/15/25.
//

import SwiftUI

@main
struct MoaBa_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Group {
                    if KeyChain.read() == nil {
                        StartView()
                    }
                    else {
                        EmptyView()
                    }
                }
                .navigationBarHidden(true)
                
            }
        }
    }
}

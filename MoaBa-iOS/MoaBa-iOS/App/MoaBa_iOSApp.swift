//
//  MoaBa_iOSApp.swift
//  MoaBa-iOS
//
//  Created by 홍승재 on 2/15/25.
//

import SwiftUI

@main
struct MoaBa_iOSApp: App {
    @ObservedObject var appState: AppStateProvider

    init() {
        MBUserDefault.delete()
        self.appState = AppStateProvider(sceneFlow: MBUserDefault.read() == nil ? .auth : .main)
    }

    var body: some Scene {
        WindowGroup {
            Group {
                switch appState.sceneFlow {
                case .auth:
                    StartView()
                case .main:
                    MainTabView()
                }
            }
            .navigationBarHidden(true)
            .environmentObject(appState)
            .animation(.easeInOut, value: appState.sceneFlow)
        }
    }
}

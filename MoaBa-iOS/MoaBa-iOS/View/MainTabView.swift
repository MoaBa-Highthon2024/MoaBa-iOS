import SwiftUI

struct MainTabView: View {
    enum Tab {
        case home
        case shop
        case chat
        case myPage
    }
    
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                Group {
                    NavigationStack {
                        HomeView()
                    }
                    .tag(Tab.home)
                    
                    NavigationStack {
                        ShopView()
                    }
                    .tag(Tab.shop)
                    
                    NavigationStack {
                        Text("chat")
                    }
                    .tag(Tab.chat)
                    
                    NavigationStack {
                        Text("myPage")
                    }
                    .tag(Tab.myPage)
                }
                .toolbar(.hidden, for: .tabBar)
            }
                        
            VStack(spacing: 0) {
                Spacer()
                
                Divider()
                
                tabBar
                    .padding(.vertical, 4)
            }
        }
    }
    
    var tabBar: some View {
        HStack(spacing: 0) {
            Spacer()
            
            Button {
                selectedTab = .home
            } label: {
                VStack(spacing: 2) {
                    Image(systemName: "house")
                    
                    Text("Home")
                }
            }
            .foregroundStyle(selectedTab == .home ? .black : Color.MoaBa.lightGray)
            
            Spacer()
            
            Button {
                selectedTab = .shop
            } label: {
                VStack(spacing: 2) {
                    Image(systemName: "cart")
                    
                    Text("Shop")
                }
            }
            .foregroundStyle(selectedTab == .shop ? .black : Color.MoaBa.lightGray)
            
            Spacer()
            
            Button {
                selectedTab = .chat
            } label: {
                VStack(spacing: 2) {
                    Image(systemName: "message")
                    
                    Text("Chat")
                }
            }
            .foregroundStyle(selectedTab == .chat ? .black : Color.MoaBa.lightGray)
            
            Spacer()
            
            Button {
                selectedTab = .myPage
            } label: {
                VStack(spacing: 2) {
                    Image(systemName: "person.circle")
                    
                    Text("MyPage")
                }
            }
            .foregroundStyle(selectedTab == .myPage ? .black : Color.MoaBa.lightGray)
            
            Spacer()
        }
        .frame(height: 51)
    }
}

#Preview {
    MainTabView()
}

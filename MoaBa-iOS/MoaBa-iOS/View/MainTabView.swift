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
                        Text("home")
                    }
                    .tag(Tab.home)
                    
                    NavigationStack {
                        Text("shop")
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
                        
            VStack {
                Spacer()
                
                Divider()
                
                tabBar
            }
        }
    }
    
    var tabBar: some View {
        HStack {
            Spacer()
            
            Button {
                selectedTab = .home
            } label: {
                VStack {
                    Image(systemName: "house")
                    
                    Text("Home")
                }
            }
            .foregroundStyle(selectedTab == .home ? .black : Color.MoaBa.lightGray)
            
            Spacer()
            
            Button {
                selectedTab = .shop
            } label: {
                VStack {
                    Image(systemName: "cart")
                    
                    Text("Shop")
                }
            }
            .foregroundStyle(selectedTab == .shop ? .black : Color.MoaBa.lightGray)
            
            Spacer()
            
            Button {
                selectedTab = .chat
            } label: {
                VStack {
                    Image(systemName: "message")
                    
                    Text("Chat")
                }
            }
            .foregroundStyle(selectedTab == .chat ? .black : Color.MoaBa.lightGray)
            
            Spacer()
            
            Button {
                selectedTab = .myPage
            } label: {
                VStack {
                    Image(systemName: "person.circle")
                    
                    Text("MyPage")
                }
            }
            .foregroundStyle(selectedTab == .myPage ? .black : Color.MoaBa.lightGray)
            
            Spacer()
        }
        .frame(height: 40)
    }
}

#Preview {
    MainTabView()
}

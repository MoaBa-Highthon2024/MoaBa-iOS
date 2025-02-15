import SwiftUI

enum AuthPath {
    case signin
    case signup
}

struct StartView: View {
    @State private var path = [AuthPath]()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.MoaBa.lightPurple.ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Image(.appLogo)
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical)
                    
                    Text("모아바")
                        .mbFont(size: 32, weight: .bold, color: .black)
                    
                    Text("팬덤이 만드는 거대한 세계")
                        .mbFont(size: 16, weight: .semiBold, color: .black)
                    
                    Spacer()
                        .frame(height: 150)
                    
                    MBButton(text: "로그인") {
                        path.append(.signin)
                    }

                    MBButton(text: "회원가입", type: .sub) {
                        path.append(.signup)
                    }
                
                    Spacer()
                        .frame(height: 30)
                }
                .padding(.horizontal, 20)
            }
            .navigationDestination(for: AuthPath.self) { value in
                switch value {
                case .signin: SignInView(path: $path)
                case .signup: SignUpView(path: $path)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        StartView()
    }
}

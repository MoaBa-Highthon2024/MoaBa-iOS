import SwiftUI

struct StartView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.MoaBa.lightPurple.ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .padding(.vertical)
                    
                    Text("모아바")
                        .mbFont(size: 32, weight: .bold, color: .black)
                    
                    Text("팬덤이 만드는 거대한 세계")
                        .mbFont(size: 16, weight: .semiBold, color: .black)
                    
                    Spacer()
                        .frame(height: 150)
                    
                    RoundedRectangle(cornerRadius: 13)
                        .frame(maxWidth: .infinity)
                        .frame(height: 52)
                        .foregroundStyle(Color.MoaBa.purple)
                        .overlay {
                            MBButton(text: "로그인") {
                                path.append("SignInView")
                            }
                        }
                    
                    RoundedRectangle(cornerRadius: 13)
                        .frame(width: 360, height: 52)
                        .foregroundStyle(Color.MoaBa.lightGray)
                        .overlay {
                            MBButton(text: "회원가입") {
                                path.append("SignUpView")
                            }
                        }
                    
                    Spacer()
                        .frame(height: 30)
                }
                .padding(.horizontal, 20)
            }
            .navigationDestination(for: String.self) { value in
                if value == "SignInView" {
                    SignInView()
                }
                if value == "SignUpView" {
                    SignUpView()
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

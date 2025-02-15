import SwiftUI

struct SignUpView: View {
    @AppState var appState
    @Binding var path: [AuthPath]
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("모아바가 처음이라면?")
                .mbFont(size: 26, weight: .bold, color: .black)
                .padding(.top, 50)
            
            Text("닉네임과 비밀번호를 입력해주세요")
                .mbFont(size: 16, weight: .semiBold, color: .black)
                .padding(.vertical, 20)
            
            MBTextField("이메일을 입력해주세요", text: $viewModel.model.email)
            MBTextField("닉네임을 입력해주세요", text: $viewModel.model.username)
            MBSecureField("비밀번호를 입력해주세요", text: $viewModel.model.password)
            MBSecureField("비밀번호를 다시 입력해주세요", text: $viewModel.model.confirm_password)
            
            Spacer()
            
            VStack {
                MBButton(text: "회원가입") {
                    viewModel.signUp()
                }
                
                HStack {
                    Text("계정이 있다면?")
                        .mbFont(size: 14, weight: .medium, color: .MoaBa.darkGray)
                    
                    Button {
                        self.path.removeLast()
                        self.path.append(.signin)
                    } label: {
                        Text("로그인")
                            .mbFont(size: 14, weight: .medium, color: .MoaBa.purple)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        .navigationBar(title: "회원가입")
        .onChange(of: viewModel.isSuccessSignin) { isSuccess in
            guard isSuccess else { return }
            self.appState.sceneFlow = .main
        }
    }
}

#Preview {
    NavigationView {
        SignUpView(path: .constant([.signup]))
    }
}

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel = SignInViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("다시 만나 반가워요")
                .mbFont(size: 32, weight: .bold, color: .black)
                .padding(.vertical, 50)
            
            MBTextField("이메일을 입력해주세요", text: $viewModel.model.email)
            MBSecureField("비밀번호를 입력해주세요", text: $viewModel.model.password)
            
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 13)
                    .frame(width: .infinity, height: 52)
                    .foregroundStyle(Color.MoaBa.purple)
                    .overlay {
                        MBButton(text: "로그인") {
                            viewModel.signIn()
                        }
                    }
                
                HStack {
                    Text("계정이 없다면?")
                        .mbFont(size: 14, weight: .medium, color: .MoaBa.darkGray)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("회원가입")
                            .mbFont(size: 14, weight: .medium, color: .MoaBa.purple)
                    }
                }
                .padding(.bottom, 30)
            }
        }
        .padding(.horizontal, 20)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                HStack(spacing: 0) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "arrow.left")
                            .mbFont(size: 16, weight: .semiBold, color: .black)
                    }
                    
                    Text("로그인")
                        .mbFont(size: 16, weight: .semiBold, color: .black)
                }
            }
        }
    }
}

#Preview {
    NavigationView {
        SignInView()
    }
}

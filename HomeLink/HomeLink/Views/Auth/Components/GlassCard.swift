//
//  GlassCard.swift
//  HomeLink
//
//  Created by Pedro Andriotti on 10/09/24.
//

import SwiftUI

struct GlassCard: View {
    var userName: String
    var userMail: String
    var userPhone: String
    var amazonMail: String?
    var amazonPassword: String?
    @Binding var showPurpleCard: Bool
    
    var body: some View {
        ZStack {
            if showPurpleCard {
                
                // MARK: Purple Card
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .background(BlurView(style: .systemUltraThinMaterial))
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(radius: 10)
                    .offset(y: 0)
                    .animation(.easeInOut(duration: 0.5), value: showPurpleCard)
                
                // MARK: Blue Card
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .background(BlurView(style: .systemUltraThinMaterial))
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(radius: 10)
                    .offset(y: -30)
                    .animation(.easeInOut(duration: 0.5), value: showPurpleCard)
            } else {
                // MARK: Blue Card
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.cyan.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .background(BlurView(style: .systemUltraThinMaterial))
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(radius: 10)
                    .offset(y: 0)
                    .animation(.easeInOut(duration: 0.5), value: showPurpleCard)
                
                // MARK: Purple Card
                RoundedRectangle(cornerRadius: 25)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.5), Color.blue.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .background(BlurView(style: .systemUltraThinMaterial))
                    .cornerRadius(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.white.opacity(0.3), lineWidth: 1)
                    )
                    .shadow(radius: 10)
                    .offset(y: -30)
                    .animation(.easeInOut(duration: 0.5), value: showPurpleCard)
            }
            
            VStack(alignment: .leading, spacing: 10) {
                if showPurpleCard {
                    // MARK: Blue Card Content
                    Text("Conta Amazon")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(amazonMail ?? "Não Informado")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text(amazonPassword ?? "Não Informado")
                        .font(.subheadline)
                        .foregroundColor(.white)
                } else {
                    // MARK: Purple Card Content
                    Text("Detalhes da Conta")
                        .font(.title)
                        .foregroundColor(.white)
                    Text(userName)
                        .font(.title2)
                        .foregroundColor(.white)
                    Text(userMail)
                        .font(.subheadline)
                        .foregroundColor(.white)
                    Text(userPhone)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showPurpleCard.toggle()
                        }
                    }) {
                        Image(systemName: "square.2.layers.3d.bottom.filled")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .padding(.bottom, 24)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 250)
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}

#Preview {
    StatefulPreviewWrapper(true) { showPurpleCard in
        GlassCard(userName: "Pedro Andriotti", userMail: "pedro@example.com", userPhone: "(81) 99999-9999", amazonMail: "pedroandriotti@homelinkbr.com", amazonPassword: "Teste123", showPurpleCard: showPurpleCard)
    }
}

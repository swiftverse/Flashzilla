//
//  CardView.swift
//  Flashzilla
//
//  Created by Amit Shrivastava on 28/01/22.
//

//import SwiftUI
//
//struct CardView: View {
//    let card: Card
//    var removal: (() -> Void)? = nil
//    @State private var isShowingAnswer = false
//    @State private var offset = CGSize.zero
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//    @State private var feedback = UINotificationFeedbackGenerator()
//    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
//
//    var body: some View {
//        ZStack {
//
//            RoundedRectangle(cornerRadius: 25, style: .continuous)
//
//                .fill(differentiateWithoutColor ? .white :  .white
//                .opacity(1 - Double(abs(offset.width / 50)))
//                      )
//                .background(
//
//                    differentiateWithoutColor ? nil :
//                    RoundedRectangle(cornerRadius: 25, style: .continuous)
//                 //   .fill(offset.width > 0 ? .green : .red))
//                        .fill(colorFunc(for: offset.width)))
//                        .shadow(radius: 10)
//            VStack {
//                if voiceOverEnabled {
//                    Text(isShowingAnswer ? card.answer : card.prompt)
//                        .font(.largeTitle)
//                        .foregroundColor(.black)
//                } else {
//                Text(card.prompt)
//                    .font(.largeTitle)
//                    .foregroundColor(.black)
//                if isShowingAnswer {
//                Text(card.answer)
//                    .font(.title)
//                    .foregroundColor(.gray)
//                }
//                }
//            }
//            .padding(20)
//            .multilineTextAlignment(.center)
//        }
//        .frame(width: 450, height: 250)
//        .rotationEffect(.degrees(Double(offset.width / 5)))
//        .offset(x: offset.width * 5 , y: 0)
//        .opacity(2 - Double(abs(offset.width / 50)))
//        .accessibilityAddTraits(.isButton)
//        .gesture(
//            DragGesture()
//                .onChanged { gesture in
//                    offset = gesture.translation
//
//                    feedback.prepare()
//                }
//                .onEnded{ _ in
//                    if abs(offset.width) > 100 {
//                        if offset.width > 0 {
//                            feedback.notificationOccurred(.success)
//                        } else {
//                            feedback.notificationOccurred(.error)
//                        }
//                        removal?()
//                    } else {
//                            offset = .zero
//                        }
//
//
//
//                }
//        )
//
//        .onTapGesture {
//            isShowingAnswer.toggle()
//        }
//        .animation(.spring(), value: offset)
//
//
//    }
//
//
//    func colorFunc(for val: Double) -> Color {
//        switch val {
//        case  let green where green > 0:
//            return .green
//        case let red where red < 0:
//            return .red
//        default:
//            return .white
//        }
//    }
//}
//
//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardView(card: Card.example)
//.previewInterfaceOrientation(.portrait)
//    }
//}





//import SwiftUI
//
//struct CardView: View {
//    let card: Card
//    var removal: (() -> Void)? = nil
//    @State private var isShowingAnswer = false
//    @State private var offset = CGSize.zero
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//    @State private var feedback = UINotificationFeedbackGenerator()
//    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
//    let savePath = FileManager.documentsDirectory.appendingPathComponent("Cards")
//
//    @State private var cards = [Card]()
//    var body: some View {
//        ZStack {
//
//            RoundedRectangle(cornerRadius: 25, style: .continuous)
//
//                .fill(differentiateWithoutColor ? .white :  .white
//                .opacity(1 - Double(abs(offset.width / 50)))
//                      )
//                .background(
//
//                    differentiateWithoutColor ? nil :
//                    RoundedRectangle(cornerRadius: 25, style: .continuous)
//                 //   .fill(offset.width > 0 ? .green : .red))
//                        .fill(colorFunc(for: offset.width)))
//                        .shadow(radius: 10)
//            VStack {
//                if voiceOverEnabled {
//                    Text(isShowingAnswer ? card.answer : card.prompt)
//                        .font(.largeTitle)
//                        .foregroundColor(.black)
//                } else {
//                Text(card.prompt)
//                    .font(.largeTitle)
//                    .foregroundColor(.black)
//                if isShowingAnswer {
//                Text(card.answer)
//                    .font(.title)
//                    .foregroundColor(.gray)
//                }
//                }
//            }
//            .padding(20)
//            .multilineTextAlignment(.center)
//        }
//        .frame(width: 450, height: 250)
//        .rotationEffect(.degrees(Double(offset.width / 5)))
//        .offset(x: offset.width * 5 , y: 0)
//        .opacity(2 - Double(abs(offset.width / 50)))
//        .accessibilityAddTraits(.isButton)
//        .gesture(
//            DragGesture()
//                .onChanged { gesture in
//                    offset = gesture.translation
//
//                    feedback.prepare()
//                }
//                .onEnded{ _ in
//                    if abs(offset.width) > 100 {
//                        if offset.width > 0 {
//                            feedback.notificationOccurred(.success)
//                        } else {
//                            feedback.notificationOccurred(.error)
//
//                        }
//                        removal?()
//
//
//                    } else {
//                            offset = .zero
//                        }
//                }
//        )
//
//        .onTapGesture {
//            isShowingAnswer.toggle()
//        }
//        .animation(.spring(), value: offset)
//
//
//    }
//
//
//    func colorFunc(for val: Double) -> Color {
//        switch val {
//        case  let green where green > 0:
//            return .green
//        case let red where red < 0:
//            return .red
//        default:
//            return .white
//        }
//    }
//
//}
//
//struct CardView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        CardView(card: Card.example)
//.previewInterfaceOrientation(.portrait)
//    }
//}
//


import SwiftUI

struct CardView: View {
    let card: Card
    var removal: ((Bool) -> Void)? = nil
    @State private var isShowingAnswer = false
    @State private var offset = CGSize.zero
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @State private var feedback = UINotificationFeedbackGenerator()
    @Environment(\.accessibilityVoiceOverEnabled) var voiceOverEnabled
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Cards")

    @State private var cards = [Card]()
    var body: some View {
        ZStack {

            RoundedRectangle(cornerRadius: 25, style: .continuous)

                .fill(differentiateWithoutColor ? .white :  .white
                .opacity(1 - Double(abs(offset.width / 50)))
                      )
                .background(

                    differentiateWithoutColor ? nil :
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                 //   .fill(offset.width > 0 ? .green : .red))
                      //  .fill(colorFunc(for: offset.width)))
                        .fill(using: offset))
                        .shadow(radius: 10)
            VStack {
                if voiceOverEnabled {
                    Text(isShowingAnswer ? card.answer : card.prompt)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                } else {
                Text(card.prompt)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                if isShowingAnswer {
                Text(card.answer)
                    .font(.title)
                    .foregroundColor(.gray)
                }
                }
            }
            .padding(20)
            .multilineTextAlignment(.center)
        }
        .frame(width: 450, height: 250)
        .rotationEffect(.degrees(Double(offset.width / 5)))
        .offset(x: offset.width * 5 , y: 0)
        .opacity(2 - Double(abs(offset.width / 50)))
        .accessibilityAddTraits(.isButton)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation

                    feedback.prepare()
                }
                .onEnded{ _ in
                    if abs(offset.width) > 100 {
                        if offset.width > 0 {
                            feedback.notificationOccurred(.success)
                            removal?(false)
                        } else {
                            feedback.notificationOccurred(.error)
                            removal?(true)
                            offset = .zero
                        }
                        


                    } else {
                            offset = .zero
                        }
                }
        )

        .onTapGesture {
            isShowingAnswer.toggle()
        }
        .animation(.spring(), value: offset)


    }


//    func colorFunc(for val: Double) -> Color {
//        switch val {
//        case  let green where green > 0:
//            return .green
//        case let red where red < 0:
//            return .red
//        default:
//            return .white
//        }
//    }

}

struct CardView_Previews: PreviewProvider {

    static var previews: some View {
        CardView(card: Card.example)
.previewInterfaceOrientation(.portrait)
    }
}
//keep logic out of SwitUI views
extension Shape {
    func fill(using offset: CGSize) -> some View {
        if offset.width == 0 {
            return self.fill(.white)
        } else if offset.width < 0 {
            return self.fill(.red)
        } else {
            return self.fill(.green)
        }
    }
}








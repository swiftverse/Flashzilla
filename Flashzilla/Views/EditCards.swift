//
//  EditCards.swift
//  Flashzilla
//
//  Created by Amit Shrivastava on 30/01/22.
//

//import SwiftUI
//
//private enum Field: Int, Hashable {
//    case prompt, answer
//}
//
//struct EditCards: View {
//    @Environment(\.dismiss) var dismiss
//       @State private var cards = [Card]()
//       @State private var newPrompt = ""
//       @State private var newAnswer = ""
//    @FocusState private var focusedField: Field?
//    var body: some View {
//        NavigationView {
//                   List {
//                       Section("Add new card") {
//                           TextField("Prompt", text: $newPrompt)
//                               .focused($focusedField, equals: .prompt)
//                           TextField("Answer", text: $newAnswer)
//                           Button("Add card", action: addCard)
//                       }
//
//                       Section {
//                           ForEach(0..<cards.count, id: \.self) { index in
//                               VStack(alignment: .leading) {
//                                   Text(cards[index].prompt)
//                                       .font(.headline)
//                                   Text(cards[index].answer)
//                                       .foregroundColor(.secondary)
//                               }
//                           }
//                           .onDelete(perform: removeCards)
//                       }
//                   }
//                   .navigationTitle("Edit Cards")
//                   .toolbar {
//                       Button("Done", action: done)
//                   }
//                   .listStyle(.grouped)
//                   .onAppear(perform: loadData)
//               }
//           }
//
//           func done() {
//               dismiss()
//           }
//
//           func loadData() {
//               if let data = UserDefaults.standard.data(forKey: "Cards") {
//                   if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
//                       cards = decoded
//                   }
//               }
//           }
//
//           func saveData() {
//               if let data = try? JSONEncoder().encode(cards) {
//                   UserDefaults.standard.set(data, forKey: "Cards")
//               }
//           }
//
//           func addCard() {
//               let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
//               let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
//               guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
//
//               let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
//               cards.insert(card, at: 0)
//               newPrompt = ""
//               newAnswer = ""
//               focusedField = .prompt
//               saveData()
//           }
//
//           func removeCards(at offsets: IndexSet) {
//               cards.remove(atOffsets: offsets)
//               saveData()
//           }
//
//
//}
//
//struct EditCards_Previews: PreviewProvider {
//    static var previews: some View {
//        EditCards()
//    }
//}


import SwiftUI

private enum Field: Int, Hashable {
    case prompt, answer
}

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards = DataManager.load()
       @State private var newPrompt = ""
       @State private var newAnswer = ""
    @FocusState private var focusedField: Field?
    let savePath = FileManager.documentsDirectory.appendingPathComponent("Cards")
    var body: some View {
        NavigationView {
                   List {
                       Section("Add new card") {
                           TextField("Prompt", text: $newPrompt)
                               .focused($focusedField, equals: .prompt)
                           TextField("Answer", text: $newAnswer)
                           Button("Add card", action: addCard)
                       }

                       Section {
                           ForEach(0..<cards.count, id: \.self) { index in
                               VStack(alignment: .leading) {
                                   Text(cards[index].prompt)
                                       .font(.headline)
                                   Text(cards[index].answer)
                                       .foregroundColor(.secondary)
                               }
                           }
                           .onDelete(perform: removeCards)
                       }
                   }
                   .navigationTitle("Edit Cards")
                   .toolbar {
                       Button("Done", action: done)
                   }
                   .listStyle(.grouped)
                   
               }
           }

           func done() {
               dismiss()
           }

           

          

           func addCard() {
               let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
               let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
               guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

               let card = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
               cards.insert(card, at: 0)
               newPrompt = ""
               newAnswer = ""
               focusedField = .prompt
               DataManager.save(cards)
           }

           func removeCards(at offsets: IndexSet) {
               cards.remove(atOffsets: offsets)
               DataManager.save(cards)
           }
       
    
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}

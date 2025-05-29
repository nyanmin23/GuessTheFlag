//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Nyan Min Htet on 15/02/2024.
//

//import SwiftUI
//
//struct ProminentTitleModifier: ViewModifier {
//    func body(content: Content) -> some View {
//        content
//            .font(.largeTitle)
//            .foregroundColor(Color.blue)
//    }
//}
//
//extension View {
//    func prominentTitleStyle() -> some View {
//        self.modifier(ProminentTitleModifier())
//    }
//}
//
//struct FlagImage: View {
//    let countryName: String
//
//    var body: some View {
//        Image(countryName)
//            .resizable()
//            .scaledToFit()
//            .clipShape(RoundedRectangle(cornerRadius: 15.0))
//            .shadow(radius: 10)
//    }
//}
//
//struct ContentView: View {
//    @State private var countries = ["Estonia", "UK", "US", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Spain", "Ukraine", "Poland"].shuffled()
//    @State private var correctAnswer = Int.random(in: 0...2)
//    @State private var showingScores: Bool = false
//    @State private var roundComplete: Bool = false
//    @State private var scoreTitle = ""
//    @State private var playerScore = 0
//    
//    
//    var body: some View {
//        ZStack {
//            
//            RadialGradient(stops: [
//                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
//                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
//            ], center: .top, startRadius: 150, endRadius: 600)
//            .ignoresSafeArea()
//            
//            VStack {
//                Spacer()
//                
//                Text("Guess the Flag")
//                    .prominentTitleStyle()
////                    .foregroundStyle(.white)
////                    .font(.largeTitle.weight(.bold))
//                
//                VStack(spacing: 15) {
//                    VStack {
//                        Text("Tap the flag of")
//                            .foregroundStyle(.secondary.opacity(50.0))
//                            .font(.title2.weight(.semibold))
//                        
//                        Text(countries[correctAnswer])
//                            .font(.title.weight(.heavy))
//                    }
//                    
//                    ForEach(0..<3) { number in
//                        Button {
//                            flagTapped(number)
//                        } label: {
//                            FlagImage(countryName: countries[number])
////                                .clipShape(
////                                    RoundedRectangle(cornerRadius: 15.0)
////                                )
////                                .shadow(radius: 10)
//                        }
//                    }
//                }
//                .padding(.vertical, 35)
//                .frame(maxWidth: .infinity)
//                .background(.thinMaterial)
//                .clipShape(.buttonBorder)
//                Spacer()
//                
//                Text("Score: \(playerScore)")
//                    .foregroundStyle(.white)
//                    .font(.title.weight(.semibold))
//                Spacer()
//            }
//            .padding()
//            .padding()
//            .alert(scoreTitle, isPresented: $roundComplete) {
//                Button("Play", role: .destructive, action: reset)
//                Button("Cancel", role: .cancel, action: stop)
//            } message: {
//                Text("Do you want to play next round?")
//            }
//        }
//        
//        .alert(scoreTitle, isPresented: $showingScores) {
//            Button("Continue", action: askQuestion)
//        } message: {
//            Text("Your score is \(playerScore)")
//        }
//        
//    }
//    
//    func flagTapped(_ number: Int) {
//        if number == correctAnswer {
//            scoreTitle = "Correct!"
//            playerScore += 1
//        } else {
//            scoreTitle = "Wrong! That's the flag of \(countries[number])"
//            playerScore = playerScore
//        }
//        showingScores = true
//    }
//    
//    func askQuestion() {
//        countries.shuffle()
//        correctAnswer = Int.random(in: 0...2)
//        
//        if playerScore == 9 {
//            roundComplete = true
//            scoreTitle = "Round Completed!"
//        }
//    }
//    
//    func reset() {
//        playerScore = 0
//        askQuestion()
//    }
//    
//    func stop() {
//        playerScore = 0
//    }
//}
//    
//#Preview {
//    ContentView()
//}


import SwiftUI

struct FlagImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .clipShape(
                RoundedRectangle(cornerRadius: 15.0)
            )
            .shadow(radius: 10)
    }
}

extension View {
    func titleStyle() -> some View {
        self
            .font(.title.weight(.heavy))
            .foregroundColor(.blue)
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "UK", "US", "Germany", "Ireland", "Italy", "Monaco", "Nigeria", "Spain", "Ukraine", "Poland"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScores: Bool = false
    @State private var roundComplete: Bool = false
    @State private var scoreTitle = ""
    @State private var playerScore = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 150, endRadius: 600)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()  // Apply the custom title style
                    .foregroundStyle(.white)
                    .font(.largeTitle.weight(.bold))
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary.opacity(50.0))
                            .font(.title2.weight(.semibold))
                        
                        Text(countries[correctAnswer])
                            .titleStyle()  // Apply the custom title style
                            .modifier(FlagImage())  // Use the custom FlagImage modifier
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .modifier(FlagImage())  // Use the custom FlagImage modifier
                        }
                    }
                }
                .padding(.vertical, 35)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                .clipShape(.buttonBorder)
                Spacer()
                
                Text("Score: \(playerScore)")
                    .foregroundStyle(.white)
                    .font(.title.weight(.semibold))
                Spacer()
            }
            .padding()
            .padding()
            .alert(scoreTitle, isPresented: $roundComplete) {
                Button("Play", role: .destructive, action: reset)
                Button("Cancel", role: .cancel, action: stop)
            } message: {
                Text("Do you want to play next round?")
            }
        }
        
        .alert(scoreTitle, isPresented: $showingScores) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(playerScore)")
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct!"
            playerScore += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            playerScore = playerScore
        }
        showingScores = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        if playerScore == 9 {
            roundComplete = true
            scoreTitle = "Round Completed!"
        }
    }
    
    func reset() {
        playerScore = 0
        askQuestion()
    }
    
    func stop() {
        playerScore = 0
    }
}

#Preview {
    ContentView()
}

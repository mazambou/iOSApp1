//
//  TimerView.swift
//  TimHortonCoffeeApp
//
//  Created by AZAMBOU Marcel on 2026-05-24.
//
import SwiftUI

// Timer screen used for the coffee run countdown
struct TimerView: View {
    
// Stores the remaining time, timer state, and Timer object
    @State private var timeRemaining = 300
    @State private var timerRunning = false
    @State private var timer: Timer?
    
    var body: some View {

        VStack(spacing: 30) {
            Text("Coffee Run Timer")
                .font(.largeTitle)
                .bold()
            
// Displays the countdown in minutes and seconds
            Text("\(timeRemaining / 60):\(String(format: "%02d", timeRemaining % 60))")
                .font(.system(size: 60))
                .bold()
            
            
// Button used to start or pause the timer
            Button(timerRunning ? "Pause" : "Start") {
                if timerRunning {
                    pauseTimer()
                } else {
                    startTimer()
                }
            }
            .buttonStyle(.borderedProminent)
// Button used to reset the timer back to 5 minutes
            Button("Reset") {
                resetTimer()
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .onDisappear {
            pauseTimer()
        }
    }

// Starts the countdown timer and decreases the time every second
    private func startTimer() {
        timerRunning = true
        timer?.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else {
                pauseTimer()
            }
        }
    }
    
// Pauses and stops the current timer
    private func pauseTimer() {
        timerRunning = false
        timer?.invalidate()
        timer = nil
    }
    
// Resets the timer value to the initial 5 minutes
    private func resetTimer() {
        pauseTimer()
        timeRemaining = 300
    }
}

#Preview {
    TimerView()
}

//
//  ResultsView.swift
//  ScavengerHuntPro
//
//  Created by Satoof Haj on 2025-10-14.
//

import SwiftUI
struct ResultsView: View {
    // MARK: - Properties
    let submission: Submission
    @State private var isSubmitting = false
    @State private var submitted = false
    private let discountEngine = DiscountEngine()

    // MARK: - View Body
    var body: some View {
        VStack(spacing: 25) {
            // Header
            Text("Congratulations!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 30)
            
            // Number of items found
            Text("You found \(submission.foundItems.count) out of 10 items!")
                .font(.title3)
                .foregroundColor(.secondary)
            
            // Reward message
            Text(DiscountEngine.reward(for: submission.foundItems.count))
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
                .foregroundColor(.blue)
            
            // Submission date
            Text("Submitted on: \(formattedDate(submission.dateSubmitted))")
                .font(.caption)
                .foregroundColor(.gray)
            
            Spacer()
            
            // Submit button (simulated online submission)
            Button(action: submitResults) {
                if isSubmitting {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .frame(width: 200, height: 44)
                } else if submitted {
                    Label("Results Submitted", systemImage: "checkmark.circle.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                } else {
                    Label("Submit Results", systemImage: "paperplane.fill")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            .disabled(isSubmitting || submitted)

            Spacer()
        }
        .navigationTitle("Results")
        .padding()
    }

    // MARK: - Helper Methods
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    private func submitResults() {
        isSubmitting = true
        
        // Simulated 2-second delay for submission
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isSubmitting = false
            submitted = true
        }
    }
}

#Preview {
    ResultsView(submission: Submission(
        foundItems: [
            HuntItem(name: "Local Café", clue: "Find the best coffee downtown", isFound: true),
            HuntItem(name: "Bookstore", clue: "Discover your next adventure", isFound: true)
        ]
    ))
}


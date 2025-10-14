//
//  HuntListView.swift
//  ScavengerHuntPro
//
//  Created by Satoof Haj on 2025-10-14.
//

import SwiftUI

// MARK: - Main list screen showing all hunt items
struct HuntListView: View {
    // MARK: - Properties
    @State private var huntItems: [HuntItem] = [
        HuntItem(name: "Local Café", clue: "Find the best coffee downtown"),
        HuntItem(name: "Bookstore", clue: "Discover your next adventure"),
        HuntItem(name: "Movie Theater", clue: "Catch the latest blockbuster"),
        HuntItem(name: "Pizza Shop", clue: "Find the cheesiest slice"),
        HuntItem(name: "Flower Market", clue: "Find the brightest bouquet"),
        HuntItem(name: "Ice Cream Parlor", clue: "Cool off with a sweet treat"),
        HuntItem(name: "Clothing Boutique", clue: "Find the trendiest outfit"),
        HuntItem(name: "Gym", clue: "Where fitness meets fun"),
        HuntItem(name: "Art Gallery", clue: "Explore local creativity"),
        HuntItem(name: "Library", clue: "Where knowledge comes alive")
    ]
    
    // Track number of items found
    private var itemsFoundCount: Int {
        huntItems.filter { $0.isFound }.count
    }

    // Calculate progress percentage
    private var progress: Double {
        Double(itemsFoundCount) / Double(huntItems.count)
    }

    // MARK: - View Body
    var body: some View {
        NavigationView {
            VStack {
                // Progress section
                VStack(alignment: .leading) {
                    Text("Progress: \(itemsFoundCount)/\(huntItems.count) items found")
                        .font(.headline)
                    ProgressView(value: progress)
                        .tint(.blue)
                        .padding(.bottom, 8)
                }
                .padding(.horizontal)
                
                // List of hunt locations
                List($huntItems) { $item in
                    NavigationLink(destination: HuntDetailView(item: $item)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.clue)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            if item.isFound {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                        .animation(.easeInOut(duration: 0.3), value: item.isFound)
                    }
                }
                .listStyle(.insetGrouped)
                
                // Button to see results
                NavigationLink(destination: ResultsView(submission: Submission(foundItems: huntItems.filter { $0.isFound }))) {
                    Text("View Results")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .navigationTitle("Scavenger Hunt")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    HuntListView()
}


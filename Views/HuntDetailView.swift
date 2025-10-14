//
//  HuntDetailView.swift
//  ScavengerHuntPro
//
//  Created by Satoof Haj on 2025-10-14.
//

import SwiftUI
struct HuntDetailView: View {
    // MARK: - Properties
    @Binding var item: HuntItem
    
    @State private var showCamera = false
    @State private var photo: UIImage?

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                // Location name
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Clue text
                Text(item.clue)
                    .font(.title3)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)

                // Display photo if taken
                if let photo = photo {
                    Image(uiImage: photo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 250)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                        .padding(.horizontal)
                } else {
                    // Placeholder if no photo
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray.opacity(0.5))
                        .padding()
                }

                // Take photo button
                Button(action: {
                    showCamera = true
                }) {
                    Label("Take Photo", systemImage: "camera.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showCamera) {
                    CameraPicker(image: $photo)
                }

                // Mark as found button
                Button(action: {
                    item.isFound = true
                }) {
                    Label("Mark as Found", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(item.isFound ? Color.green : Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                .disabled(item.isFound)
                .opacity(item.isFound ? 0.7 : 1.0)

                Spacer()
            }
        }
        .navigationTitle("Find the Item")
        .sheet(isPresented: $showCamera) {
            CameraPicker(image: $photo)
        }
    }
}

#Preview {
    HuntDetailView(item: .constant(HuntItem(name: "Bookstore", clue: "Find your next read 📚")))
}


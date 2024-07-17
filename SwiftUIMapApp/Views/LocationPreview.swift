//
//  LocationPreview.swift
//  SwiftUIMapApp
//
//  Created by Yun Ni on 2024-07-17.
//

import SwiftUI

struct LocationPreview: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            //            .background(Color.red)
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
//            .background(Color.orange)
            
        }
//        .background(Color.blue)
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        
        LocationPreview(location: LocationsDataService.locations.first!)
            .padding()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationPreview {
    
    private var imageSection: some View {
        ZStack {
            if let imageNames = location.imageNames.first {
                Image(imageNames)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)
        
    }
    
    private var titleSection: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background(Color.blue)
    }
    
    private var learnMoreButton : some View {
        VStack(spacing: 8) {
            Button(action: {
                vm.sheetLocation = location
            }, label: {
                Text("Learn More")
                    .font(.headline)
                    .frame(width: 125, height: 30)
            })
            .buttonStyle(.borderedProminent)
        }
    }
    
    private var nextButton: some View {
        
        
        Button(action: {
            vm.nextButtonPressed()
        }, label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 30)
        })
        .buttonStyle(.bordered)
    }
    
    
}

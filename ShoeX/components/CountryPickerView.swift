//
//  CountryPickerView.swift
//  ShoeX
//
//  Created by Cyboticx LLC on 10/06/2023.
//

import SwiftUI

struct CountryPickerView: View {
    @EnvironmentObject var viewModel: AppViewModel;
    @State var searchTerm = "";
    @Binding var isCountryPickerOpen: Bool;
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    withAnimation {
                        
                        isCountryPickerOpen.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.square")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .foregroundColor(.primary)
                }
                
                Text("Select a Country Code")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .font(.custom("Satoshi-Bold", size: 18))
                    .padding(.trailing, 42)
                
            }
            .padding(.vertical, 18)
            .padding(.horizontal, 20)
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.secondary)
                
                TextField("Search", text: $searchTerm)
                    .frame(maxWidth: .infinity)
                
            }
            .padding(.horizontal, 20)
            Divider()
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(viewModel.countries, id: \.self) { item in
                        Button {
                            viewModel.setCountry(data: item)
                            isCountryPickerOpen.toggle()
                        } label: {
                            VStack {
                                HStack {
                                    Text(item.flag)
                                    Text(item.name)
                                    Spacer()
                                    Text(item.code)
                                }
                                .frame(height: 48)
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.primary)
                            }
                            Divider()
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}
//
//struct CountryPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryPickerView()
//            .environmentObject(AppViewModel())
//            .preferredColorScheme(.dark)
//
//        CountryPickerView()
//            .environmentObject(AppViewModel())
//            .preferredColorScheme(.light)
//    }
//}

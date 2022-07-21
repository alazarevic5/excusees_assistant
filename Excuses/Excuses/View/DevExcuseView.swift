//
//  LaptopView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import SwiftUI

struct DevExcuseView: View {
    
    @ObservedObject var devExcuseVM = DevExcusesViewModel()
    @State private var scaleValue = 1
    
    @State var isHidden = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "153B44"), Color(hex: "071C21")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            ScrollView {
                VStack {
                
                HStack  {
                    Text("Tap enter for another one.").foregroundColor(Color(hex: "8aa4ab")).font(.subheadline).italic().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    Button(action: {
                        devExcuseVM.getDevExcuse()
                        isHidden = false
                            }) {
                                Image("enter").resizable().aspectRatio(contentMode: .fit).frame(width: 100).shadow(color: Color(hex: "2D6E7E"), radius: 25, x: 0, y: 0)
                            }

                }.padding().padding()
                    ZStack (alignment: .center) {
                        Image("laptop_test").resizable().aspectRatio(contentMode: .fit)
                        Text(devExcuseVM.excuse.text).font(.custom("Menlo", size: 16, relativeTo: .body)).animation(.easeInOut).foregroundColor(Color(hex: "C6DE41"))
                            .padding(EdgeInsets(top: 0, leading: 60, bottom: 100, trailing: 60)).frame(maxWidth: 600)
                    }
                    Button {
                        PersistenceController.saveExcuse(content: devExcuseVM.excuse.text, category: "developer")
                        isHidden = true
                    } label: {
                        if !PersistenceController.itemExists(devExcuseVM.excuse.text) {
                            SaveExcuse()
                        }
                    }.opacity(isHidden ? 0 : 1)

                //    Image("bits").resizable().clipped().aspectRatio(contentMode: .fit).padding()
                    .onAppear{
                        devExcuseVM.getDevExcuse()
                    }
            }
            }
        }.navigationBarTitle("Random developer excuse", displayMode: .inline).foregroundColor(.red)
    }
    
}

struct DevExcuseView_Previews: PreviewProvider {
    static var previews: some View {
        DevExcuseView()
    }
}

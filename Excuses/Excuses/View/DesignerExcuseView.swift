//
//  DesignerExcuseView.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//
import CoreData
import SwiftUI

struct DesignerExcuseView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @ObservedObject var designerExcuses = DesignerExcusesViewModel()
    @State var currentExcuse = Excuse(id: 0, excuse: "---", category: "---")
    
    @State var isHidden = false
    @State var currentTag = "random"
    @State private var degrees = 0.0
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color(hex: "153B44"), Color(hex: "071C21")], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
//            ScrollView {
                VStack {
                    
                    Text("Click on category name to get a new excuse\nor swipe up/down on iPad").foregroundColor(Color(hex: "8aa4ab")).font(.subheadline).italic().padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0)).multilineTextAlignment(.center)
                    
                    ScrollView (.horizontal) {
                        HStack (alignment: .center) {
                            ForEach (designerExcuses.categories.tags, id: \.self) {
                                category in
                                Button(category.capitalized) {
                                    designerExcuses.getDesignerExcuseByTag(tag: category)
                                    currentTag = category
                                    isHidden = false
                                }.foregroundColor(Color(hex: "071C21")).padding().background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(colors: [Color(hex: "C6DE41"), Color(hex: "2D6E7E")], startPoint: .topLeading, endPoint: .bottomTrailing)).blur(radius: 7)).padding(5)
                            }
                        }
                    }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5))
                    
                    ZStack (alignment: .center) {
                        Image("ipad1").resizable().aspectRatio(contentMode: .fit).animation(.easeIn).gesture(DragGesture(minimumDistance: 50, coordinateSpace: .global)
                            .onEnded { value in
                                let horizontalAmount = value.translation.width as CGFloat
                                let verticalAmount = value.translation.height as CGFloat
                                
                                if abs(horizontalAmount) < abs(verticalAmount) {
                                    if verticalAmount < 0 {
                                        withAnimation(.spring()) {
                                            self.degrees += 360
                                            designerExcuses.getDesignerExcuseByTag(tag: currentTag)
                                        }
                                    }
                                    else {
                                        withAnimation(.spring()) {
                                            self.degrees -= 360
                                            designerExcuses.getDesignerExcuseByTag(tag: currentTag)
                                        }
                                    }
                                    
                                }
                            })
                        
                        withAnimation(.easeInOut) {
                            Text(designerExcuses.designerExcuse.excuse ).animation(.easeInOut).font(.custom("Menlo", size: 16, relativeTo: .body)).foregroundColor(Color(hex: "#C6DE41")).padding(70)
                            .rotation3DEffect(.degrees(degrees), axis: (x: 1, y: 0, z: 0))
                        }
                    }
                    Button {
                        PersistenceController.saveExcuse(content: designerExcuses.designerExcuse.excuse, category: designerExcuses.designerExcuse.category)
                        isHidden = true
                    } label: {
                        if !PersistenceController.itemExists(designerExcuses.designerExcuse.excuse) {
                            SaveExcuse()
                        }
                    }.opacity(isHidden ? 0 : 1)
                    Spacer()
                }
            
            
        }
        .onAppear {
            designerExcuses.getCategories()
            designerExcuses.getDesignerExcuseByTag(tag: "random")
        }
        .navigationBarTitle("Designer excuses", displayMode: .inline).foregroundColor(.red)
    }

}

struct DesignerExcuseView_Previews: PreviewProvider {
    static var previews: some View {
        DesignerExcuseView()
    }
}

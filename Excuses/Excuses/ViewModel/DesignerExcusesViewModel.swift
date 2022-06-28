//
//  DesignerExcusesViewModel.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import Foundation
import Combine

class DesignerExcusesViewModel: ObservableObject {
    
    private var baseURL = "https://api.lazydesignerexcuses.com/"
    private var task: AnyCancellable?
    private var task1: AnyCancellable?
    
    @Published var categories = DesignerCategory(tags: [])
    
    @Published var designerExcuse = DesignerExcuse(id: 0, excuse: "---", category: "")
    
    func getCategories() {
        let completeURL = baseURL + "tags"
        
        guard let url = URL(string: completeURL) else {
            return
        }
        
        task = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: DesignerCategory.self, decoder: JSONDecoder())
            .replaceError(with: DesignerCategory(tags: []))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \DesignerExcusesViewModel.categories, on: self)
        
    }
    
    func getDesignerExcuseByTag(tag: String) {
        var completeURL = ""
        if tag == "random" {
            completeURL = baseURL + "random/"
            
        } else {
            completeURL = baseURL + "random/" + tag
        }
        guard let url = URL(string: completeURL) else {
            return
        }
        task1 = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: DesignerExcuse.self, decoder: JSONDecoder())
            .replaceError(with: DesignerExcuse(id: 0, excuse: "---", category: ""))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \DesignerExcusesViewModel.designerExcuse, on: self)
        
        print(completeURL)
    }
}

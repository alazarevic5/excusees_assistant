//
//  ExcuseViewModel.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 25.6.22..
//

import Foundation
import Combine
import CoreData

class ExcusesViewModel: ObservableObject {
    
    private var baseURL = "https://excuser.herokuapp.com/v1/excuse/"
    private var task: AnyCancellable?
    
    @Published var itemIsSaved: Bool = false
    
    @Published var excuses: [Excuse] = []
    
    func getExcuse(category: String) {
        var completeURL = ""
        if category != "random" {
            completeURL = baseURL + category
        } else {
            completeURL = baseURL
        }
        print(completeURL)
        task = URLSession.shared.dataTaskPublisher(for: URL(string: completeURL)!)
            .map { $0.data }
            .decode(type: [Excuse].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \ExcusesViewModel.excuses, on: self)
        
        print(excuses)
    }
    
    func getDevExcuse() {
        let completeURL = "https://api.devexcus.es/"
        task = URLSession.shared.dataTaskPublisher(for: URL(string: completeURL)!)
            .map { $0.data }
            .decode(type: [Excuse].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \ExcusesViewModel.excuses, on: self)
        
        print(excuses)
    }
}

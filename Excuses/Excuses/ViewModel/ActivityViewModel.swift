//
//  ActivityViewModel.swift
//  Excuses
//
//  Created by Aleksandra Lazarevic on 28.6.22..
//

import Foundation
import Combine
import CoreData

class ActivityViewModel: ObservableObject {
    
    private var url = "http://www.boredapi.com/api/activity/"
    private var task: AnyCancellable?
        
    @Published var activity: Activity = Activity(activity: "---", type: "---", participants: 1)
    
    func getActivity() {
        task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
            .map { $0.data }
            .decode(type: Activity.self, decoder: JSONDecoder())
            .replaceError(with: Activity(activity: "---", type: "---", participants: 1))
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \ActivityViewModel.activity, on: self)
        
    }
}

//
//  FoodListViewModel.swift
//  Dodo_App
//
//  Created by Физтех.Радио on 20.03.2021.
//

import Foundation

class FoodListViewModel: ObservableObject {
    
    @Published var foods: [Food]?
    @Published var types: [String]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let foodService: FoodStore
    
    init(foodService: FoodStore = FoodStore.shared) {
        self.foodService = foodService
    }
    
    func loadFood() {
        self.foods = nil
        self.isLoading = true
        self.foodService.fetchFoods() { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.foods = response.result
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}

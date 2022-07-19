//
//  ViewModel.swift
//  App2OnApi
//
//  Created by Akshara Vangala on 07/07/22.
//

import Foundation
protocol DataDetails: class{
    func reloadUI()
}

class ViewModel: DataManagerDelegate{
    
   
    weak var delegate: DataDetails?
    static var filtered = [Model]()
    var dataManager = DataManager()
    var viewModel = [Model]()

    func didUploadData(_ dataManager: DataManager, model: [ViewModel]) {}
    func didUpdateDetails(_ details: [Model]) {
        self.viewModel = details
        
        ViewModel.filtered = details
        delegate?.reloadUI()
    }
    func didFindError(_ error: Error) {}
    func ApiCaller(){
        dataManager.delegate = self
        dataManager.fetchData()
    }
    func filterDetails(_ searchText: String, _ searchBar: String){
        ViewModel.filtered = searchText.isEmpty ? ViewModel.filtered : viewModel.filter { data in
                    data.name.contains(searchText)
                }
        if searchBar == "" {
            ViewModel.filtered = viewModel
        }
    }
}

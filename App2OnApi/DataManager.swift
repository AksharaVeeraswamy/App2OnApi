//
//  DataManager.swift
//  App2OnApi
//
//  Created by Akshara Vangala on 07/07/22.
//
import Foundation

protocol DataManagerDelegate{
    func didUploadData(_ dataManager: DataManager, model: [ViewModel])
    func didUpdateDetails(_ details: [Model])
    func didFindError(_ error: Error)
}
struct DataManager{
    func fetchData(){
        let urlString = "https://www.breakingbadapi.com/api/characters?limit=100"
        print(urlString)
        performRequest(with: urlString)
    }
    var delegate: DataManagerDelegate?
    
    func performRequest(with urlString: String){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    delegate?.didFindError(error!)
                }
                
            if let safeData = data{
                if let dataa  = self.parseJson(safeData){
                    delegate?.didUploadData(self, model: dataa)
                }
            }
           
            }
            task.resume()
        }
    }
    
    func parseJson(_ internalData: Data) -> [ViewModel]?{
        let decoder = JSONDecoder()
        let dataModel: [ViewModel] = []
        do{
            let decodedData:[Model] = try decoder.decode([Model].self, from: internalData)
            delegate?.didUpdateDetails(decodedData)
            return dataModel
        }
        catch{
            delegate?.didFindError(error)
            return nil
        }
    }
}



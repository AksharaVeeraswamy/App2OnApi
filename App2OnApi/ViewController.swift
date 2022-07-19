//
//  ViewController.swift
//  App2OnApi
//
//  Created by Akshara Vangala on 07/07/22.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, DataDetails{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var imageAppend = UIImage()
    var image: [UIImage] = []
    var objects = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        objects.ApiCaller()
        objects.delegate = self
    }

    func reloadUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func imageConvertor(_ index: Int) -> UIImage{
        let url = URL(string: ViewModel.filtered[index].img)
                    if let data = try? Data(contentsOf: url!){
                        imageAppend = UIImage(data: data)!
                    }
        //let profileImage = imageAppend.roundedImage()
        return imageAppend
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let searchBarr = searchBar.text
        objects.filterDetails(searchText, searchBarr!)
        if searchBar.text == nil || searchBar.text == ""
                    {
                        searchBar.perform(#selector(self.resignFirstResponder), with: nil, afterDelay: 0.1)
                        objects.filterDetails(searchText, searchBarr!)
                    }
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.filtered.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.nameLabel.text = ViewModel.filtered[indexPath.row].name
        cell.image22.image = imageConvertor(indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        let vc = storyboard?.instantiateViewController(withIdentifier: DetailedViewController.identifier) as! DetailedViewController
        vc.pro = imageConvertor(indexPath.row)
        vc.nm = ViewModel.filtered[indexPath.row].name
        vc.occup = ViewModel.filtered[indexPath.row].occupation
        vc.app = ViewModel.filtered[indexPath.row].appearance
        vc.port = ViewModel.filtered[indexPath.row].portrayed
        vc.btr = ViewModel.filtered[indexPath.row].better_call_saul_appearance
        navigationController?.pushViewController(vc, animated: true)
    }
}

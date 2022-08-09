//
//  FutureWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by bùi thành công on 06/08/2022.
//

import UIKit

class FutureWeatherCollectionViewCell: UICollectionViewCell {
    
    var arrMinutely: [Minutely] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        configTableView()
        tableView.contentInset.top = 30
       
    }
    var item:[Minutely]? {
        didSet{
            arrMinutely = item ?? []
        }
    }
    func configTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "MinutelyWeatherTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MinutelyWeatherTableViewCell")
    }
}
extension FutureWeatherCollectionViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMinutely.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MinutelyWeatherTableViewCell", for: indexPath) as! MinutelyWeatherTableViewCell
        cell.item = arrMinutely[indexPath.item]
        return cell
    }


}
    
 
    
    


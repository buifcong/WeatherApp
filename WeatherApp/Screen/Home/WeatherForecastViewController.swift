//
//  WeatherForecastViewController.swift
//  WeatherApp
//
//  Created by Văn Ngọc An on 17/08/2022.
//

import UIKit
import Alamofire
import SwiftyJSON

class WeatherForecastViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var arrWeather2: [ResponseWeather2] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTableView()
        title = "Dự báo 16 ngày"
        getApi()
        
    }
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "WeatherForecastTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "WeatherForecastTableViewCell")
    }
    // MARk : https://api.weatherbit.io/v2.0/forecast/daily?city=HaNoi&key=a0613cc379024632aa3b7d302c5476d7
    func getApi() {
        AF.request("https://api.weatherbit.io/v2.0/forecast/daily?city=Ha%20Noi&key=a0613cc379024632aa3b7d302c5476d7").responseJSON { response in
            guard let value = response.value else {
                return
            }
            let result = JSON(value)
            let dataWeather2 = DataWeather2(result)
            self.arrWeather2 = dataWeather2.data ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
extension WeatherForecastViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrWeather2.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherForecastTableViewCell", for: indexPath) as! WeatherForecastTableViewCell
        cell.item = arrWeather2[indexPath.row]
      
        return cell
    }
}

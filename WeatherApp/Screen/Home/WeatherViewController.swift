//
//  WeatherViewController.swift
//  WeatherApp
//
//  Created by bùi thành công on 06/08/2022.
//

import UIKit
import Alamofire
import ObjectMapper

class WeatherViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnGoTo16Day: UIButton!
    
    var arrWeather: [ResponseWeather] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    var arrMinutely: [Minutely] = []
    let param1 = ["city":"Raleigh,North+Carolina",
                  "key":"5dc698293a9c47768de91fa6aa3c65b4",
                  "include":"minutely"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Weather"
        btnGoTo16Day.clipsToBounds = true
        btnGoTo16Day.layer.cornerRadius = 15
        configCollectionView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getAPI()
    }
    @IBAction func actionButton(_ sender: Any) {
        let vc = WeatherForecastViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib1 = UINib(nibName: "CurrentWeatherCollectionViewCell", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: "CurrentWeatherCollectionViewCell")
        let nib2 = UINib(nibName: "FutureWeatherCollectionViewCell", bundle: nil)
        collectionView.register(nib2, forCellWithReuseIdentifier: "FutureWeatherCollectionViewCell")
    }  
    func getAPI(){
        showLoading(text: "Đang tải...")
        AF.request("https://api.weatherbit.io/v2.0/current?&city=Ha%20Noi&key=4648697e2cae46d0aec0aff3071425d2&include=minutely", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON {[weak self] response in
            self?.hiddenLoading()
            if let weatherResponse = response.value as? [String:Any] {
                if let resultData = weatherResponse["data"] as? [[String:Any]]{
                    self?.arrWeather = [ResponseWeather](JSONArray: resultData)
                }
                if let resultMinutely = weatherResponse["minutely"] as? [[String:Any]] {
                    self?.arrMinutely = [Minutely](JSONArray: resultMinutely)
                }
            }
        }
    }
    
}
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return arrWeather.count
        } else {
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentWeatherCollectionViewCell", for: indexPath) as! CurrentWeatherCollectionViewCell
            cell.item = arrWeather[indexPath.section]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FutureWeatherCollectionViewCell", for: indexPath) as! FutureWeatherCollectionViewCell
            cell.item = arrMinutely
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width
        let h = collectionView.frame.height
        return CGSize(width: w, height: h)
    }
    
    
}

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
    var arrWeather: [ResponseWeather] = [] {
        didSet{
            self.collectionView.reloadData()
        }
    }
    let param1: [String:Any] = ["city":"Raleigh,North+Carolina",
                  "key":"5dc698293a9c47768de91fa6aa3c65b4",
                  "include":"minutely"]

    override func viewDidLoad() {
        super.viewDidLoad()
        getAPI()
        configCollectionView()
    }
    
    func configCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib1 = UINib(nibName: "CurrentWeatherCollectionViewCell", bundle: nil)
        collectionView.register(nib1, forCellWithReuseIdentifier: "CurrentWeatherCollectionViewCell")
    }
    
    func getAPI(){
        showLoading(text: "Đang tải...")
        /*
         https://api.weatherbit.io/v2.0/current?&city=Ha Noi&key=4648697e2cae46d0aec0aff3071425d2&include=minutely
         */
        AF.request("https://api.weatherbit.io/v2.0/current?&city=Raleigh,North+Carolina&key=5dc698293a9c47768de91fa6aa3c65b4&include=minutely", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).responseJSON {[weak self] response in
            self?.hiddenLoading()
            if let weatherResponse = response.value as? [String:Any] {
                if let result = weatherResponse["data"] as? [[String:Any]]{
                    print("kq:")
                    print(result)
                    self?.arrWeather = [ResponseWeather](JSONArray: result)
                    
                }
            }
        }
        
    }

}
extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrWeather.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CurrentWeatherCollectionViewCell", for: indexPath) as! CurrentWeatherCollectionViewCell
        cell.item = arrWeather[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width
        let h = collectionView.frame.height
        return CGSize(width: w, height: h)
    }
    
    
}

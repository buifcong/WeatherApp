//
//  CurrentWeatherCollectionViewCell.swift
//  WeatherApp
//
//  Created by bùi thành công on 06/08/2022.
//

import UIKit

class CurrentWeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewTimeZone: UIView!
    @IBOutlet weak var viewSunSet: UIView!
    @IBOutlet weak var viewSunRise: UIView!
    @IBOutlet weak var viewWindSpeed: UIView!
    

    @IBOutlet weak var lbTimezone: UILabel!
    @IBOutlet weak var lbSunset: UILabel!
    @IBOutlet weak var lbSunrise: UILabel!
    @IBOutlet weak var lbWindSpeed: UILabel!
    @IBOutlet weak var lbStatusCloud: UILabel!
    @IBOutlet weak var lbTemp: UILabel!
    @IBOutlet weak var imgWeather: UIImageView!
    @IBOutlet weak var lbCityName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        designUI()
    }
    func designUI(){
        cornerAndBorder(view: [viewSunSet,viewSunRise,viewTimeZone,viewWindSpeed], corner: 10, border: false, borderWith: nil, borderColor: nil)
    }
    var item:ResponseWeather? {
        didSet{
            lbCityName.text = item?.city_name
            lbTemp.text = "\(item?.temp ?? 0)"
            lbStatusCloud.text = item?.weather?.description
            lbWindSpeed.text = "Wind speed: \(item?.wind_spd ?? 0)m/s"
            lbSunset.text = "At: \(item?.sunset ?? "")"
            lbSunrise.text = "At: \(item?.sunrise ?? "")"
            lbTimezone.text = "\(item?.timezone ?? "") time zone"
        }
    }

}

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
    @IBOutlet weak var lblSunRise: UILabel!
    @IBOutlet weak var lblSunSet: UILabel!
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
            lblSunSet.text = "Sun set: \(item?.sunset ?? "")"
            lblSunRise.text = "Sun rise: \(item?.sunrise ?? "")"
            lbTimezone.text = "\(item?.timezone ?? "") time zone"
        }
    }

}

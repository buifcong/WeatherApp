//
//  WeatherForecastTableViewCell.swift
//  WeatherApp
//
//  Created by Văn Ngọc An on 17/08/2022.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDateTime: UILabel!
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblPrecip: UILabel!
    @IBOutlet weak var lblRh: UILabel!
    
    var item: ResponseWeather2? {
        didSet {
            lblDateTime.text = item?.datetime
            lblTemp.text = "\(item?.temp ?? 0)℃"
            lblPrecip.text = "\(item?.precip ?? 0)mm"
            lblRh.text = "\(item?.rh ?? 0)%"
            lblDescription.text = item?.weather?.description
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}

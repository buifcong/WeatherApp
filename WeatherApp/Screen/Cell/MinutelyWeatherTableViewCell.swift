//
//  MinutelyWeatherTableViewCell.swift
//  WeatherApp
//
//  Created by bùi thành công on 07/08/2022.
//

import UIKit

class MinutelyWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var lbSnow: UILabel!
    @IBOutlet weak var ivRaninOrSunny: UIImageView!
    @IBOutlet weak var lbRainOrSunny: UILabel!
    @IBOutlet weak var lbTemp: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var item:Minutely?{
        didSet {
            lbSnow.text = "\(item?.snow ?? 0)"
            lbTemp.text = "\(item?.temp ?? 0)"
            lbTime.text = item?.timestamp_local
            if item?.precip == 0 {
                ivRaninOrSunny.image = UIImage.init(named: "sun")
                lbRainOrSunny.text = "sunny"
            } else {
                ivRaninOrSunny.image = UIImage.init(named: "cloud-snow")
                lbRainOrSunny.text = "\(item?.precip ?? 0) mm"
            }
        }
    }
    
}

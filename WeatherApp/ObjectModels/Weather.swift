//
//  Weather.swift
//  WeatherApp
//
//  Created by bùi thành công on 06/08/2022.
//

import Foundation
import ObjectMapper

class DataWeather : Mappable {
    var count : Int?
    var data : [ResponseWeather]?
    var minutely : [Minutely]?

    required init?(map: Map) {}
    
    init(){}

    func mapping(map: Map) {

        count <- map["count"]
        data <- map["data"]
        minutely <- map["minutely"]
    }

}

class ResponseWeather : Mappable {
    var rh : Int?
    var pod : String?
    var lon : Double?
    var pres : Double?
    var timezone : String?
    var ob_time : String?
    var country_code : String?
    var clouds : Int?
    var ts : Int?
    var solar_rad : Int?
    var state_code : String?
    var city_name : String?
    var wind_spd : Double?
    var wind_cdir_full : String?
    var wind_cdir : String?
    var slp : Double?
    var vis : Int?
    var h_angle : Int?
    var sunset : String?
    var dni : Int?
    var dewpt : Double?
    var snow : Int?
    var uv : Int?
    var precip : Int?
    var wind_dir : Int?
    var sunrise : String?
    var ghi : Int?
    var dhi : Int?
    var aqi : Int?
    var lat : Double?
    var weather : Weather?
    var datetime : String?
    var temp : Double?
    var station : String?
    var elev_angle : Double?
    var app_temp : Double?
    
    init(){}

    required init?(map: Map) {}

    func mapping(map: Map) {

        rh <- map["rh"]
        pod <- map["pod"]
        lon <- map["lon"]
        pres <- map["pres"]
        timezone <- map["timezone"]
        ob_time <- map["ob_time"]
        country_code <- map["country_code"]
        clouds <- map["clouds"]
        ts <- map["ts"]
        solar_rad <- map["solar_rad"]
        state_code <- map["state_code"]
        city_name <- map["city_name"]
        wind_spd <- map["wind_spd"]
        wind_cdir_full <- map["wind_cdir_full"]
        wind_cdir <- map["wind_cdir"]
        slp <- map["slp"]
        vis <- map["vis"]
        h_angle <- map["h_angle"]
        sunset <- map["sunset"]
        dni <- map["dni"]
        dewpt <- map["dewpt"]
        snow <- map["snow"]
        uv <- map["uv"]
        precip <- map["precip"]
        wind_dir <- map["wind_dir"]
        sunrise <- map["sunrise"]
        ghi <- map["ghi"]
        dhi <- map["dhi"]
        aqi <- map["aqi"]
        lat <- map["lat"]
        weather <- map["weather"]
        datetime <- map["datetime"]
        temp <- map["temp"]
        station <- map["station"]
        elev_angle <- map["elev_angle"]
        app_temp <- map["app_temp"]
    }

}

class Minutely : Mappable {
    var timestamp_utc : String?
    var snow : Int?
    var temp : Double?
    var timestamp_local : String?
    var ts : Int?
    var precip : Double?
    
    init(){}

    required init?(map: Map) {}

    func mapping(map: Map) {

        timestamp_utc <- map["timestamp_utc"]
        snow <- map["snow"]
        temp <- map["temp"]
        timestamp_local <- map["timestamp_local"]
        ts <- map["ts"]
        precip <- map["precip"]
    }

}


class Weather : Mappable {
    var icon : String?
    var code : Int?
    var description : String?
    
    init(){}

    required init?(map: Map) {}

    func mapping(map: Map) {

        icon <- map["icon"]
        code <- map["code"]
        description <- map["description"]
    }

}



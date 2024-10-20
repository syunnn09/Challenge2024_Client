//
//  AddressUtils.swift
//  BuddhaStatueConversion
//
//  Created by shusuke imamura on 2024/08/17.
//

import Foundation
import CoreLocation

struct AddressUtils {
    static func getAddress(zip: String) -> Void {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(zip, completionHandler: {(placemarks, error) -> Void in
            if error != nil {
                print("Error", error!)
            }
            if let placemark = placemarks?.first {
                print("State:       \(placemark.administrativeArea!)")
                print("City:        \(placemark.locality!)")
                print("SubLocality: \(placemark.subLocality!)")
            }
        })
    }
}

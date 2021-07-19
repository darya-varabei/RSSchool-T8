//
//  File.swift
//  Task8
//
//  Created by Дарья Воробей on 7/18/21.
//

import UIKit

@objc class SliderViewController: UIViewController {

    @objc var step:Float=0.01
    @objc var label = UILabel(frame:CGRect(x: 136, y: 50, width: 100, height: 50))
    @objc public var mySlider = UISlider(frame:CGRect(x: 48, y: 10, width: 223, height: 20))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let label1 = UILabel(frame:CGRect(x: 0, y: 0, width: 25, height: 25))
        let label5 = UILabel(frame:CGRect(x: 312, y: 0, width: 25, height: 25))
        mySlider.minimumValue = 1
        mySlider.maximumValue = 5
        mySlider.value = 2.25
        mySlider.isContinuous = true
        mySlider.tintColor = UIColor.init(named: "AccentGreen")
        mySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        
        label.font = UIFont.init(name: "Montserrat-Regular", size: 22)
        label1.text = "1"
        label5.text = "5"
        label1.font = UIFont.init(name: "Montserrat-Regular", size: 18)
        label5.font = UIFont.init(name: "Montserrat-Regular", size: 18)
        self.view.addSubview(mySlider)
        self.view.addSubview(label)
        self.view.addSubview(label1)
        self.view.addSubview(label5)

    }

    @objc func sliderValueDidChange(_ sender:UISlider!) -> Float
    {
        let numberOfPlaces = 2.0
        let multiplier = pow(10.0, numberOfPlaces)
        self.step = Float(round(Double(mySlider.value) * multiplier)/multiplier)
        label.text = "\(round(Double(mySlider.value) * multiplier)/multiplier) s"
        return mySlider.value
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

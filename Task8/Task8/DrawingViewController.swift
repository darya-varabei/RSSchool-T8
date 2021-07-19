//
//  DrawingViewController.swift
//  Task8
//
//  Created by Дарья Воробей on 7/18/21.
//

import Foundation
import UIKit



@objc class DrawingViewController: UIViewController {
    
    @objc public var isPlanet = true
    @objc public var isHead = false
    @objc public var isTree = false
    @objc public var isLandscape = false
    var planetButton = UIButton(frame: CGRect(x: 88.0, y: 112.0, width: 200.0, height: 40.0))
    var headButton = UIButton(frame: CGRect(x: 88.0, y: 167.0, width: 200.0, height: 40.0))
    var treeButton = UIButton(frame: CGRect(x: 88.0, y: 222.0, width: 200.0, height: 40.0))
    var landscapeButton = UIButton(frame: CGRect(x: 88.0, y: 277.0, width: 200.0, height: 40.0))
    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        let leftBarButton = UIBarButtonItem(title: "Artist", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.addTapped))
                self.navigationItem.leftBarButtonItem = leftBarButton
        
        self.navigationItem.title = "Drawings"
        navigationController?.navigationBar.tintColor = UIColor(named: "AccentGreen")!
        self.navigationController!.navigationBar.titleTextAttributes = [.foregroundColor: UIColor(named: "AccentGreen")!, NSAttributedString.Key.font: UIFont(name: "Montserrat-Regular", size: 16.0)!]
        
        self.planetButton = UIButton(frame: CGRect(x: 88.0, y: 112.0, width: 200.0, height: 40.0))
        self.planetButton.setTitle("Planet", for: .normal)
        self.planetButton.backgroundColor = .white
        self.planetButton.setTitleColor(UIColor.init(named: "AccentGreen"), for: .normal)
        self.planetButton.layer.borderWidth = 1
        self.planetButton.layer.cornerRadius = 10
        self.planetButton.layer.shadowRadius = 4.0
        self.planetButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.planetButton.layer.shadowColor = UIColor.white.cgColor;
        self.planetButton.layer.borderColor = UIColor.init(named: isPlanet ? "AccentGreen" : "StrokeBlack")?.cgColor
        self.planetButton.titleLabel?.font = UIFont.init(name: "Montserrat-Medium", size: 18)
        self.planetButton.addTarget(self, action: #selector(self.planetTapped), for: .touchUpInside)
        self.view.addSubview(self.planetButton)
        
        self.headButton.setTitle("Head", for: .normal)
        self.headButton.backgroundColor = .white
        self.headButton.setTitleColor(UIColor.init(named: "AccentGreen"), for: .normal)
        self.headButton.layer.borderWidth = 1
        self.headButton.layer.shadowRadius = 4.0
        self.headButton.layer.shadowColor = UIColor.white.cgColor;
        self.headButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.headButton.layer.cornerRadius = 10
        self.headButton.layer.borderColor = UIColor.init(named: isHead ? "AccentGreen" : "StrokeBlack")?.cgColor
        self.headButton.titleLabel?.font = UIFont.init(name: "Montserrat-Medium", size: 18)
        self.headButton.addTarget(self, action: #selector(self.headTapped), for: .touchUpInside)
        self.view.addSubview(self.headButton)
        
        self.treeButton.setTitle("Tree", for: .normal)
        self.treeButton.backgroundColor = .white
        self.treeButton.setTitleColor(UIColor.init(named: "AccentGreen"), for: .normal)
        self.treeButton.layer.borderWidth = 1
        self.treeButton.layer.shadowRadius = 4.0
        self.treeButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.treeButton.layer.shadowColor = UIColor.white.cgColor;
        self.treeButton.layer.cornerRadius = 10
        self.treeButton.layer.borderColor = UIColor.init(named: isTree ? "AccentGreen" : "StrokeBlack")?.cgColor
        self.treeButton.titleLabel?.font = UIFont.init(name: "Montserrat-Medium", size: 18)
        self.treeButton.addTarget(self, action: #selector(self.treeTapped), for: .touchUpInside)
        self.view.addSubview(self.treeButton)
        
        self.landscapeButton.setTitle("Landscape", for: .normal)
        self.landscapeButton.backgroundColor = .white
        self.landscapeButton.setTitleColor(UIColor.init(named: "AccentGreen"), for: .normal)
        self.landscapeButton.layer.borderWidth = 1
        self.landscapeButton.layer.cornerRadius = 10
        self.landscapeButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.landscapeButton.layer.shadowRadius = 4.0
        self.landscapeButton.layer.shadowColor = UIColor.white.cgColor;
        self.landscapeButton.layer.borderColor = UIColor.init(named:isLandscape ? "AccentGreen" : "StrokeBlack")?.cgColor
        self.landscapeButton.titleLabel?.font = UIFont.init(name: "Montserrat-Medium", size: 18)
        self.landscapeButton.addTarget(self, action: #selector(self.landscapeTapped), for: .touchUpInside)
        self.view.addSubview(self.landscapeButton)
    }

    @objc func planetTapped(){
        self.isPlanet = true
        self.isHead = false
        self.isTree = false
        self.isLandscape = false
        self.planetButton.layer.borderColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        self.treeButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.headButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.landscapeButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.planetButton.layer.shadowColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        self.headButton.layer.shadowColor = UIColor.white.cgColor;
        self.treeButton.layer.shadowColor = UIColor.white.cgColor;
        self.landscapeButton.layer.shadowColor = UIColor.white.cgColor;
    }
    
    @objc func headTapped(){
        self.isPlanet = false
        self.isHead = true
        self.isTree = false
        self.isLandscape = false
        self.planetButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.treeButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.headButton.layer.borderColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        self.landscapeButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        
        self.planetButton.layer.shadowColor = UIColor.white.cgColor;
        self.headButton.layer.shadowColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        self.treeButton.layer.shadowColor = UIColor.white.cgColor;
        self.landscapeButton.layer.shadowColor = UIColor.white.cgColor;
    }
    
    @objc func treeTapped(){
        self.isPlanet = false
        self.isHead = false
        self.isTree = true
        self.isLandscape = false
        self.planetButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.treeButton.layer.borderColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        self.headButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.landscapeButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        
        self.planetButton.layer.shadowColor = UIColor.white.cgColor;
        self.headButton.layer.shadowColor = UIColor.white.cgColor;
        self.treeButton.layer.shadowColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        self.landscapeButton.layer.shadowColor = UIColor.white.cgColor;
    }
    
    @objc func landscapeTapped(){
        self.isPlanet = false
        self.isHead = false
        self.isTree = false
        self.isLandscape = true
        self.planetButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.treeButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.headButton.layer.borderColor = UIColor.init(named:  "StrokeBlack" )?.cgColor;
        self.landscapeButton.layer.borderColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
        
        self.planetButton.layer.shadowColor = UIColor.white.cgColor;
        self.headButton.layer.shadowColor = UIColor.white.cgColor;
        self.treeButton.layer.shadowColor = UIColor.white.cgColor;
        self.landscapeButton.layer.shadowColor = UIColor.init(named:  "AccentGreen" )?.cgColor;
    }
    
    @objc func addTapped(){
        let vc = NavigationViewController()
        if self.isLandscape{
        vc.drawingName = "Landscape"
        }
        else if self.isHead{
        vc.drawingName = "Head"
        }
        else if self.isPlanet{
        vc.drawingName = "Planet"
        }
        else if self.isTree{
        vc.drawingName = "Tree"
        }

        self.navigationController!.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

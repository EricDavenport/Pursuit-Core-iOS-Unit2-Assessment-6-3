//
//  DetailViewController.swift
//  Pursuit-Core-iOS-Unit2Final
//
//  Created by Eric Davenport on 11/22/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaStepper: UIStepper!
    @IBOutlet weak var alphaLabel: UILabel!
    @IBOutlet weak var resetButton: UIButton!
    
    var currentColor: Crayon?
    
    var redValue: Float = 0.2 {
        didSet {
            redLabel.text = String(format: "%.02f", redSlider.value)
        }
    }
    
    var greenValue: Float = 0.2 {
        didSet {
            greenLabel.text = String(format: "%.02f", greenSlider.value)
        }
    }
    
    var blueValue: Float = 0.2 {
        didSet {
            blueLabel.text = String(format: "%.02f", blueSlider.value)
        }
    }
    
    var alphaValue: Double = 1.0 {
        didSet {
            alphaLabel.text = String(format: "%.01f", alphaStepper.value)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRedSLider()
        configureGreenSlider()
        configureBlueSLider()
        configureStepper()
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(currentColor!.red / 255), green: CGFloat(currentColor!.green / 255), blue: CGFloat(currentColor!.blue / 255), alpha: 1.0)
        title = currentColor?.name
        
    }
    
    func configureRedSLider() {
        redSlider.maximumValue = 1.0
        redSlider.minimumValue = 0.0
        redSlider.value = Float(currentColor!.red / 255)
        redLabel.text = String(format: "%.02f", redSlider.value)
        
    }
    
    func configureGreenSlider() {
        greenSlider.maximumValue = 1.0
        greenSlider.minimumValue = 0.0
        greenSlider.value = Float(currentColor!.green / 255)
        greenLabel.text = String(format: "%.02f", greenSlider.value)
    }
    
    func configureBlueSLider() {
        blueSlider.maximumValue = 1.0
        blueSlider.minimumValue = 0.0
        blueSlider.value = Float(currentColor!.blue / 255)
        blueLabel.text = String(format: "%.02f", blueSlider.value)
    }
    
    func configureStepper() {
        alphaStepper.stepValue = 0.1
        alphaStepper.value = 1.0
        alphaStepper.maximumValue = 1.0
        alphaStepper.minimumValue = 0.0
        alphaLabel.text = String(format: "%.01f", alphaStepper.value)
    }
    
    
    @IBAction func redSLider(sender: UISlider) {
        redValue = sender.value
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
    }
    
    @IBAction func greenSlider(sender: UISlider) {
        greenValue = sender.value
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
    }
    
    @IBAction func blueSlider(sender: UISlider) {
        blueValue = sender.value
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
    }
    
    @IBAction func alphaStepper(sender: UIStepper) {
        alphaValue = sender.value
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: CGFloat(alphaValue))
    }
    
    @IBAction func resetMe(sender: UIButton) {
        configureStepper()
        configureRedSLider()
        configureGreenSlider()
        configureBlueSLider()
        
        self.view.backgroundColor = UIColor(displayP3Red: CGFloat(currentColor!.red / 255), green: CGFloat(currentColor!.green / 255), blue: CGFloat(currentColor!.blue / 255), alpha: 1.0)

    }
    
}

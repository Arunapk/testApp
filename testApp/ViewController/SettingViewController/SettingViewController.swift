//
//  SettingViewController.swift
//  testApp
//
//  Created by Esakki - iOS on 14/09/25.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var mobileNumLbl: UILabel!
    
    @IBOutlet weak var logoutView: UIStackView!
    
    @IBOutlet weak var logoOverView: UIView!
    
    @IBOutlet weak var baseLocationCheckmark: UIImageView!
    
    @IBOutlet weak var trackMeLabel: UILabel!
    @IBOutlet weak var remindMeLabel: UILabel!
    @IBOutlet weak var defaultMOTLabel: UILabel!
    @IBOutlet weak var referMetricInfoLabel: UILabel!
    @IBOutlet weak var themeLabel: UILabel!
    
    @IBOutlet weak var appVersionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        logoutView.isUserInteractionEnabled = true
        logoutView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(logout)))
        
        setupAttributedTexts()
    }
    
    private func setupAttributedTexts() {
        setupUserNameText()
        
        setupSettingsLabels()
        
        setupAppVersion()
    }
    
    private func setupUserNameText() {
        let attributedString = NSMutableAttributedString()
        
        let demoText = NSAttributedString(string: "Demo", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 17)
        ])
        attributedString.append(demoText)
        
        let idText = NSAttributedString(string: " (123)", attributes: [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 17)
        ])
        attributedString.append(idText)
        
        userNameLbl.attributedText = attributedString
    }
    
    private func setupSettingsLabels() {
        let trackMeAttributedString = NSMutableAttributedString()
        let trackMeText = NSAttributedString(string: "Track me every", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 17)
        ])
        trackMeAttributedString.append(trackMeText)
        
        let trackMeTimeText = NSAttributedString(string: " 1 Min", attributes: [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 17)
        ])
        trackMeAttributedString.append(trackMeTimeText)
        trackMeLabel.attributedText = trackMeAttributedString
        
        let remindMeAttributedString = NSMutableAttributedString()
        let remindMeText = NSAttributedString(string: "Remind me", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 17)
        ])
        remindMeAttributedString.append(remindMeText)
        
        let remindMeTimeText = NSAttributedString(string: " 30 Min early", attributes: [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 17)
        ])
        remindMeAttributedString.append(remindMeTimeText)
        remindMeLabel.attributedText = remindMeAttributedString
        
        let defaultMOTAttributedString = NSMutableAttributedString()
        let defaultMOTText = NSAttributedString(string: "Default MOT", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 17)
        ])
        defaultMOTAttributedString.append(defaultMOTText)
        
        let carText = NSAttributedString(string: " Car", attributes: [
            .foregroundColor: UIColor.red,
            .font: UIFont.systemFont(ofSize: 17)
        ])
        defaultMOTAttributedString.append(carText)
        defaultMOTLabel.attributedText = defaultMOTAttributedString
        
        referMetricInfoLabel.text = "Refer MetricInfo"
        referMetricInfoLabel.textColor = .black
        referMetricInfoLabel.font = UIFont.systemFont(ofSize: 17)
        
        themeLabel.text = "Theme Purple"
        themeLabel.textColor = .black
        themeLabel.font = UIFont.systemFont(ofSize: 17)
    }
    
    private func setupAppVersion() {
        appVersionLabel.text = "App Version ~ 5.7"
        appVersionLabel.textColor = .gray
        appVersionLabel.font = UIFont.systemFont(ofSize: 12)
        appVersionLabel.textAlignment = .center
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        logoOverView.layer.cornerRadius = logoOverView.frame.size.width / 2
        logoOverView.layer.masksToBounds = false
            
        logoOverView.layer.shadowColor = UIColor.black.cgColor
        logoOverView.layer.shadowOpacity = 0.3
        logoOverView.layer.shadowOffset = CGSize(width: 0, height: 3)
        logoOverView.layer.shadowRadius = 5
    }
    
    @objc func logout() {
        debugPrint("logout")
    }
}

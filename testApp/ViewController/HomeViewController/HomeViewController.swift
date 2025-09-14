//
//  HomeViewController.swift
//  testApp
//
//  Created by Esakki - iOS on 14/09/25.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var profileImgView: UIView!
    @IBOutlet weak var checkoutBtn: UIButton!
    @IBOutlet weak var layout1: DashboardCurvedView!
    @IBOutlet weak var layout2: DashboardCurvedView!
    
    @IBOutlet weak var checkOut2: UIButton!
    @IBOutlet weak var appNameLabel: UILabel!
    
    private var isLayout1Visible = true
    private var isAnimating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupInitialState()
        setupSwipeGesture()
        setupAppNameAttributedText()
    }
    
    private func setupAppNameAttributedText() {
        let attributedString = NSMutableAttributedString()
        
        let metricText = NSAttributedString(string: "Metric", attributes: [
            .foregroundColor: UIColor(red: 0.686, green: 0.322, blue: 0.871, alpha: 1.0),
            .font: UIFont.boldSystemFont(ofSize: 18)
        ])
        attributedString.append(metricText)
        
        let infoText = NSAttributedString(string: "Info", attributes: [
            .foregroundColor: UIColor.red,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ])
        attributedString.append(infoText)
        
        appNameLabel.attributedText = attributedString
    }
    
    private func setupInitialState() {
        layout1.alpha = 1.0
        layout1.isHidden = false
        layout2.alpha = 0.0
        layout2.isHidden = true
    }
    
    private func setupSwipeGesture() {
        let swipeUpGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeUp(_:)))
        swipeUpGesture.direction = .up
        view.addGestureRecognizer(swipeUpGesture)
        
        let swipeDownGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeDown(_:)))
        swipeDownGesture.direction = .down
        view.addGestureRecognizer(swipeDownGesture)
    }
    
    @objc private func handleSwipeUp(_ gesture: UISwipeGestureRecognizer) {
        guard !isAnimating else { return }
        
        if isLayout1Visible {
            animateToLayout2()
        }
    }
    
    @objc private func handleSwipeDown(_ gesture: UISwipeGestureRecognizer) {
        guard !isAnimating else { return }
        
        if !isLayout1Visible {
            animateToLayout1()
        }
    }
    
    private func animateToLayout2() {
        isAnimating = true
        
        layout2.isHidden = false
        layout2.alpha = 0.0
        layout2.transform = CGAffineTransform(translationX: 0, y: 50)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            self.layout1.alpha = 0.0
            self.layout1.transform = CGAffineTransform(translationX: 0, y: -50)
            
            self.layout2.alpha = 1.0
            self.layout2.transform = .identity
            
        }) { _ in
            self.layout1.isHidden = true
            self.isLayout1Visible = false
            self.isAnimating = false
        }
    }
    
    private func animateToLayout1() {
        isAnimating = true
        
        layout1.isHidden = false
        layout1.alpha = 0.0
        layout1.transform = CGAffineTransform(translationX: 0, y: -50)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [.curveEaseInOut], animations: {
            self.layout2.alpha = 0.0
            self.layout2.transform = CGAffineTransform(translationX: 0, y: 50)
            
            self.layout1.alpha = 1.0
            self.layout1.transform = .identity
            
        }) { _ in
            self.layout2.isHidden = true
            self.isLayout1Visible = true
            self.isAnimating = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        profileImgView.layer.cornerRadius = profileImgView.frame.size.width / 2
        profileImgView.layer.masksToBounds = false
            
        profileImgView.layer.shadowColor = UIColor.black.cgColor
        profileImgView.layer.shadowOpacity = 0.3
        profileImgView.layer.shadowOffset = CGSize(width: 0, height: 3)
        profileImgView.layer.shadowRadius = 5
        
        checkoutBtn.cornerRadius(12)
        checkOut2.cornerRadius(12)
    }

}

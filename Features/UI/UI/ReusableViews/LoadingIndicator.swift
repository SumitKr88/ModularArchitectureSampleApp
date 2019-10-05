//
//  LoadingIndicator.swift
//  LoadingIndicator
//
//  Created by Kumar, Sumit on 07/08/19.
//  Copyright © 2019 sumitkr88. All rights reserved.
//

import UIKit

/// Enum for Loading indicator Type with different background shades, default is Primary
///
/// - primary: Application them Overlay with loading indicator(Gif) at center
/// - secondary: Just an overlay without loading indicator with Application dark theme
/// - webviewLoader: White Overlay with loading indicator(Gif) at center
public enum LoadingIndicatorType {
    case primary
    case secondary
    case webviewLoader
    
    init() {
        self = .primary
    }
}

/*
 Present loading indicator across the application
 
 - Example usage:
 - Default:
 LoadingIndicator.sharedInstance.showOnWindow() - Will present loading indicatory with Primary style
 - Specfic Style:
 LoadingIndicator.sharedInstance.loadingIndicatorType = .Secondary
 LoadingIndicator.sharedInstance.showOnWindow() - Will present loading indicatory with Secondary style
 */
public class LoadingIndicator: UIView {
    
    public static let sharedInstance: LoadingIndicator = LoadingIndicator()

    //As if now apple default indicator being used to present
    //Later if required to present custom , this indicator can be replaced with a custom view xib
    // For example : private var activityIndicator = CustomAnimatedLoader()
    private var activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    
    ///Animation duration
    private let animationDuration = 0.3
    private let label = UILabel()
    
    ///Set the loading indicator type
    public var loadingIndicatorType: LoadingIndicatorType = LoadingIndicatorType() {
        didSet {
            self.alpha = 1.0
            updateUI()
        }
    }
    
    ///Designated initializer
    init() {
        let frame = CGRect(x: UIScreen.main.bounds.origin.x, y: UIScreen.main.bounds.origin.y, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        super.init(frame: frame)
        activityIndicator.frame = frame
        activityIndicator.center = self.center
        self.activityIndicator.addSubview(label)
        updateUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// MARK: - View Methods

    /// TO setup the view on load
    private func updateUI() {
        
        switch loadingIndicatorType {
        case .primary:
            self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            activityIndicator.isHidden = false
        case .secondary:
            self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            activityIndicator.isHidden = true
        case .webviewLoader:
            self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
            activityIndicator.isHidden = false
        }
    }
    
    /// Add loading indicator text below the indicator
    private func setLoadingIndicatorLabel(text: String) {
        label.text = text
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.sizeToFit()
        label.center = CGPoint(x: self.activityIndicator.center.x, y: self.activityIndicator.center.y + 30)
    }
    
    /// Method to show loading indicator on full application window
    public func showOnWindow(loadingIndicatorText: String? = nil) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            guard let currentMainWindow = UIApplication.shared.windows.first else {
                print("LoadingIndicator : No main window found!!")
                return
            }
            
            // Set to UIScreen window size and position
            strongSelf.frame = UIScreen.main.bounds
            strongSelf.activityIndicator.frame = UIScreen.main.bounds
            strongSelf.setLoadingIndicatorLabel(text: loadingIndicatorText ?? "")
        
            currentMainWindow.addSubview(strongSelf)
            if strongSelf.loadingIndicatorType.hashValue != LoadingIndicatorType.secondary.hashValue {
                strongSelf.activityIndicator.startAnimating()
            }
            strongSelf.activityIndicator.center = CGPoint(x: UIScreen.main.bounds.width / 2,
                                                          y: UIScreen.main.bounds.height / 2)
            strongSelf.addSubview(strongSelf.activityIndicator)
            // Fade in the view
            UIView.animate(withDuration: TimeInterval(strongSelf.animationDuration), delay: 0.5, options: [.curveEaseIn], animations: { () -> Void in
                strongSelf.alpha = 1.0
            })
        }
    }
    
    /// Method to show loading indicator on provided view controller
    ///
    /// - Parameter presenter: view controller on which the indicator to be added
    public func showOnController(presenter: UIViewController, loadingIndicatorText: String? = nil) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            print("UI: LoadingIndicator")
            // Set to presenter size and position
            strongSelf.frame = presenter.view.bounds
            strongSelf.activityIndicator.frame = presenter.view.bounds
            strongSelf.setLoadingIndicatorLabel(text: loadingIndicatorText ?? "")
            presenter.view.addSubview(strongSelf)
            if strongSelf.loadingIndicatorType.hashValue != LoadingIndicatorType.secondary.hashValue {
                strongSelf.activityIndicator.startAnimating()
            }
    
            let center = CGFloat(presenter.view.bounds.maxY / 2) - (presenter.navigationController?.tabBarController?.tabBar.frame.height ?? 0)
            strongSelf.activityIndicator.center = CGPoint(x: presenter.view.bounds.maxX / 2 ,
                                                          y: center)
            strongSelf.addSubview(strongSelf.activityIndicator)
            // Fade in the view
            UIView.animate(withDuration: TimeInterval(strongSelf.animationDuration), delay: 0.5, options: [.curveEaseIn], animations: { () -> Void in
                strongSelf.alpha = 1.0
            })
        }
    }
    
    /// Method to show loading indicator on provided view
    ///
    /// - Parameter presenter: view on which the indicator to be added
    public func showOnView(presenter: UIView, loadingIndicatorText: String? = nil) {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            // Set to presenter size and position
            strongSelf.frame = presenter.bounds
            strongSelf.activityIndicator.frame = presenter.bounds
            strongSelf.label.text = loadingIndicatorText
            presenter.addSubview(strongSelf)
            
            if strongSelf.loadingIndicatorType.hashValue != LoadingIndicatorType.secondary.hashValue {
                strongSelf.activityIndicator.startAnimating()
            }
            strongSelf.addSubview(strongSelf.activityIndicator)
            
            // Fade in the view
            UIView.animate(withDuration: TimeInterval(strongSelf.animationDuration), delay: 0.5, options: [.curveEaseIn], animations: { () -> Void in
                strongSelf.alpha = 1.0
            })
        }
    }
    
    /// Method to hide the loading indicator
    public func hide() {
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.activityIndicator.stopAnimating()
            // Fade out the view
            UIView.animate(withDuration: TimeInterval(strongSelf.animationDuration), delay: 0.5, options: [.curveEaseOut], animations: { () -> Void in
                strongSelf.alpha = 0.0
                strongSelf.removeFromSuperview()
            })
        }
    }
}


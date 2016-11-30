//
//  MyPageController.swift
//  LoginFacebook
//
//  Created by David Velarde on 11/29/16.
//  Copyright © 2016 Area51. All rights reserved.
//

import UIKit

class MyPageController: UIPageViewController {

    
    lazy var arrayViewController : [UIViewController] = {
    
        let red = self.giveMeViewController(color: "Red")
        let green = self.giveMeViewController(color: "Green")
        let blue = self.giveMeViewController(color: "Blue")
        
        return [red,green,blue]
    
    }()
    
    func giveMeViewController( color: String)->UIViewController{
    
        let storyboardID = "\(color)VC"
        
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: storyboardID)
        
        return viewController!
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        
        self.setViewControllers([arrayViewController.first!], direction: .forward, animated: true, completion: nil)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MyPageController : UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if var index = arrayViewController.index(of: viewController) {
        
            if index == (arrayViewController.count - 1) {
                return nil
            }
            
            index = index + 1
            
            return arrayViewController[index]
        }
        else {
            return nil
        }
        
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if var index = arrayViewController.index(of: viewController) {
            
            if index == 0 {
                return nil
            }
            
            index = index - 1
            
            return arrayViewController[index]
        }
        else {
            return nil
        }
        
    }

}

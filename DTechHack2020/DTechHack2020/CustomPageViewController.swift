//
//  CustomPageViewController.swift
//  DTechHack2020
//
//  Created by Sophia Patterson on 7/18/20.
//  Copyright © 2020 Sophia Patterson. All rights reserved.
//

import UIKit

class CustomPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var subViewControllers: [UIViewController] = {
        return [
            self.newVC(viewController: "ViewController"), self.newVC(viewController: "ViewController1"), self.newVC(viewController: "ViewController2"), self.newVC(viewController: "ViewController3"), self.newVC(viewController: "ViewController4"), self.newVC(viewController: "CustomTabBarController")
        ]
    }()
    
    func newVC(viewController: String) -> UIViewController {
        
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController)
    }
    
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let viewControllerIndex = subViewControllers.firstIndex(of: viewController) else{
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else{
            return nil
        }
        guard subViewControllers.count > previousIndex else{
            return nil
        }
        return subViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = subViewControllers.firstIndex(of: viewController) else{
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard subViewControllers.count > nextIndex else{
            return nil
        }
        guard subViewControllers.count > nextIndex else{
            return nil
        }
        return subViewControllers[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        let pageController = UIPageControl.appearance()
        pageController.backgroundColor = UIColor.clear
        pageController.currentPageIndicatorTintColor = UIColor.darkGray
        pageController.pageIndicatorTintColor = UIColor.gray
        return subViewControllers.count
        }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        self.view.backgroundColor = UIColor.white
        if let firstViewController = subViewControllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

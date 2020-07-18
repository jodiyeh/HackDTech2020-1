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
            self.newVC(viewController: "ViewController"), self.newVC(viewController: "ViewController1"), self.newVC(viewController: "ViewController2")
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
        return subViewControllers.count
        }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
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

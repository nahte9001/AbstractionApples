//
//  AbstractionViewController.swift
//  AbstractionApples
//
//  Created by Torres, Ethan on 12/6/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

public class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource
{
    //MARK:- Data Members
private lazy var orderedAbstractionViews : [UIViewController] =
{
    return [
        self.newAbstractionViewController(abstractionLevel: "Swift"),
        self.newAbstractionViewController(abstractionLevel: "Block"),
        self.newAbstractionViewController(abstractionLevel: "ByteCode"),
        self.newAbstractionViewController(abstractionLevel: "Binary"),
        self.newAbstractionViewController(abstractionLevel: "LogicalGate"),
        ]
    }()
    
    //MARK: Helper method to retrieve tthe correct ViewController based on the data member
    private func newAbstractionViewController(abstractionLevel : String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
    }
    
    //MARK:-Lifecycle methods
    public override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedAbstractionViews.first
        {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    //MARK:- DataSource required methods
    ///Swipe Left
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController:
        UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
            guard orderedAbstractionViews.count > previousIndex
                else
            {
                return nil
            }
            
            return orderedAbstractionViews[previousIndex]
        }
    
    //Swipe right
    public func pageviewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController:
        UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0 else
        {
            return nil
        }
        
        guard nextIndex >=0
            else
        {
            return nil
        }
        
        guard nextIndex < ordered AbstractionViews.count
            else
        {
            return orderedAbstractionViews.first
        }
        
        return orderedAbstractionViews[nextIndex]
    }
    
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */



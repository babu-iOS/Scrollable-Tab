//
//  ViewController.swift
//  Container
//
//  Created by Ponn Babu on 13/08/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var segmentControl : UISegmentedControl!
    
    var containerVC1: ContainerVc1?
    var containerVC2: ContainerVc2?
    var containerVC3: ContainerVc3?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate  = self
    }

    @IBAction func segmentButtonAction(_ sender: UISegmentedControl){
        let pageIndex = CGFloat(sender.selectedSegmentIndex)
        let offset = CGPoint(x: pageIndex * view.frame.width, y: 0)
        scrollView.setContentOffset(offset, animated: true)
    
    }
    private func getPageIndex(index:Int){
        containerVC1?.callApi(index: index)//call other api call
    }
}

extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / scrollView.frame.width)
        self.segmentControl.selectedSegmentIndex = Int(pageIndex)
        self.getPageIndex(index: Int(pageIndex))
    }
}

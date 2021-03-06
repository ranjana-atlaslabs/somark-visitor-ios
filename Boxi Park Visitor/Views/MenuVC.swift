//
//  MenuVC.swift
//  Boxi Park Visitor
//
//  Created by Atlas-Labs on 5/22/19.
//  Copyright © 2019 Atlas-Labs. All rights reserved.
//

import UIKit
import FittedSheets


class MenuVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tblMenuItems: UITableView!
    @IBOutlet weak var scrollViw: UIScrollView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var viwContent: UIView!
    
    var color = UIColor()
    var image = UIImage()
    var resutrentMenu: Restaurant!
    var selectedItem: Item!
    var headersArray = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupview()
    }
    
    func setupview()  {
 
        imageView.backgroundColor = color
        imageView.image  = image
        imageView.contentMode = .scaleAspectFit
        
        imageView.layer.cornerRadius = 12
        
        tblMenuItems.separatorColor = UIColor.clear
        tblMenuItems.tableFooterView = UIView()
        
        resutrentMenu.sections.forEach { (sec) in
            
            if sec.description != "" {
                headersArray.append(1)
            }else {
                headersArray.append(0)
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
        DispatchQueue.main.async {
            var contentRect = CGRect.zero
            
            for view in self.scrollViw.subviews {
                contentRect = contentRect.union(view.frame)
            }
            
            //set scrollView size
            self.scrollViw.contentSize = CGSize(width:self.view.frame.width, height: self.tblMenuItems.contentSize.height + self.topView.frame.height )
        }
    }
    
    func showBottomSheet()  {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "bottomSheet") as! BottomVC
        
        //Bind Data
        if let select_item = self.selectedItem {
            
            if select_item.choices.count > 0 {
                if let price =  select_item.choices[0].prices.min {
                    switch price {
                    case .double(let num):
                        
                        controller.price =  String(format: "$ %.2f", num)
                        break
                    case .int(_):
                        break
                        
                    case .string(_):
                        break
                    }
                }
            }
            
            if selectedItem.description != "" {
                controller.itemDescription = selectedItem.description
            }else{
                controller.itemDescription = selectedItem.name
            }
            
            controller.itemName = selectedItem.name
            
            
        }
        
        let sheetController = SheetViewController(controller: controller, sizes: [.fixed((self.view.frame.height) * 2/3  + 100)])
        
        // Adjust how the bottom safe area is handled on iPhone X screens
        sheetController.blurBottomSafeArea = false
        sheetController.adjustForBottomSafeArea = true
        
        
        // Make corners more round
        sheetController.topCornersRadius = 30
        
        // Disable the dismiss on background tap functionality
        sheetController.dismissOnBackgroundTap = false
        
        
        // Change the handle color
        sheetController.handleColor = UIColor.lightGray
        
        self.present(sheetController, animated: false, completion: nil)
    }
    
    @IBAction func backBtnTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


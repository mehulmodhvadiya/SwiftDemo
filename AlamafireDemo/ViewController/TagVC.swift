//
//  TagVC.swift
//  AlamafireDemo
//
//  Created by Verve Mac on 25/12/18.
//  Copyright © 2018 Verve Mac. All rights reserved.
//

import UIKit
import TagControl

class TagVC: UIViewController,TagViewDelegate {
     var tagView: TagView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTagView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTagView() {
        if self.tagView != nil {
            self.tagView?.removeFromSuperview()
            self.tagView = nil
        }
        let contents = self.tagViewContents()
        self.tagView = TagView.initTagView(contents, delegate: self)
        self.view.addSubview(self.tagView!)
        self.tagView?.setupInitialConstraintWRTView(self.view)
    }
    func removeTagView() {
        if self.tagView != nil {
            self.tagView?.removeFromSuperview()
            self.tagView = nil
        }
    }
    func tagViewContents() -> [String]? {
        var tags = [String]()
        tags = []
        return tags
    }
    func didTapDoneButton(selectedTags: [String]) {
        print(selectedTags)
        self.removeTagView()
    }
    
    func didTapCancelButton() {
        self.removeTagView()
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

//
//  PageControlView.swift
//  vbGrocery
//
//  Created by Faizan ios developer on 26/11/24.
//

import SwiftUI
import UIKit
struct PageControlView: UIViewRepresentable {
    @Binding var currentPage: Int
       var numberOfPages: Int
    var activeImage: UIImage
       var inactiveImage: UIImage
    func makeUIView(context: Context) -> UIPageControl {
        let pageControl = CustomUIPageControl()
               pageControl.numberOfPages = numberOfPages
               pageControl.currentPage = currentPage
                pageControl.activeImage = activeImage
                pageControl.inactiveImage = inactiveImage
               pageControl.addTarget(
                   context.coordinator,
                   action: #selector(Coordinator.pageChanged(_:)),
                   for: .valueChanged
               )
               return pageControl
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    

    typealias UIViewType = UIPageControl

    func makeCoordinator() -> Coordinator {
          Coordinator(self)
      }
    
    class Coordinator: NSObject {
        var parent: PageControlView

               init(_ parent: PageControlView) {
                   self.parent = parent
               }

               @objc func pageChanged(_ sender: UIPageControl) {
                   parent.currentPage = sender.currentPage
               }
    }
    
}
class CustomUIPageControl: UIPageControl {
    var activeImage: UIImage?
    var inactiveImage: UIImage?

    override func layoutSubviews() {
        super.layoutSubviews()

        for (index, subview) in subviews.enumerated() {
            if let imageView = subview as? UIImageView {
                imageView.image = index == currentPage ? activeImage : inactiveImage
            } else {
                let imageView = UIImageView()
                imageView.frame = subview.bounds
                imageView.image = index == currentPage ? activeImage : inactiveImage
                subview.addSubview(imageView)
                subview.clipsToBounds = false
            }
        }
    }
}

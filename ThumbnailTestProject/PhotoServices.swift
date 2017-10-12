//
//  PhotoServices.swift
//  ThumbnailTestProject
//
//  Created by David Seek on 10/12/17.
//  Copyright © 2017 David Seek. All rights reserved.
//


import Foundation
import MobileCoreServices
import UIKit
import AVFoundation


class PhotoServices: NSObject {
    
    
    static let shared = PhotoServices()
    
    internal var completion: ((URL)->Void)!
    internal let picker = UIImagePickerController()
    
    override init() {
        
        super.init()
        
        self.picker.allowsEditing = false
        self.picker.modalPresentationStyle = .fullScreen
        self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        self.picker.delegate = self
        
    }
    
    func getVideoFromCameraRoll(on: UIViewController, completion: @escaping (_ image: URL)->()) {
        
        self.picker.sourceType = .photoLibrary
        self.picker.mediaTypes = [kUTTypeMovie as String]
        
        DispatchQueue.main.async {
            on.present(self.picker, animated: true) {
                self.completion = completion
            }
        }
        
    }

    
    
}

//
//
// MARK: UIImagePickerControllerDelegate methods
extension PhotoServices: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let url = info[UIImagePickerControllerMediaURL] as? URL {
            
            DispatchQueue.main.async {
                self.picker.dismiss(animated: true) {
                    
                    self.completion(url)
                    
                }
            }
            
        }
        
    }
    
    
}

//
//
// MARK: Thumbnail
extension PhotoServices {
    
    
    func getThumbnailFrom(path: URL) -> UIImage? {
        
        do {
            
            let asset = AVURLAsset(url: path , options: nil)
            let imgGenerator = AVAssetImageGenerator(asset: asset)
            imgGenerator.appliesPreferredTrackTransform = true
            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            
            return thumbnail
            
        } catch let error {
            
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
            
        }
        
    }
    
    
}

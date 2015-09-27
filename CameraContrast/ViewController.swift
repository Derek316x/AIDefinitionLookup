//
//  ViewController.swift
//  CameraContrast
//
//  Created by Michael Kavouras on 9/20/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

import UIKit
import AVFoundation
import GPUImage

class ViewController: UIViewController {
    
    var videoCamera:GPUImageVideoCamera?
    
    @IBOutlet weak var gpuImage: GPUImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPreset640x480, cameraPosition: .Back)
        videoCamera!.outputImageOrientation = .Portrait;
        
        let filterGroup = GPUImageFilterGroup()
        let filters = [Filters.Contrast, Filters.Saturation]
        
        for filter in filters {
            videoCamera?.addTarget(filter)
            filter.addTarget(gpuImage)
            filterGroup.addFilter(filter)
        }
        
        filters[0].addTarget(filters[1])
        filterGroup.initialFilters = [filters[0]]
        filterGroup.terminalFilter = filters[1];
        filterGroup.addTarget(gpuImage)
        
        videoCamera?.startCameraCapture()
    }
    
}



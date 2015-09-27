//
//  Filter.swift
//  CameraContrast
//
//  Created by Michael Kavouras on 9/21/15.
//  Copyright © 2015 Mike Kavouras. All rights reserved.
//

import GPUImage

struct Filters {
    static var Contrast: GPUImageFilter {
        let filter = GPUImageContrastFilter()
        filter.contrast = 4.0
        return filter
    }
    
    static var Saturation: GPUImageFilter {
        let filter = GPUImageSaturationFilter()
        filter.saturation = 0.0
        return filter
    }
}


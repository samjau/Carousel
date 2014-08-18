//
//  IntroViewController.swift
//  Carousel
//
//  Created by Sam Jau on 8/17/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate{

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    @IBOutlet weak var tile1ImageView: UIImageView!
    @IBOutlet weak var tile2ImageView: UIImageView!
    @IBOutlet weak var tile3ImageView: UIImageView!
    @IBOutlet weak var tile4ImageView: UIImageView!
    @IBOutlet weak var tile5ImageView: UIImageView!
    @IBOutlet weak var tile6ImageView: UIImageView!
    //    var tiles : [UIImageView] = [tile1ImageView, tile2ImageView, tile3ImageView, tile4ImageView, tile5ImageView, tile6ImageView]
    var xOffsets : [CGFloat] = [-30, 75, -66, 10, -200, -15]
    var yOffsets : [CGFloat] = [-285, -240, -415, -408, -480, -500]
    var scales : [CGFloat] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations : [CGFloat] = [-0.1745327778, -0.1745327778, 0.1745327778, 0.1745327778, 0.1745327778, -0.1745327778]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        introScrollView.contentSize = introImageView.image.size
        introScrollView.delegate = self
        startPos(tile1ImageView, x: xOffsets[0], y: yOffsets[0], scale: scales[0], rotation: rotations[0])
        startPos(tile2ImageView, x: xOffsets[1], y: yOffsets[1], scale: scales[1], rotation: rotations[1])
        startPos(tile3ImageView, x: xOffsets[2], y: yOffsets[2], scale: scales[2], rotation: rotations[2])
        startPos(tile4ImageView, x: xOffsets[3], y: yOffsets[3], scale: scales[3], rotation: rotations[3])
        startPos(tile5ImageView, x: xOffsets[4], y: yOffsets[4], scale: scales[4], rotation: rotations[4])
        startPos(tile6ImageView, x: xOffsets[5], y: yOffsets[5], scale: scales[5], rotation: rotations[5])
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        var offset = Float(scrollView.contentOffset.y)
        
        var tx = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -30, r2Max:0)
        var ty = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -285, r2Max:0)
        var rotation = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max:0)
        tile1ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation) * M_PI / 180))
        tile1ImageView.transform = CGAffineTransformTranslate(tile1ImageView.transform, CGFloat(tx), CGFloat(ty))
        tile1ImageView.transform = CGAffineTransformScale(tile1ImageView.transform, 1, 1)
        
        var tx1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 75, r2Max:0)
        var ty1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -240, r2Max:0)
        var rotation1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -10, r2Max:0)
        var scale1 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max:1)
        
        tile2ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation1) * M_PI / 180))
        tile2ImageView.transform = CGAffineTransformTranslate(tile2ImageView.transform, CGFloat(tx1), CGFloat(ty1))
        tile2ImageView.transform = CGAffineTransformScale(tile2ImageView.transform, CGFloat(scale1), CGFloat(scale1))
        
        var tx2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -66, r2Max:0)
        var ty2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -415, r2Max:0)
        var rotation2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min:10, r2Max:0)
        var scale2 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.7, r2Max:1)
        
        tile3ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation2) * M_PI / 180))
        tile3ImageView.transform = CGAffineTransformTranslate(tile3ImageView.transform, CGFloat(tx2), CGFloat(ty2))
        tile3ImageView.transform = CGAffineTransformScale(tile3ImageView.transform, CGFloat(scale2), CGFloat(scale2))
        
        var tx3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 10, r2Max:0)
        var ty3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -408, r2Max:0)
        var rotation3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min:10, r2Max:0)
        var scale3 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.6, r2Max:1)
        
        tile4ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation3) * M_PI / 180))
        tile4ImageView.transform = CGAffineTransformTranslate(tile4ImageView.transform, CGFloat(tx3), CGFloat(ty3))
        tile4ImageView.transform = CGAffineTransformScale(tile4ImageView.transform, CGFloat(scale3), CGFloat(scale3))
        
        var tx4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -200, r2Max:0)
        var ty4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -480, r2Max:0)
        var rotation4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min:10, r2Max:0)
        var scale4 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max:1)
        
        tile5ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation4) * M_PI / 180))
        tile5ImageView.transform = CGAffineTransformTranslate(tile5ImageView.transform, CGFloat(tx4), CGFloat(ty4))
        tile5ImageView.transform = CGAffineTransformScale(tile5ImageView.transform, CGFloat(scale4), CGFloat(scale4))
        
        var tx5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -15, r2Max:0)
        var ty5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: -500, r2Max:0)
        var rotation5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min:-10, r2Max:0)
        var scale5 = convertValue(offset, r1Min: 0, r1Max: 568, r2Min: 1.65, r2Max:1)
        
        tile6ImageView.transform = CGAffineTransformMakeRotation(CGFloat(Double(rotation5) * M_PI / 180))
        tile6ImageView.transform = CGAffineTransformTranslate(tile6ImageView.transform, CGFloat(tx5), CGFloat(ty5))
        tile6ImageView.transform = CGAffineTransformScale(tile6ImageView.transform, CGFloat(scale5), CGFloat(scale5))
    }
    
    func startPos(tile: UIImageView, x:CGFloat, y:CGFloat, scale:CGFloat, rotation:CGFloat){
        tile.transform = CGAffineTransformMakeRotation(rotation)
        tile.transform = CGAffineTransformTranslate(tile.transform, x, y)
        tile.transform = CGAffineTransformScale(tile.transform,scale,scale)
    }
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
}


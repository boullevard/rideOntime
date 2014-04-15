//
//  MapsViewController.h
//  rideOnTime
//  Abstract: View controller to manage a scrollview that displays a zoomable image.
//
//  Created by Nabil Mouzannar on 7/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TapDetectingImageView.h"

	
@interface MapsViewController : UIViewController <UIScrollViewDelegate, TapDetectingImageViewDelegate> {
	UIScrollView *imageScrollView;
}


@end

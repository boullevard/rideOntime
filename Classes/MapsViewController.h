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
#import "ThumbImageView.h"
	
	@interface MapsViewController : UIViewController <UIScrollViewDelegate, TapDetectingImageViewDelegate, ThumbImageViewDelegate> {
		UIScrollView *imageScrollView;
		UIScrollView *thumbScrollView;
		UIView       *slideUpView; // Contains thumbScrollView and a label giving credit for the images.
		
		BOOL thumbViewShowing;
		
		NSTimer *autoscrollTimer;  // Timer used for auto-scrolling.
		float autoscrollDistance;  // Distance to scroll the thumb view when auto-scroll timer fires.
	}
	
	@end

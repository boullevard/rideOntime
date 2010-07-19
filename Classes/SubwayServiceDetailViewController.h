//
//  SubwayServiceDetailViewController.h
//  Ride On Time
//
//  Created by Nabil Mouzannar on 7/9/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>


@class Line;
	
@interface SubwayServiceDetailViewController : UIViewController  <UITextFieldDelegate, UIWebViewDelegate>{
		
	@private
		UIWebView *myWebView;
		Line *aLine;
		IBOutlet UIActivityIndicatorView *activityIndicator;
		NSString *html ;
	}
	
	@property (nonatomic, retain) IBOutlet UIWebView *myWebView;
	@property (nonatomic, retain) Line *aLine;
	@property (nonatomic, retain) NSString *html ;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *   activityIndicator;

- (void) stopAndHideActivityIndicator;
- (void) showActivityIndicator;
	@end

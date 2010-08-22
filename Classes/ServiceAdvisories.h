//
//  ServiceAdvisories.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 7/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ServiceAdvisories : UIViewController  <UITextFieldDelegate,UIWebViewDelegate>{
	
@private
	UIWebView *myWebView;
	IBOutlet UIActivityIndicatorView *activityIndicator;
	NSString *html ;
}

@property (nonatomic, retain) IBOutlet UIWebView *myWebView;
@property (nonatomic, retain) NSString *html ;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *   activityIndicator;

- (void) stopAndHideActivityIndicator;
- (void) showActivityIndicator;
@end

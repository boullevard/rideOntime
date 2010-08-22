//
//  ServiceAdvisoryDetailViewController.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 8/3/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ServiceAdvisoryDetailViewController : UIViewController  <UITextFieldDelegate, UIWebViewDelegate>{
	
@private
	UIWebView *myWebView;
	NSString *title;
	NSString *pubDate;
	
	NSMutableDictionary *item;
	
	IBOutlet UIActivityIndicatorView *activityIndicator;
	NSString *html ;
}

@property (nonatomic, retain) IBOutlet UIWebView *myWebView;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *pubDate;
@property (nonatomic, retain) NSString *html ;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *   activityIndicator;

- (void) stopAndHideActivityIndicator;
- (void) showActivityIndicator;

@end

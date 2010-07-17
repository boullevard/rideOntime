//
//  BookDetailViewController.h
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import <UIKit/UIKit.h>

@class Line;

@interface ServiceDetailViewController : UIViewController  <UITextFieldDelegate, UIWebViewDelegate>{

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

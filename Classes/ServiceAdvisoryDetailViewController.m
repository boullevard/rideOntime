//
//  ServiceAdvisoryDetailViewController.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 8/3/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "ServiceAdvisoryDetailViewController.h"


@implementation ServiceAdvisoryDetailViewController

@synthesize title;
@synthesize pubDate;
@synthesize myWebView;
@synthesize activityIndicator;
@synthesize html;


- (void)viewDidLoad {
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

- (void)webViewDidStartLoad:(UIWebView *)webView{
	[self showActivityIndicator];
	
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[self stopAndHideActivityIndicator];
	
}

- (void)viewWillDisappear:(BOOL)animated
{
	
}

- (void)viewDidDisappear:(BOOL)animated{
	//clear webview
	//[myWebView loadHTMLString:@"" baseURL:[NSURL URLWithString:@""]];
}

- (void)viewWillAppear:(BOOL)animated { 	
    // Update the views appropriately  
	NSLog(@"title %@", title);
	html = [NSString stringWithFormat :@"Planned Advisory continue<br><br>Published Date: %@ <br><br>Title:<br><br>%@", pubDate, title];
	
	[myWebView loadHTMLString:html baseURL:[NSURL URLWithString:@"http://mta.info/status/"]];   
	
}
- (void) showActivityIndicator{
	[self.activityIndicator startAnimating];
	
}

- (void) stopAndHideActivityIndicator{
	[self.activityIndicator stopAnimating];
	self.activityIndicator.hidden = YES;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Support all orientations except upside-down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [myWebView release];
    [super dealloc];
}

@end


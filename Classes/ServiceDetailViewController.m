//
//  BookDetailViewController.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "ServiceDetailViewController.h"
#import "Line.h"
#import "FlurryAPI.h"

@implementation ServiceDetailViewController

@synthesize aLine;
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
	[super viewWillAppear:animated];
	NSFileManager *fileManager = [NSFileManager defaultManager];

	myImagePath = [[NSBundle mainBundle] pathForResource: [aLine objectForKey: @"name"] ofType:@"png"];
	exists = [fileManager fileExistsAtPath:myImagePath];
	//NSString *webImage = [NSString stringWithFormat: @"<img src=\'http://mta.info/status/widgetImages/%@.gif'>", [aLine objectForKey: @"name"]];

	if (exists){
		html = [NSString stringWithFormat:@"<p><font style= \'font-family:arial; color: 0xCCCCCC; font-size:12px;'>Posted %@ %@</font><br><span style=\'font-family:arial; font-size:30px; font-weight:bold;'>MTA Service Notice</span><p><img src=\'http://mta.info/status/widgetImages/%@.gif'><br><font face=\'arial'><b> (%@)</b></font><br><font face=\'arial'><b>%@</b></font><br><font face=\'arial'>%@ </font>", 
								[aLine objectForKey: @"Date"],
							   [aLine objectForKey: @"Time"],
							   [aLine objectForKey: @"name"],
								[aLine objectForKey: @"name"],
							   [aLine objectForKey: @"status"],
							   [aLine objectForKey: @"text"]];					   
		}else{
					   html = [NSString stringWithFormat:@"<p><font style= \'font-family:arial; color: 0xCCCCCC; font-size:12px;'>Posted %@ %@</font><br><span style=\'font-family:arial; font-size:30px; font-weight:bold;'>MTA Service Notice</span><p><font face=\'arial'><b>%@</b></font><br><font face=\'arial'><b>%@</b></font><br><font face=\'arial'>%@ </font>", 
							   [aLine objectForKey: @"Date"],
							   [aLine objectForKey: @"Time"],
							   [aLine objectForKey: @"name"],
							   [aLine objectForKey: @"status"],
							   [aLine objectForKey: @"text"]];
					   
				   }
    // Update the views appropriately  

	[myWebView loadHTMLString:html baseURL:[NSURL URLWithString:@"http://mta.info/status/widgetImages/"]]; 
		NSLog(@"************ ServiceDetailViewController Flurry : view viewWillAppear");
	[FlurryAPI logEvent:@"ServiceDetailViewController"];
}

- (void) showActivityIndicator{
	[self.activityIndicator startAnimating];

}

- (void) stopAndHideActivityIndicator{
	[self.activityIndicator stopAnimating];
	//[self.activityIndicator hidesWhenStopped:YES];
	self.activityIndicator.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Support all orientations except upside-down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
	[self.activityIndicator release];
    [myWebView release];
    [super dealloc];
}

@end


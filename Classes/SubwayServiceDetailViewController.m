//
//  BookDetailViewController.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "SubwayServiceDetailViewController.h"
#import "Line.h"

@implementation SubwayServiceDetailViewController

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
    // Update the views appropriately  
	NSString *newStringStatus = [[aLine objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	if ([newStringStatus isEqualToString: @"DELAYS"]){
		html = [NSString stringWithFormat :@"<p><font style= \'font-family:arial; color: 0xCCCCCC; font-size:12px;'>Posted %@ %@</font><br><span style=\'font-family:arial; font-size:30px; font-weight:bold;'>MTA Service Notice</span><p><font face=\'arial'><b>%@</b></font><br><font style= \'font-family:arial; color: 0xFF0000;'><b>%@</b></font><br><font face=\'arial'>%@ </font>", 
				[aLine objectForKey: @"Date"],
				[aLine objectForKey: @"Time"],
				[aLine objectForKey: @"name"],
				[aLine objectForKey: @"status"],
				[aLine objectForKey: @"text"]];
	}else if ([newStringStatus isEqualToString: @"PLANNED WORK"] ){ //for planned work do not write it again because mta has it already
	
		html = [NSString stringWithFormat :@"<p><font style= \'font-family:arial; color: 0xCCCCCC; font-size:12px;'>Posted %@ %@</font><br><span style=\'font-family:arial; font-size:30px; font-weight:bold;'>MTA Service Notice</span><p><font face=\'arial'><b>%@</b></font><br><font face=\'arial'>%@ </font><p>", 
				[aLine objectForKey: @"Date"],
				[aLine objectForKey: @"Time"],
				[aLine objectForKey: @"name"],
				[aLine objectForKey: @"text"]];		
	}else if ([newStringStatus isEqualToString: @"SERVICE CHANGE"]){
	
		html = [NSString stringWithFormat :@"<p><font style= \'font-family:arial; color: 0xCCCCCC; font-size:12px;'>Posted %@ %@</font><br><span style=\'font-family:arial; font-size:30px; font-weight:bold;'>MTA Service Notice</span><p><font face=\'arial'><b>%@</b></font><br><font style= \'font-family:arial; color: 0xFF0000;'><b>%@</b></font><br><font face=\'arial'>%@ </font>", 
				[aLine objectForKey: @"Date"],
				[aLine objectForKey: @"Time"],
				[aLine objectForKey: @"name"],
				[aLine objectForKey: @"status"],
				[aLine objectForKey: @"text"]];
	}

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


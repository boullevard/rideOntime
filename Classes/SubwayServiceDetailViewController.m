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
@synthesize html;


- (void)viewDidLoad {
	NSLog(@"viewDidLoad");
}

- (void)viewDidUnload {
	[super viewDidUnload];
	NSLog(@"viewDidUnload");
}

- (void)viewWillAppear:(BOOL)animated { 
	//html = @"!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~!";
	//clear the webview
	[myWebView loadHTMLString:@"" baseURL:[NSURL URLWithString:@""]];  
    // Update the views appropriately  
	NSString *newStringStatus = [[aLine objectForKey: @"status"] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
	NSLog(@"newStringStatus = %@ ",newStringStatus);
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

	
	
	//NSLog(@"html %@ = ", html);
	[myWebView loadHTMLString:html baseURL:[NSURL URLWithString:@"http://mta.info/status/"]];   
	
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


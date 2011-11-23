//
//  BookDetailViewController.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "ServiceDetailViewController.h"
#import "Line.h"
#import "FlurryAnalytics.h"

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

/*
- (NSString *)flattenHTML:(NSString *)html {
    NSScanner *theScanner;
    NSString *text = nil;
    theScanner = [NSScanner scannerWithString:html];
    while ([theScanner isAtEnd] == NO) {
        // find start of tag
        [theScanner scanUpToString:@"<" intoString:NULL] ; 
        NSLog(@"theScanner 1: %@", theScanner);
        // find end of tag
        [theScanner scanUpToString:@">" intoString:&text] ;
        NSLog(@"theScanner 2: %@", theScanner);
        // replace the found tag with a space
        //(you can filter multi-spaces out later if you wish)
      
      //  if ([text isEqualToString:@"<STRONG"] || [text isEqualToString:@"</STRONG"] || [text isEqualToString:@"<P"] || [text isEqualToString:@"</P"]){
        if ([text hasPrefix:@"<a style"]){
            
        
    }else{
            
            NSLog(@"text %@ ",text);
            html = [html stringByReplacingOccurrencesOfString:[ NSString stringWithFormat:@"%@>", text] withString:@" "];
        }
    } // while //
    
    return html;
}
*/
- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[self stopAndHideActivityIndicator];
}

- (void)viewWillDisappear:(BOOL)animated{
}

- (void)viewDidDisappear:(BOOL)animated{
	//clear webview
}

- (void)viewWillAppear:(BOOL)animated { 
	[super viewWillAppear:animated];
	NSFileManager *fileManager = [NSFileManager defaultManager];

	myImagePath = [[NSBundle mainBundle] pathForResource: [aLine objectForKey: @"name"] ofType:@"png"];
	exists = [fileManager fileExistsAtPath:myImagePath];
	//NSString *webImage = [NSString stringWithFormat: @"<img src=\'http://mta.info/status/widgetImages/%@.gif'>", [aLine objectForKey: @"name"]];

	if (exists){
        if ([aLine objectForKey: @"status"] == @"PLANNED WORK"){
            NSLog(@"nabil planned WORKKKK");
        }
		html = [NSString stringWithFormat:@"<p><font style= \'font-family:arial; color: 0xCCCCCC; font-size:12px;'>Posted %@ %@</font><br><span style=\'font-family:arial; font-size:30px; font-weight:bold;'>MTA Service Notice</span><p><img src=\'http://mta.info/status/widgetImages/%@.gif'><br><font face=\'arial'><b> (%@)</b></font><br><font face=\'arial'><b>%@</b></font><br><font face=\'arial'><b>%@</b></font><br><font face=\'arial'>%@ </font>", 
								[aLine objectForKey: @"Date"],
							   [aLine objectForKey: @"Time"],
							   [aLine objectForKey: @"name"],
								[aLine objectForKey: @"name"],
							   [aLine objectForKey: @"status"],
                [aLine objectForKey: @"plannedworkheadline"],
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
	[FlurryAnalytics logEvent:@"ServiceDetailViewController" timed:YES];
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
	[self.activityIndicator release];
    [myWebView release];
    [super dealloc];
}


@end


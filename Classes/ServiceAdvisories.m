//
//  ServiceAdvisories.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 7/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "ServiceAdvisories.h"
#import "Constants.h"

@implementation ServiceAdvisories

@synthesize myWebView;
@synthesize activityIndicator;
@synthesize html;


- (void) getCurrentDate{
	NSDate* date = [NSDate date];
	
	//Create the dateformatter object
	
	NSDateFormatter* formatter = [[[NSDateFormatter alloc] init] autorelease];
	
	//Set the required date format
	
	[formatter setDateFormat:@"yyyy-MM-dd"];
	
	//Get the string date
	
	NSString* str = [formatter stringFromDate:date];
	
	//Display on the console
	
	NSLog(str);
		
}
- (void)viewDidLoad {
	
	[super viewDidLoad];
	
	self.title = NSLocalizedString(@"NYCT - Service Advisory", @"");
	[self getCurrentDate]; //nabil test to feed todays date in url webview
	CGRect webFrame = [[UIScreen mainScreen] applicationFrame];
	webFrame.origin.y = 0;//kTopMargin + 5.0;	// leave from the URL input field and its label
	//webFrame.size.height -= 40.0;
	self.myWebView = [[[UIWebView alloc] initWithFrame:webFrame] autorelease];
	self.myWebView.backgroundColor = [UIColor whiteColor];
	self.myWebView.scalesPageToFit = YES;
	self.myWebView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
	self.myWebView.delegate = self;
	[self.view addSubview: self.myWebView];
/*	
	CGRect textFieldFrame = CGRectMake(kLeftMargin, kTweenMargin,
									   self.view.bounds.size.width - (kLeftMargin * 2.0), kTextFieldHeight);
	UITextField *urlField = [[UITextField alloc] initWithFrame:textFieldFrame];
    urlField.borderStyle = UITextBorderStyleBezel;
    urlField.textColor = [UIColor blackColor];
    urlField.delegate = self;
    urlField.placeholder = @"<enter a URL>";
    urlField.text = @"http://tripplanner.mta.info/serviceAdvisory/routeStatusResult.aspx?tag=ALL&date=7%2f30%2f2010&time=&method=getstatus";
	urlField.backgroundColor = [UIColor whiteColor];
	urlField.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	urlField.returnKeyType = UIReturnKeyGo;
	urlField.keyboardType = UIKeyboardTypeURL;	// this makes the keyboard more friendly for typing URLs
	urlField.autocapitalizationType = UITextAutocapitalizationTypeNone;	// don't capitalize
	urlField.autocorrectionType = UITextAutocorrectionTypeNo;	// we don't like autocompletion while typing
	urlField.clearButtonMode = UITextFieldViewModeAlways;
	[urlField setAccessibilityLabel:NSLocalizedString(@"URLTextField", @"")];
	[self.view addSubview:urlField];
	[urlField release];
*/	
	[self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.straphangers.org/lines/v2divshow.php?Q"]]];

	//http://twitter.com/511nyBDFV"]]];	  
														 
}


// called after the view controller's view is released and set to nil.
// For example, a memory warning which causes the view to be purged. Not invoked as a result of -dealloc.
// So release any properties that are loaded in viewDidLoad or can be recreated lazily.
- (void)viewDidUnload {
	[super viewDidUnload];
	
	// release and set to nil
	self.myWebView = nil;
}


- (void)viewWillDisappear:(BOOL)animated
{
	[self.myWebView stopLoading];	// in case the web view is still loading its content
	self.myWebView.delegate = nil;	// disconnect the delegate as the webview is hidden
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	
}

- (void)viewDidDisappear:(BOOL)animated{
	//clear webview
}

- (void)viewWillAppear:(BOOL)animated { 	
   self.myWebView.delegate = self;	// setup the delegate as the web view is shown
}
- (void) showActivityIndicator{
	[self.activityIndicator startAnimating];
	
}

- (void) stopAndHideActivityIndicator{
	[self.activityIndicator stopAnimating];
	self.activityIndicator.hidden = YES;
}


	- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
	{
		// we support rotation in this view controller
		return YES;
	}
	
	// this helps dismiss the keyboard when the "Done" button is clicked
	- (BOOL)textFieldShouldReturn:(UITextField *)textField
	{
		[textField resignFirstResponder];
		[self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[textField text]]]];
		
		return YES;
	}
	- (void)webViewDidStartLoad:(UIWebView *)webView
	{
			[self showActivityIndicator];
		// starting the load, show the activity indicator in the status bar
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	}
	
	- (void)webViewDidFinishLoad:(UIWebView *)webView
	{
		[self stopAndHideActivityIndicator];
		// finished loading, hide the activity indicator in the status bar
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	}
	
	- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
	{
		// load error, hide the activity indicator in the status bar
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
		
		// report the error inside the webview
		NSString* errorString = [NSString stringWithFormat:
								 @"<html><center><font size=+5 color='red'>An error occurred:<br>%@</font></center></html>",
								 error.localizedDescription];
		[self.myWebView loadHTMLString:errorString baseURL:nil];
	}
	
	
- (void)dealloc {
		myWebView.delegate = nil;
    [myWebView release];
    [super dealloc];
}

@end


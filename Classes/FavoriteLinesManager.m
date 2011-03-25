//
//  FavoriteLinesManager.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 11/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "FavoriteLinesManager.h"
#import "TabAppDelegate.h"
#import "FlurryAPI.h"

@implementation FavoriteLinesManager

@synthesize myPickerView,customPickerView, customPickerDataSource, temp ;//temp to hold the uilabels of all liens in the favorite list

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
		appDelegate = (TabAppDelegate *)[[UIApplication sharedApplication] delegate];
	NSLog(@"!!!!1. FavoriteLines Manager viewDidLoad");
	self.title = @"Choose a line";
	self.view.backgroundColor =  [UIColor grayColor];
	
	[self createCustomPicker];
	
	//
	self.temp = [[NSMutableArray alloc] init];
	self.temp = [appDelegate getLinesDataBasedOnRowSelectedArray: [appDelegate rowsSelectedArray]];
	CGFloat xPlacement;
	CGFloat yPlacement;
	for (int i=0; i< [self.temp count]; i++) {
		NSString *name = [[self.temp objectAtIndex:i] objectForKey:@"name"];
		xPlacement = 10;
		yPlacement = 260 + (i * 12);
		if (i > 10){
			xPlacement = 180;
			yPlacement = 260 + ((i-11) * 12);
		}
		CGRect frame = CGRectMake(xPlacement, yPlacement, self.view.bounds.size.width, 20);
		UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
		
		label.textAlignment = UITextAlignmentLeft;
		label.text = name;
		label.font = [UIFont boldSystemFontOfSize:12.0];
		label.textColor = [UIColor blackColor];
		label.backgroundColor = [UIColor clearColor];
		[self.view addSubview: label];
	}

	yPlacement = 220;
	CGRect frame = CGRectMake(10, yPlacement, self.view.bounds.size.width, 50);
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
    
	titleLabel.textAlignment = UITextAlignmentLeft;
    titleLabel.text = @"Favorite Lines already in your list:";
    titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    titleLabel.textColor = [UIColor colorWithRed:76.0/255.0 green:86.0/255.0 blue:108.0/255.0 alpha:1.0];
    titleLabel.backgroundColor = [UIColor clearColor];
	[self.view addSubview: titleLabel];

}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	NSLog(@"************ FavoriteLinesManager Flurry : view viewWillAppear");
	[FlurryAPI logEvent:@"FavoriteLinesManager"];
}


#pragma mark 
#pragma mark UIPickerView - Custom Picker
- (void)createCustomPicker
{
	self.customPickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
	self.customPickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	
	// setup the data source and delegate for this picker
	self.customPickerDataSource = [[CustomPickerDataSource alloc] init];
	self.customPickerView.dataSource = self.customPickerDataSource;
	self.customPickerView.delegate = self.customPickerDataSource;
	
	// note we are using CGRectZero for the dimensions of our picker view,
	// this is because picker views have a built in optimum size,
	// you just need to set the correct origin in your view.
	//
	// position the picker at the bottom
	//CGSize pickerSize = [self.myPickerView sizeThatFits:CGSizeZero];
	
	//CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
	CGRect pickerRect = CGRectMake(0,
								   0,
								   320,
								   216);
	
//	NSLog(@"pickerSize.width %@ , pickerSize.height: %@ ",pickerSize.width , pickerSize.height);
	self.customPickerView.frame = pickerRect;
	
	self.customPickerView.showsSelectionIndicator = YES;

	// add this picker to our view controller
	[self.view addSubview:self.customPickerView];
}


- (NSInteger) getPickerRowSelected{
	//NSLog(@"row in favoritelines manager %d",[self.customPickerDataSource rowsSelectedArray]);
	return [customPickerDataSource getRowSelected];
	
}
/*
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Support all orientations except upside-down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
	CGFloat width = CGRectGetWidth(self.view.bounds);
	NSLog(@"didRotateFromInterfaceOrientation width %d ", width);
}

*/
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[self.customPickerView release];
	[self.customPickerDataSource release];
	[self.temp release];
    [super dealloc];
}

@end

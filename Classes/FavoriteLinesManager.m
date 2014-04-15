//
//  FavoriteLinesManager.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 11/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "FavoriteLinesManager.h"
#import "TabAppDelegate.h"
#import "Flurry.h"
#import "CustomPickerDataSource.h"

@implementation FavoriteLinesManager

@synthesize temp ;//temp to hold the uilabels of all liens in the favorite list


const CGFloat kOptimumPickerHeight = 216;
const CGFloat kOptimumPickerWidth = 320;

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
	self.title = @"Choose a line";
	self.view.backgroundColor =  [UIColor grayColor];
		
	//
	self.temp = [[NSMutableArray alloc] init];
	self.temp = [appDelegate getLinesDataBasedOnRowSelectedArray: [appDelegate rowsSelectedArray]];
	CGFloat xPlacement;
	CGFloat yPlacement;
	for (int i=0; i< [self.temp count]; i++) {
		NSString *name = [[self.temp objectAtIndex:i] objectForKey:@"name"];
        NSLog(@"name %@ ",name);
		xPlacement = 10;
		yPlacement = 260 + (i * 12);
		if (i > 10){
			xPlacement = 180;
			yPlacement = 260 + ((i-11) * 12);
		}
		CGRect frame = CGRectMake(xPlacement, yPlacement, self.view.bounds.size.width, 20);
		UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
		
		label.textAlignment = NSTextAlignmentLeft;
		label.text = name;
		label.font = [UIFont boldSystemFontOfSize:12.0];
		label.textColor = [UIColor blackColor];
		label.backgroundColor = [UIColor clearColor];
		[self.view addSubview: label];
	}

	yPlacement = 220;
	CGRect frame = CGRectMake(10, yPlacement, self.view.bounds.size.width, 50);
	UILabel *titleLabel = [[[UILabel alloc] initWithFrame:frame] autorelease];
    
	titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.text = @"Favorite Lines already in your list:";
    titleLabel.font = [UIFont boldSystemFontOfSize:17.0];
    titleLabel.textColor = [UIColor colorWithRed:76.0/255.0 green:86.0/255.0 blue:108.0/255.0 alpha:1.0];
    titleLabel.backgroundColor = [UIColor clearColor];
	[self.view addSubview: titleLabel];


    [self createPicker];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[Flurry logEvent:@"FavoriteLinesManager" timed:YES];
}


// return the picker frame based on its size, positioned at the bottom of the page relative to the toolbar
- (CGRect)pickerFrameWithSize:(CGSize)size
{
    CGRect resultFrame;
    
    CGFloat height = size.height;
    CGFloat width = size.width;
    
    if (size.height < kOptimumPickerHeight)
        // if in landscape, the picker height can be sized too small, so use a optimum height
        height = kOptimumPickerHeight;
    
    if (size.width > kOptimumPickerWidth)
        // keep the width an optimum size as well
        width = kOptimumPickerWidth;
    
    resultFrame = CGRectMake(0.0, -1.0, width, height);
    
    return resultFrame;
}

#pragma mark - UIPickerView

- (void)createPicker
{
	    self.customPickerDataSource = [[CustomPickerDataSource alloc] init];
    
	self.myPickerView = [[UIPickerView alloc] initWithFrame:CGRectZero];
	
	[self.myPickerView sizeToFit];
    CGSize pickerSize = self.myPickerView.frame.size;
    self.myPickerView.frame = [self pickerFrameWithSize:pickerSize];
    
    self.myPickerView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
	self.myPickerView.showsSelectionIndicator = YES;	// note this is defaulted to NO
	
	// this view controller is the data source and delegate
	self.myPickerView.delegate = self.customPickerDataSource;
	self.myPickerView.dataSource = self.customPickerDataSource;
	
    
	[self.view addSubview:self.myPickerView];
}


- (NSInteger) getPickerRowSelected{
	//NSLog(@"row in favoritelines manager %d",[self.customPickerDataSource rowsSelectedArray]);
	return [self.customPickerDataSource getRowSelected];
}


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
	[self.myPickerView release];
    [self.customPickerDataSource release];
	[self.temp release];
    [super dealloc];
}

@end

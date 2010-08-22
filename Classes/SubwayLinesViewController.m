//
//  SubwayLinesViewController.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 8/11/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "SubwayLinesViewController.h"
#import "ServiceAdvisoryViewController.h"

@implementation SubwayLinesViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction) buttonTouchUpInside: (id) sender {
	NSLog(@"sender %@",sender);
	//if(serviceAdvisoryViewController == nil)
		serviceAdvisoryViewController = [[ServiceAdvisoryViewController alloc] initWithNibName:@"ServiceAdvisoryViewController" bundle:[NSBundle mainBundle]];
	
	serviceAdvisoryViewController.line = @"1";
	[self.navigationController pushViewController:serviceAdvisoryViewController animated:YES];
}

- (IBAction) buttonTouchUpInside1: (id) sender {
	//if(serviceAdvisoryViewController == nil)
		serviceAdvisoryViewController = [[ServiceAdvisoryViewController alloc] initWithNibName:@"ServiceAdvisoryViewController" bundle:[NSBundle mainBundle]];
	
	serviceAdvisoryViewController.line = @"2";
	[self.navigationController pushViewController:serviceAdvisoryViewController animated:YES];
}	
- (IBAction) buttonTouchUpInside2: (id) sender {
	//if(serviceAdvisoryViewController == nil)
		serviceAdvisoryViewController = [[ServiceAdvisoryViewController alloc] initWithNibName:@"ServiceAdvisoryViewController" bundle:[NSBundle mainBundle]];
	
	serviceAdvisoryViewController.line = @"3";
	[self.navigationController pushViewController:serviceAdvisoryViewController animated:YES];
}	
- (IBAction) buttonTouchUpInside3: (id) sender {
	//if(serviceAdvisoryViewController == nil)
		serviceAdvisoryViewController = [[ServiceAdvisoryViewController alloc] initWithNibName:@"ServiceAdvisoryViewController" bundle:[NSBundle mainBundle]];
	
	serviceAdvisoryViewController.line = @"4";
	[self.navigationController pushViewController:serviceAdvisoryViewController animated:YES];
}	


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

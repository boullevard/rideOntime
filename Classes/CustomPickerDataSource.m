/*
      Copyright (C) 2009 Apple Inc. All Rights Reserved.
 
 */

#import "CustomPickerDataSource.h"
#import "CustomView.h"

@implementation CustomPickerDataSource

@synthesize customPickerArray;

- (id)init
{
	// use predetermined frame size
	self = [super init];
	if (self)
	{
		// create the data source for this custom picker
		NSMutableArray *viewArray = [[NSMutableArray alloc] init];

		CustomView *onetwothreeView = [[CustomView alloc] initWithFrame:CGRectZero];
		onetwothreeView.title = @"123";
		onetwothreeView.image = [UIImage imageNamed:@"123.png"];
		[viewArray addObject:onetwothreeView];
		[onetwothreeView release];

		CustomView *fourfivesixView = [[CustomView alloc] initWithFrame:CGRectZero];
		fourfivesixView.title = @"456";
		fourfivesixView.image = [UIImage imageNamed:@"456.png"];
		[viewArray addObject:fourfivesixView];
		[fourfivesixView release];

		CustomView *sevenView = [[CustomView alloc] initWithFrame:CGRectZero];
		sevenView.title = @"7";
		sevenView.image = [UIImage imageNamed:@"7.png"];
		[viewArray addObject:sevenView];
		[sevenView release];

		CustomView *aceView = [[CustomView alloc] initWithFrame:CGRectZero];
		aceView.title = @"ACE";
		aceView.image = [UIImage imageNamed:@"ACE.png"];
		[viewArray addObject:aceView];
		[aceView release];
	
		CustomView *bdfmView = [[CustomView alloc] initWithFrame:CGRectZero];
		bdfmView.title = @"BDFM";
		bdfmView.image = [UIImage imageNamed:@"BDFM.png"];
		[viewArray addObject:bdfmView];
		[bdfmView release];
		
		CustomView *gView = [[CustomView alloc] initWithFrame:CGRectZero];
		gView.title = @"G";
		gView.image = [UIImage imageNamed:@"G.png"];
		[viewArray addObject:gView];
		[gView release];
		
		CustomView *jzView = [[CustomView alloc] initWithFrame:CGRectZero];
		jzView.title = @"JZ";
		jzView.image = [UIImage imageNamed:@"JZ.png"];
		[viewArray addObject:jzView];
		[jzView release];

		CustomView *lView = [[CustomView alloc] initWithFrame:CGRectZero];
		lView.title = @"L";
		lView.image = [UIImage imageNamed:@"L.png"];
		[viewArray addObject:lView];
		[lView release];
		
		CustomView *nqrView = [[CustomView alloc] initWithFrame:CGRectZero];
		nqrView.title = @"NQR";
		nqrView.image = [UIImage imageNamed:@"NQR.png"];
		[viewArray addObject:nqrView];
		[nqrView release];
		
		CustomView *sView = [[CustomView alloc] initWithFrame:CGRectZero];
		sView.title = @"S";
		sView.image = [UIImage imageNamed:@"S.png"];
		[viewArray addObject:sView];
		[sView release];
		
		CustomView *sirView = [[CustomView alloc] initWithFrame:CGRectZero];
		sirView.title = @"SIR";
		sirView.image = [UIImage imageNamed:@"SIR.png"];
		[viewArray addObject:sirView];
		[sirView release];
		// total : 11 - starting from 1
		
		//Bus
		
		CustomView *b1b83View = [[CustomView alloc] initWithFrame:CGRectZero];
		b1b83View.title = @"B1 - B83";
		b1b83View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:b1b83View];
		[b1b83View release];

		CustomView *b100b103View = [[CustomView alloc] initWithFrame:CGRectZero];
		b100b103View.title = @"B100 - B103";
		b100b103View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:b100b103View];
		[b100b103View release];

		CustomView *bm1bm5View = [[CustomView alloc] initWithFrame:CGRectZero];
		bm1bm5View.title = @"BM1 - BM5";
		bm1bm5View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:bm1bm5View];
		[bm1bm5View release];
		
		CustomView *bx1bx55View = [[CustomView alloc] initWithFrame:CGRectZero];
		bx1bx55View.title = @"BX1 - BX55";
		bx1bx55View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:bx1bx55View];
		[bx1bx55View release];
		
		CustomView *bxm1bxm18View = [[CustomView alloc] initWithFrame:CGRectZero];
		bxm1bxm18View.title = @"BXM1 - BXM18";
		bxm1bxm18View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:bxm1bxm18View];
		[bxm1bxm18View release];
		
		CustomView *m1m116View = [[CustomView alloc] initWithFrame:CGRectZero];
		m1m116View.title = @"M1 - M116";
		m1m116View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:m1m116View];
		[m1m116View release];
		
		CustomView *n1n88View = [[CustomView alloc] initWithFrame:CGRectZero];
		n1n88View.title = @"N1 - N88";
		n1n88View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:n1n88View];
		[n1n88View release];
		
		CustomView *q1q113View = [[CustomView alloc] initWithFrame:CGRectZero];
		q1q113View.title = @"Q1 - Q113";
		q1q113View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:q1q113View];
		[q1q113View release];
		
		CustomView *qm1qm25View = [[CustomView alloc] initWithFrame:CGRectZero];
		qm1qm25View.title = @"QM1 - QM25";
		qm1qm25View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:qm1qm25View];
		[qm1qm25View release];
		
		CustomView *s40s98View = [[CustomView alloc] initWithFrame:CGRectZero];
		s40s98View.title = @"S40 - S98";
		s40s98View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:s40s98View];
		[s40s98View release];
		
		CustomView *x1x68View = [[CustomView alloc] initWithFrame:CGRectZero];
		x1x68View.title = @"x1 - x68";
		x1x68View.image = [UIImage imageNamed:@"busPickerIcon.png"];
		[viewArray addObject:x1x68View];
		[x1x68View release];
		// total : 11 - starting from 1
		
		//LIRR
		
		CustomView *cityTerminalView = [[CustomView alloc] initWithFrame:CGRectZero];
		cityTerminalView.title = @"City Terminal Zone";
		cityTerminalView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:cityTerminalView];
		[cityTerminalView release];
		
		CustomView *babylonView = [[CustomView alloc] initWithFrame:CGRectZero];
		babylonView.title = @"Babylon";
		babylonView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:babylonView];
		[babylonView release];

		CustomView *farRockawayView = [[CustomView alloc] initWithFrame:CGRectZero];
		farRockawayView.title = @"Far Rockaway";
		farRockawayView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:farRockawayView];
		[farRockawayView release];
		
		CustomView *hempsteadView = [[CustomView alloc] initWithFrame:CGRectZero];
		hempsteadView.title = @"Hempstead";
		hempsteadView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:hempsteadView];
		[hempsteadView release];

		CustomView *longBeachView = [[CustomView alloc] initWithFrame:CGRectZero];
		longBeachView.title = @"Long Beach";
		longBeachView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:longBeachView];
		[longBeachView release];
		
		CustomView *montaukView = [[CustomView alloc] initWithFrame:CGRectZero];
		montaukView.title = @"Montauk";
		montaukView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:montaukView];
		[montaukView release];

		CustomView *oysterBayView = [[CustomView alloc] initWithFrame:CGRectZero];
		oysterBayView.title = @"Oyster Bay";
		oysterBayView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:oysterBayView];
		[oysterBayView release];
		
		CustomView *portJeffersonView = [[CustomView alloc] initWithFrame:CGRectZero];
		portJeffersonView.title = @"Port Jefferson";
		portJeffersonView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:portJeffersonView];
		[portJeffersonView release];

		CustomView *portWashingtonView = [[CustomView alloc] initWithFrame:CGRectZero];
		portWashingtonView.title = @"Port Washington";
		portWashingtonView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:portWashingtonView];
		[portWashingtonView release];
		
		CustomView *ronkonkomaView = [[CustomView alloc] initWithFrame:CGRectZero];
		ronkonkomaView.title = @"Ronkonkoma";
		ronkonkomaView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:ronkonkomaView];
		[ronkonkomaView release];

		CustomView *westHempsteadView = [[CustomView alloc] initWithFrame:CGRectZero];
		westHempsteadView.title = @"West Hempstead";
		westHempsteadView.image = [UIImage imageNamed:@"LIRRPickerIcon.png"];
		[viewArray addObject:westHempsteadView];
		[westHempsteadView release];
		// total : 11 - starting from 1
		
		// Metro-North
		//metronorthPickerIcon.png
		CustomView *hudsonView = [[CustomView alloc] initWithFrame:CGRectZero];
		hudsonView.title = @"Hudson";
		hudsonView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:hudsonView];
		[hudsonView release];
		
		CustomView *harlemView = [[CustomView alloc] initWithFrame:CGRectZero];
		harlemView.title = @"Harlem";
		harlemView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:harlemView];
		[harlemView release];
		
		CustomView *wassaicView = [[CustomView alloc] initWithFrame:CGRectZero];
		wassaicView.title = @"Wassaic";
		wassaicView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:wassaicView];
		[wassaicView release];
		
		CustomView *newHavenView = [[CustomView alloc] initWithFrame:CGRectZero];
		newHavenView.title = @"New Haven";
		newHavenView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:newHavenView];
		[newHavenView release];
		
		CustomView *newCanaanView = [[CustomView alloc] initWithFrame:CGRectZero];
		newCanaanView.title = @"New Canaan";
		newCanaanView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:newCanaanView];
		[newCanaanView release];
				
		CustomView *danburyView = [[CustomView alloc] initWithFrame:CGRectZero];
		danburyView.title = @"Danbury";
		danburyView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:danburyView];
		[danburyView release];
		
		CustomView *waterburyView = [[CustomView alloc] initWithFrame:CGRectZero];
		waterburyView.title = @"Waterbury";
		waterburyView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:waterburyView];
		[waterburyView release];
		
		CustomView *pascackValleyView = [[CustomView alloc] initWithFrame:CGRectZero];
		pascackValleyView.title = @"Pascack Valley";
		pascackValleyView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:pascackValleyView];
		[pascackValleyView release];
		
		CustomView *portJervisView = [[CustomView alloc] initWithFrame:CGRectZero];
		portJervisView.title = @"Port Jervis";
		portJervisView.image = [UIImage imageNamed:@"metronorthPickerIcon.png"];
		[viewArray addObject:portJervisView];
		[portJervisView release];
		// total : 9 - starting from 1
		
		//Bridges And Tunnels
		CustomView *throgsNeckView = [[CustomView alloc] initWithFrame:CGRectZero];
		throgsNeckView.title = @"Throgs Neck";
		throgsNeckView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:throgsNeckView];
		[throgsNeckView release];
		
		CustomView *henryHudsonView = [[CustomView alloc] initWithFrame:CGRectZero];
		henryHudsonView.title = @"Henry Hudson";
		henryHudsonView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:henryHudsonView];
		[henryHudsonView release];
		
		CustomView *marineParkwayView = [[CustomView alloc] initWithFrame:CGRectZero];
		marineParkwayView.title = @"Marine Parkway";
		marineParkwayView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:marineParkwayView];
		[marineParkwayView release];
		
		CustomView *bronxWhitestoneView = [[CustomView alloc] initWithFrame:CGRectZero];
		bronxWhitestoneView.title = @"Bronx-Whitestone";
		bronxWhitestoneView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:bronxWhitestoneView];
		[bronxWhitestoneView release];
		
		CustomView *brooklynBatteryView = [[CustomView alloc] initWithFrame:CGRectZero];
		brooklynBatteryView.title = @"Brooklyn-Battery";
		brooklynBatteryView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:brooklynBatteryView];
		[brooklynBatteryView release];
		
		CustomView *queensMidtownView = [[CustomView alloc] initWithFrame:CGRectZero];
		queensMidtownView.title = @"Queens Midtown";
		queensMidtownView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:queensMidtownView];
		[queensMidtownView release];
		
		CustomView *robertFKennedyView = [[CustomView alloc] initWithFrame:CGRectZero];
		robertFKennedyView.title = @"Robert F. Kennedy";
		robertFKennedyView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:robertFKennedyView];
		[robertFKennedyView release];
		
		CustomView *crossBayView = [[CustomView alloc] initWithFrame:CGRectZero];
		crossBayView.title = @"Cross Bay";
		crossBayView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:crossBayView];
		[crossBayView release];
		
		CustomView *verrazanoNarrowsView = [[CustomView alloc] initWithFrame:CGRectZero];
		verrazanoNarrowsView.title = @"Verrazano-Narrows";
		verrazanoNarrowsView.image = [UIImage imageNamed:@"bridgesTunnelsPickerIcon.png"];
		[viewArray addObject:verrazanoNarrowsView];
		[verrazanoNarrowsView release];
		// total : 9 - starting from 1
		
		self.customPickerArray = viewArray;
        NSLog(@"self.customPickerArray %@ ",[self.customPickerArray objectAtIndex:0]);
		[viewArray release];
	}
	return self;
}

- (void)dealloc
{
	[customPickerArray release];
	[super dealloc];
}


#pragma mark -
#pragma mark UIPickerViewDataSource

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
	return [CustomView viewWidth];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
	return [CustomView viewHeight];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return [customPickerArray count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}


#pragma mark -
#pragma mark UIPickerViewDelegate

// tell the picker which view to use for a given component and row, we have an array of views to show
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
		  forComponent:(NSInteger)component reusingView:(UIView *)view
{
    // THE BELOW IS a hack from: http://stackoverflow.com/questions/19158319/ios7-uipickerview-doesnt-properly-display-custom-views-with-images
    
    // self.myImages is an array of UIImageView objects
    UIView * myView = [customPickerArray objectAtIndex:row];
    
    // first convert to a UIImage
    UIGraphicsBeginImageContextWithOptions(myView.bounds.size, NO, 0);
    
    [myView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // then convert back to a UIImageView and return it
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    return imageView;
    
//    return [customPickerArray objectAtIndex:row];
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
	rowSelected = row;
}

- (void) setRowSelected: (NSInteger) row{
	
}

- (NSInteger) getRowSelected{
	return rowSelected;
}
@end

//
//  Book.m
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import "Line.h"


@implementation Line

@synthesize status, text, url, name, Date, Time, plannedworkheadline;


- (void) dealloc {
    [plannedworkheadline release];
	[Time release];
	[Date release];
	[url release];
	[text release];
	[status release];
	[name release];
	[super dealloc];
}

@end

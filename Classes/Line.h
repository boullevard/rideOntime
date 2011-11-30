//
//  Book.h
//  XML
//
//  Created by iPhone SDK Articles on 11/23/08.
//  Copyright 2008 www.iPhoneSDKArticles.com.
//

#import <UIKit/UIKit.h>


@interface Line : NSDictionary {

	NSString *name;
	NSString *status;	//Same name as the Entity Name.
	NSString *text;	//Same name as the Entity Name.
	NSString *url;	//Same name as the Entity Name.
	NSString *Date;	//Same name as the Entity Name.
	NSString *Time;	//Same name as the Entity Name.	
    NSString *plannedworkheadline; // aded new by MTA 10/14/11
}

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *text;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *Date;
@property (nonatomic, retain) NSString *Time;
@property (nonatomic, retain) NSString *plannedworkheadline;
@end

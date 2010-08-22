//
//  MapDetailViewController.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 8/3/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>
	
	@interface MapDetailViewController : UIViewController <UIScrollViewDelegate>
	{
		@private
		UIView *myContentView;
		CGPDFDocumentRef myDocumentRef;
		CGPDFPageRef myPageRef;
		NSString *pdf;
		UIImage *image;
	}
	
@property (nonatomic, retain) NSString *pdf ;
@property (nonatomic, retain) UIImage *image ;
	@end
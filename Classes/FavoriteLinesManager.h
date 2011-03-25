//
//  FavoriteLinesManager.h
//  rideOnTime
//
//  Created by Nabil Mouzannar on 11/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabAppDelegate.h"
#import "CustomPickerDataSource.h"

@class TabAppDelegate;

@interface FavoriteLinesManager : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource> {
	TabAppDelegate *appDelegate;
	UIPickerView		*myPickerView;	
	UIPickerView		*customPickerView;
	CustomPickerDataSource *customPickerDataSource;
	
	NSMutableArray *temp; //temp to hold the uilabels of all liens in the favorite list
}

@property (nonatomic, retain) UIPickerView *myPickerView;

@property (nonatomic, retain) UIPickerView *customPickerView;
@property (nonatomic, retain) CustomPickerDataSource *customPickerDataSource;

@property (nonatomic, retain) NSMutableArray *temp;

- (NSInteger) getPickerRowSelected;
- (void)createCustomPicker;
@end

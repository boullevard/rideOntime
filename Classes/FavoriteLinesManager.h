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

@interface FavoriteLinesManager : UIViewController{
    
	TabAppDelegate *appDelegate;	
	NSMutableArray *temp; //temp to hold the uilabels of all liens in the favorite list
}


@property (strong, nonatomic) UIPickerView *myPickerView;
@property (nonatomic, strong) CustomPickerDataSource *customPickerDataSource;

@property (nonatomic, retain) NSMutableArray *temp;


@end

//
//  CustomCell.h
//  Custom_Table
//
//  Created by Nabil Mouzannar on 6/20/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomCell : UITableViewCell {
	IBOutlet UILabel *mName, *mOperatingSystem;
}

@property (nonatomic, retain) IBOutlet UILabel *mName, *mOperatingSystem;

@end

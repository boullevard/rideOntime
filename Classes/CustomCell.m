//
//  CustomCell.m
//  Custom_Table
//
//  Created by Nabil Mouzannar on 6/20/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "CustomCell.h"


@implementation CustomCell
@synthesize mName, mOperatingSystem;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    [super dealloc];
}


@end

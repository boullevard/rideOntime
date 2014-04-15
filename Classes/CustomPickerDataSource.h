/*
	
 Copyright (C) 2009 Apple Inc. All Rights Reserved.
 
 */

@interface CustomPickerDataSource : NSObject <UIPickerViewDataSource, UIPickerViewDelegate>
{
	NSArray	*customPickerArray;
	int rowSelected;
}

@property (nonatomic, retain) NSArray *customPickerArray;


- (void) setRowSelected: (NSInteger) row;
- (NSInteger) getRowSelected;
@end

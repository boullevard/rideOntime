//
//  SimpleTiledScrollExampleViewController.h
//  SimpleTiledScrollExample
//
//  Created by Hamish Allan on 04/08/2009.
//  Copyright Olive Toast 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleTiledScrollExampleViewController : UIViewController <UIScrollViewDelegate>
{
    UIView *myContentView;
    CGPDFDocumentRef myDocumentRef;
    CGPDFPageRef myPageRef;
}

@end


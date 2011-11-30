//
//  MapsViewController.m
//  rideOnTime
//
//  Abstract: View controller to manage a scrollview that displays a zoomable image.

//  Created by Nabil Mouzannar on 7/30/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//

#import "MapsViewController.h"
#import "FlurryAnalytics.h"

#define ZOOM_VIEW_TAG 100
#define ZOOM_STEP 2

#define AUTOSCROLL_THRESHOLD 30

@interface MapsViewController (ViewHandlingMethods)

- (void)pickImageNamed:(NSString *)name;
- (NSArray *)imageNames;

@end

@interface MapsViewController (AutoscrollingMethods)
- (void)autoscrollTimerFired:(NSTimer *)timer;
- (void)legalizeAutoscrollDistance;
- (float)autoscrollDistanceForProximityToEdge:(float)proximity;
@end

@interface MapsViewController (UtilityMethods)
- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;
@end


@implementation MapsViewController

- (void)loadView {
    [super loadView];
    CGRect webFrame = [[self view] bounds];
	webFrame.origin.y = 0;//kTopMargin + 5.0;	// leave from the URL input field and its label
	webFrame.size.height -= 40.0;
    imageScrollView = [[UIScrollView alloc] initWithFrame:webFrame];
	imageScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth; //to show all the map in landscape mode
  
	[imageScrollView setBackgroundColor:[UIColor whiteColor]];
    [imageScrollView setDelegate:self];
    [imageScrollView setBouncesZoom:YES];
	//[imageScrollView setMaximumZoomScale: 2];
    [[self view] addSubview:imageScrollView];
    
    [self pickImageNamed:@"subwaymap250"];
	NSLog(@"1 MapsViewController loadView ");
	
}
/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	NSLog(@"************ MAps Flurry : view viewWillAppear");
[FlurryAnalytics logEvent:@"MapsViewController"];
}
 */

- (void)dealloc {
    [imageScrollView release];
    [super dealloc];
}

- (void)refreshDataApplicationDidBecomeActive
{
	NSLog(@"Do Nothing");
}

#pragma mark UIScrollViewDelegate methods

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    UIView *view = nil;
    if (scrollView == imageScrollView) {
        view = [imageScrollView viewWithTag:ZOOM_VIEW_TAG];
    }
    return view;
}

/************************************** NOTE **************************************/
/* The following delegate method works around a known bug in zoomToRect:animated: */
/* In the next release after 3.0 this workaround will no longer be necessary      */
/**********************************************************************************/
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(float)scale {
    [scrollView setZoomScale:scale+0.01 animated:NO];
    [scrollView setZoomScale:scale animated:NO];
}

#pragma mark TapDetectingImageViewDelegate methods

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotSingleTapAtPoint:(CGPoint)tapPoint {
    // Single tap shows or hides drawer of thumbnails.
    //[self toggleThumbView];
}

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotDoubleTapAtPoint:(CGPoint)tapPoint {
    // double tap zooms in
    float newScale = [imageScrollView zoomScale] * ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:tapPoint];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}

- (void)tapDetectingImageView:(TapDetectingImageView *)view gotTwoFingerTapAtPoint:(CGPoint)tapPoint {
    // two-finger tap zooms out
    float newScale = [imageScrollView zoomScale] / ZOOM_STEP;
    CGRect zoomRect = [self zoomRectForScale:newScale withCenter:tapPoint];
    [imageScrollView zoomToRect:zoomRect animated:YES];
}



- (void)pickImageNamed:(NSString *)name {
	
    // first remove previous image view, if any
    [[imageScrollView viewWithTag:ZOOM_VIEW_TAG] removeFromSuperview];
	
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%@.png", name]];
    TapDetectingImageView *zoomView = [[TapDetectingImageView alloc] initWithImage:image];
    [zoomView setDelegate:self];
    [zoomView setTag:ZOOM_VIEW_TAG];
    [imageScrollView addSubview:zoomView];
    [imageScrollView setContentSize:[zoomView frame].size];
    [zoomView release];
	
    // choose minimum scale so image width fits screen
    float minScale  = ([imageScrollView frame].size.width  / [zoomView frame].size.width) +.1;//nabil added .1 to zoom it a little
	//NSLog(@"minScale %f ", minScale);
    [imageScrollView setMinimumZoomScale:minScale];
    [imageScrollView setZoomScale:minScale];
    [imageScrollView setContentOffset:CGPointZero];
}

- (NSArray *)imageNames {
    
    // the filenames are stored in a plist in the app bundle, so create array by reading this plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
    NSData *plistData = [NSData dataWithContentsOfFile:path];
    NSString *error; NSPropertyListFormat format;
    NSArray *imageNames = [NSPropertyListSerialization propertyListFromData:plistData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:&format
                                                           errorDescription:&error];
    if (!imageNames) {
        NSLog(@"Failed to read image names. Error: %@", error);
        [error release];
    }
    
    return imageNames;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Support all orientations except upside-down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark Utility methods

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center {
    
    CGRect zoomRect;
    
    // the zoom rect is in the content view's coordinates. 
    //    At a zoom scale of 1.0, it would be the size of the imageScrollView's bounds.
    //    As the zoom scale decreases, so more content is visible, the size of the rect grows.
    zoomRect.size.height = [imageScrollView frame].size.height / scale;
    zoomRect.size.width  = [imageScrollView frame].size.width  / scale;
    
    // choose an origin so as to get the right center.
    zoomRect.origin.x    = center.x - (zoomRect.size.width  / 2.0);
    zoomRect.origin.y    = center.y - (zoomRect.size.height / 2.0);
    
    return zoomRect;
}

@end

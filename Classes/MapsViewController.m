//
//  MapsViewController.m
//  rideOnTime
//
//  Abstract: View controller to manage a scrollview that displays a zoomable image.

//  Created by Nabil Mouzannar on 7/30/10.
//  Copyright 2014 Nabil Mouzannar. All rights reserved.
//

#import "MapsViewController.h"
#import "Flurry.h"

@interface MapsViewController ()

@end


@interface MapsViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView* scrollView;

@end

@implementation MapsViewController

NSMutableArray *spreadImageNames;

UIView *imageContainerView;
bool  isZoomed = NO;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupScrollContent];
    [self setupTouchEvents];
    [Flurry logEvent:@"MapsViewController"];
}


#pragma mark - Utility Methods

- (void)setupScrollContent {
    
   // self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-40)];
    
    CGFloat scrollWidth = self.view.bounds.size.width+168;
    imageContainerView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, scrollWidth, self.scrollView.frame.size.height)];
    
    CGFloat maxHeight = 0.0;
    UIImage *subwayImage;
    
    subwayImage = [UIImage imageNamed:@"subwaymap250.png"];
    
    CGFloat scale = scrollWidth / subwayImage.size.width;
    UIImageView *atImageView = [[UIImageView alloc]
                                initWithImage:subwayImage];
    
    CGFloat newHeight = (atImageView.bounds.size.height * scale);
    
    atImageView.frame = CGRectMake(0, 0.0, scrollWidth, newHeight);
    
    if (newHeight > maxHeight) {
        maxHeight = newHeight;
    }
    
    [imageContainerView addSubview:atImageView];
    
    
    CGRect newFrame = imageContainerView.frame;
    newFrame.size.height = maxHeight;
    imageContainerView.frame = newFrame;
    
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 8.0;
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:imageContainerView];
    self.scrollView.contentSize = imageContainerView.bounds.size;
}

-(void) setupTouchEvents
{
    
    
    UITapGestureRecognizer *doubleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewDoubleTapped:)];
    doubleTapRecognizer.numberOfTapsRequired = 2;
    doubleTapRecognizer.numberOfTouchesRequired = 1;
    [self.scrollView addGestureRecognizer:doubleTapRecognizer];
    
    
}

- (void)scrollViewDoubleTapped:(UITapGestureRecognizer *)recognizer
{
    if (isZoomed)
    {
        [self zoomOut];
    }else
    {
        [self zoomIn:recognizer];
    }
}

- (void)zoomIn: (UITapGestureRecognizer *)recognizer
{
    // Get the location within the image view where we tapped
    CGPoint pointInView = [recognizer locationInView:imageContainerView];
    
    CGFloat newZoomScale = self.scrollView.maximumZoomScale; //maximumZoomScale is set to 8 in storyboard
    
    // Figure out the rect we want to zoom to, then zoom to it
    CGSize scrollViewSize = self.scrollView.bounds.size;
    
    CGFloat w = scrollViewSize.width / newZoomScale;
    CGFloat h = scrollViewSize.height / newZoomScale;
    CGFloat x = pointInView.x - (w / 2.0f);
    CGFloat y = pointInView.y - (h / 2.0f);
    
    CGRect rectToZoomTo = CGRectMake(x, y, w, h);
    
    [self.scrollView zoomToRect:rectToZoomTo animated:YES];
    isZoomed = YES;
}

- (void)zoomOut
{
    if (self.scrollView.zoomScale >= self.scrollView.maximumZoomScale)
    {
        [self.scrollView setZoomScale:self.scrollView.minimumZoomScale animated:YES];
    }
    isZoomed = NO;
}


#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return imageContainerView;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
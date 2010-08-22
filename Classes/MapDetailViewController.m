//
//  MapDetailViewController.m
//  rideOnTime
//
//  Created by Nabil Mouzannar on 8/3/10.
//  Copyright 2010 Estee Lauder Companies Online. All rights reserved.
//


#import <QuartzCore/QuartzCore.h>

#import "MapDetailViewController.h"

@implementation MapDetailViewController

@synthesize image;

- (void)dealloc
{
    [myContentView release], myContentView = nil;
  //  CGPDFDocumentRelease(myDocumentRef), myDocumentRef = NULL;
   // myPageRef = NULL;
    [image release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	//  myDocumentRef = CGPDFDocumentCreateWithURL((CFURLRef)[NSURL URLWithString:@"http://www.tfl.gov.uk/assets/downloads/standard-tube-map.pdf"]);
	//  myPageRef = CGPDFDocumentGetPage(myDocumentRef, 1);
	
	// You do not need to and must not autorelease [NSBundle mainBundle]
/*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"subwaymap" ofType:@"png"]; 
    NSData *data = [NSData dataWithContentsOfFile:path];
    image = [UIImage imageWithData:data];
*/	
/**/	
	CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("subwaymapInPdf.pdf"), NULL, NULL);//manbus.pdf"
	myDocumentRef = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	myPageRef = CGPDFDocumentGetPage(myDocumentRef, 1);

	CGRect pageRect = CGRectIntegral(CGPDFPageGetBoxRect(myPageRef, kCGPDFMediaBox));

	//  CGRect pageRect = CGRectMake(0,  0,  1456, 1756);
	
	
    CATiledLayer *tiledLayer = [CATiledLayer layer];
    tiledLayer.delegate = self;
    tiledLayer.tileSize = CGSizeMake(1024, 1024);
    tiledLayer.levelsOfDetail = 6;
    tiledLayer.levelsOfDetailBias = 5;
     tiledLayer.frame = pageRect;
	//tiledLayer.transform = CATransform3DMakeScale(1, -1, 1.0f);

    myContentView = [[UIView alloc] initWithFrame:pageRect];
    [myContentView.layer addSublayer:tiledLayer];
	
    CGRect viewFrame = self.view.frame;
    viewFrame.origin = CGPointZero;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
    scrollView.delegate = self;
    scrollView.contentSize = pageRect.size;
    scrollView.maximumZoomScale = 5;
    [scrollView addSubview:myContentView];

    [self.view addSubview:scrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return myContentView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
}

-(void)drawRect:(CGRect)r
{
    // UIView uses the existence of -drawRect: to determine if should allow its CALayer
    // to be invalidated, which would then lead to the layer creating a backing store and
    // -drawLayer:inContext: being called.
    // By implementing an empty -drawRect: method, we allow UIKit to continue to implement
    // this logic, while doing our real drawing work inside of -drawLayer:inContext:
}
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{

    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(ctx, CGContextGetClipBoundingBox(ctx));
    CGContextTranslateCTM(ctx, 0.0, layer.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextConcatCTM(ctx, CGPDFPageGetDrawingTransform(myPageRef, kCGPDFCropBox, layer.bounds, 0, true));
    CGContextDrawPDFPage(ctx, myPageRef);

	/*
	NSString *path = [[NSBundle mainBundle] pathForResource:@"subwaymap" ofType:@"png"]; 
    NSData *data = [NSData dataWithContentsOfFile:path];
    image = [UIImage imageWithData:data];
	
    CGRect imageRect = CGRectMake (0.0, 0.0, image.size.width, image.size.height);
    CGContextDrawImage (ctx, imageRect, [image CGImage]);
	
	NSLog(@"\ndrawLayer:inContext:");
	NSLog(@"ctm = %@", NSStringFromCGAffineTransform(CGContextGetCTM(ctx)));
	NSLog(@"box = %@\n", NSStringFromCGRect(CGContextGetClipBoundingBox(ctx)));
	//CGContextDrawPDFPage(ctx, self.map);
	*/
}

@end

//
//  SimpleTiledScrollExampleViewController.m
//  SimpleTiledScrollExample
//
//  Created by Hamish Allan on 04/08/2009.
//  Copyright Olive Toast 2009. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "SimpleTiledScrollExampleViewController.h"

@implementation SimpleTiledScrollExampleViewController

- (void)dealloc
{
    [myContentView release], myContentView = nil;
    CGPDFDocumentRelease(myDocumentRef), myDocumentRef = NULL;
    myPageRef = NULL;
    
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

  //  myDocumentRef = CGPDFDocumentCreateWithURL((CFURLRef)[NSURL URLWithString:@"http://www.tfl.gov.uk/assets/downloads/standard-tube-map.pdf"]);
  //  myPageRef = CGPDFDocumentGetPage(myDocumentRef, 1);


	 CFURLRef pdfURL = CFBundleCopyResourceURL(CFBundleGetMainBundle(), CFSTR("subwaymapInPdf.pdf"), NULL, NULL);//manbus.pdf"
	 myDocumentRef = CGPDFDocumentCreateWithURL((CFURLRef)pdfURL);
	 myPageRef = CGPDFDocumentGetPage(myDocumentRef, 1);

	
	CGRect pageRect = CGRectIntegral(CGPDFPageGetBoxRect(myPageRef, kCGPDFMediaBox));

    CATiledLayer *tiledLayer = [CATiledLayer layer];
    tiledLayer.delegate = self;
    tiledLayer.tileSize = CGSizeMake(512.0, 512.0);
    tiledLayer.levelsOfDetail = 100;
    tiledLayer.levelsOfDetailBias = 100;
    tiledLayer.frame = pageRect;
    
    myContentView = [[UIView alloc] initWithFrame:pageRect];
    [myContentView.layer addSublayer:tiledLayer];

    CGRect viewFrame = self.view.frame;
    viewFrame.origin = CGPointZero;
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:viewFrame];
    scrollView.delegate = self;
    scrollView.contentSize = pageRect.size;
    scrollView.maximumZoomScale = 1000;
    [scrollView addSubview:myContentView];
	

    [self.view addSubview:scrollView];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return myContentView;
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetRGBFillColor(ctx, 1.0, 1.0, 1.0, 1.0);
    CGContextFillRect(ctx, CGContextGetClipBoundingBox(ctx));
    CGContextTranslateCTM(ctx, 0.0, layer.bounds.size.height);
    CGContextScaleCTM(ctx, 1.0, -1.0);
    CGContextConcatCTM(ctx, CGPDFPageGetDrawingTransform(myPageRef, kCGPDFCropBox, layer.bounds, 0, true));
    CGContextDrawPDFPage(ctx, myPageRef);
}

@end

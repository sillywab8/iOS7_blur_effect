//
//  ViewController.m
//  BlurrBackgroundEffectTest
//
//  Created by Mervyn B. Sharaf on 11/12/13.
//  Copyright (c) 2013 cwazywab8. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    CGFloat blurValue;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myImageView.image=[UIImage imageNamed:@"_MG_7035.jpg"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)blurImage{
    CIContext *blurContext = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"_MG_7035.jpg"]];
    CIFilter *blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
    
    [blurFilter setDefaults];
    [blurFilter setValue:inputImage forKey:@"inputImage"];
    [blurFilter setValue:[NSNumber numberWithFloat:blurValue] forKey:@"inputRadius"];
    
    CIImage *outputImage = [blurFilter valueForKey:@"outputImage"];
    CGImageRef cgImage = [blurContext createCGImage:outputImage fromRect:inputImage.extent];
    self.myImageView.image = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
}

- (IBAction)blurButtonPressed:(id)sender {
    blurValue+=10;
    [self blurImage];
    self.currentBlurValue.text=[NSString stringWithFormat:@"%02.0f",blurValue];
}

- (IBAction)resetButtonPressed:(id)sender {
    self.currentBlurValue.text=@"0";
    blurValue=0;
    self.myImageView.image=[UIImage imageNamed:@"_MG_7035.jpg"];
}
@end

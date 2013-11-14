//
//  ViewController.h
//  BlurrBackgroundEffectTest
//
//  Created by Mervyn B. Sharaf on 11/12/13.
//  Copyright (c) 2013 cwazywab8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@property (weak, nonatomic) IBOutlet UILabel *currentBlurValue;
- (IBAction)blurButtonPressed:(id)sender;
- (IBAction)resetButtonPressed:(id)sender;
@end

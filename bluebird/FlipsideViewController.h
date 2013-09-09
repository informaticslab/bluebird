//
//  FlipsideViewController.h
//  bluebird
//
//  Created by jtq6 on 8/27/13.
//  Copyright (c) 2013 Informatics Research and Development Lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FlipsideViewController;

@protocol FlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(FlipsideViewController *)controller;
@end

@interface FlipsideViewController : UIViewController

@property (weak, nonatomic) id <FlipsideViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *labelVersionInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelBuildInfo;

- (IBAction)done:(id)sender;

@end

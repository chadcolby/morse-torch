//
//  FKAReceiveMessageViewController.h
//  startMorseProject
//
//  Created by Chad D Colby on 2/12/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FKAAppDelegate.h"

@interface FKAReceiveMessageViewController : UIViewController

@property (nonatomic, strong) CFMagicEvents *cfMagicEvent;
@property (nonatomic) BOOL isDetected;

- (IBAction)receivedButtonPressed:(id)sender;
- (IBAction)stopButtonPressed:(id)sender;

@end

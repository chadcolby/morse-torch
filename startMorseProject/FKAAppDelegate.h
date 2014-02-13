//
//  FKAAppDelegate.h
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CFMagicEvents.h"

@interface FKAAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CFMagicEvents *cfMagicEvents;

@end

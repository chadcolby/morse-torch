//
//  FKATorchController.h
//  startMorseProject
//
//  Created by Chad D Colby on 1/21/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FKATorchController : NSObject

@property (nonatomic) int timeInterval;


- (void)dashFlash;
- (void)dotFlash;
- (void)pauseAfterWord;
- (void)pauseAfterSymbol;

@end

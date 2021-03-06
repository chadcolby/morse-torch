//
//  FKATorchController.m
//  startMorseProject
//
//  Created by Chad D Colby on 1/21/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKATorchController.h"
#import <AVFoundation/AVFoundation.h>
#import "ProgressHUD.h"

@implementation FKATorchController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.timeInterval = 100000;
    }
    
    return self;
}


- (void)dashFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([device hasTorch] && [device hasFlash]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        usleep(self.timeInterval * 3);
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

- (void)dotFlash
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([device hasTorch] && [device hasFlash]) {
        [device lockForConfiguration:nil];
        [device setTorchMode:AVCaptureTorchModeOn];
        usleep(self.timeInterval);
        
        [device setTorchMode:AVCaptureTorchModeOff];
        [device unlockForConfiguration];
    }
}

- (void)pauseAfterWord
{
    usleep(self.timeInterval * 5);

}

- (void)pauseAfterSymbol
{
    usleep(_timeInterval);

}

- (void)startHUD:(NSString *)string
{
    [ProgressHUD show: string];
}

- (void)endHUD
{
    [ProgressHUD dismiss];
}
@end

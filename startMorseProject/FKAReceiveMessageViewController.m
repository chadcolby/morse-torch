//
//  FKAReceiveMessageViewController.m
//  startMorseProject
//
//  Created by Chad D Colby on 2/12/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKAReceiveMessageViewController.h"

@interface FKAReceiveMessageViewController ()

//@property (weak, nonatomic) IBOutlet UIButton *startButton;
//@property (weak, nonatomic) IBOutlet UIButton *stopButton;

@end

@implementation FKAReceiveMessageViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cfMagicEvent = [[CFMagicEvents alloc]init];

    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventDetected:) name:@"onMagicEventDetected" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(detectedLux:) name:@"isDetecting" object:nil];

    self.isDetected = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self.cfMagicEvent stopCapture];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void)receiveOnMagicEventDetected:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"dark");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"isDetecting" object:self];
        self.isDetected = YES;
    });
}

- (void)receiveOnMagicEventNotDetected:(NSNotification *)notification
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"light");
    });
}

- (void)detectedLux:(NSNotification *)notification
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lux Detected" message:@"" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil];
    
    [alert show];
    
    [self.cfMagicEvent stopCapture];
}

- (IBAction)receivedButtonPressed:(id)sender
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveOnMagicEventNotDetected:) name:@"onMagicEventNotDetected" object:nil];
    
    [self.cfMagicEvent startCapture];
    
    
}

- (IBAction)stopButtonPressed:(id)sender {
    
    [self.cfMagicEvent stopCapture];
}
@end

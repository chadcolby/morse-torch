//
//  FKAViewController.h
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProgressHUD.h"


@interface FKAViewController : UIViewController

@property (strong, nonatomic) NSDictionary *morseCodeDict;
@property (strong, nonatomic) NSString *enteredMessage;
@property (strong, nonatomic) NSArray *codedArray;
@property (strong, nonatomic) NSOperationQueue *sendCodeQueue;
@property (strong, nonatomic) NSMutableArray *lettersArrayForHUD;

@property (weak, nonatomic) IBOutlet UITextField *textEntered;

- (IBAction)sendButtonPressed:(id)sender;
- (IBAction)cancelButtonPressed:(id)sender;

@end

//
//  FKAViewController.h
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FKAViewController : UIViewController

@property (strong, nonatomic) NSDictionary *morseCodeDict;
@property (strong, nonatomic) NSString *enteredMessage;

@property (weak, nonatomic) IBOutlet UITextField *textEntered;

- (IBAction)doneButtonPressed:(id)sender;


@end

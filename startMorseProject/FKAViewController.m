//
//  FKAViewController.m
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKAViewController.h"
#import "NSString+MorseCode.h"
#import "FKATorchController.h"

@interface FKAViewController ()

@property (strong, nonatomic) FKATorchController *torchController;

@end

@implementation FKAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.codedArray = [[NSArray alloc] init];
    self.enteredMessage = [[NSString alloc] init];
    self.torchController = [[FKATorchController alloc] init];
  
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - IBActions

- (IBAction)sendButtonPressed:(id)sender {
   
    NSString *noSpaces = [[NSString alloc] init];
    //NSArray *codedArray = [[NSArray alloc] init];
    
    
    if (self.textEntered.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Crap!"
                                                       message:@"Please enter a message to send."
                                                      delegate:self
                                             cancelButtonTitle:@"Okay"
                                             otherButtonTitles: nil];
        [alert show];
    } else {
    
    _enteredMessage = self.textEntered.text;
        NSLog(@"They entered: %@", _enteredMessage);
    noSpaces = [NSString enteredStringWithOutSpaces:self.enteredMessage];
    self.codedArray = [NSString morseCodeFromArray:noSpaces];
    
        for (NSString *string in _codedArray) {
           
            for (int i = 0; i < string.length; i++) {
            
                if ([string isEqualToString:@"."] ) {
                
                    [_torchController dotFlash];
                    //[_torchController pauseAfterSymbol];
              
                } else {
                
                    [_torchController dashFlash];
                    //[_torchController pauseAfterSymbol];
                    
                        }
                [_torchController pauseAfterSymbol];
            }
            [_torchController pauseAfterWord];
        }
       
        [self.textEntered resignFirstResponder];
    
    }

}


@end

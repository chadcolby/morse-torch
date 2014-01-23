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

    _codedArray = [[NSArray alloc] init];
    _enteredMessage = [[NSString alloc] init];
    _torchController = [[FKATorchController alloc] init];
    _sendCodeQueue =[NSOperationQueue new];
    [_sendCodeQueue setMaxConcurrentOperationCount:1];
    [_sendCodeQueue setName:@"com.bytemeetsworld.sendcodequeue"];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - IBActions

- (IBAction)sendButtonPressed:(id)sender {
   
    if (self.textEntered.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Crap!"
                                                       message:@"Please enter a message to send."
                                                      delegate:self
                                             cancelButtonTitle:@"Okay"
                                             otherButtonTitles: nil];
        [alert show];
        
    } else {
        
        [self sendCodeBlock:_textEntered.text];
      
        [self.textEntered resignFirstResponder];
    
    }

}

- (IBAction)cancelButtonPressed:(id)sender{
    
    NSLog(@"Cancel pushed.");
    //[_codeFromLetters cancel];
    [_sendCodeQueue cancelAllOperations];
}


#pragma mark - NSOperationQueue Methods

- (void)sendCodeBlock:(NSString *)string
{
    NSString *noSpaces = [[NSString alloc] init];
    _enteredMessage = string;
    
    noSpaces = [NSString enteredStringWithOutSpaces:_enteredMessage];
    _codedArray = [NSString morseCodeFromArray:noSpaces];
    
    for (NSString *string in _codedArray) {
        
        for (int i = 0; i < string.length; i++) {
            
            NSString *tempSymbol = [string substringWithRange:NSMakeRange(i, 1)];
        
           
                
                if ([tempSymbol isEqualToString:@"."] ) {
                    
                    [_sendCodeQueue addOperationWithBlock:^{
                        [_torchController dotFlash];
                        [_torchController pauseAfterSymbol];
                    }];
                } else if ([tempSymbol isEqualToString:@"-"]) {
                    [_sendCodeQueue addOperationWithBlock:^{
                        [_torchController dashFlash];
                        [_torchController pauseAfterSymbol];
                    }];
                } else {

                  }

                }
            [_sendCodeQueue addOperationWithBlock:^{
            [_torchController pauseAfterWord];
        }];
            }
    }

@end

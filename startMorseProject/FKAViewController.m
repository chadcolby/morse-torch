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
#import <ProgressHUD.h>
#import <MMProgressHUD.h>
#import <MMHud.h>



@interface FKAViewController ()

@property (strong, nonatomic) FKATorchController *torchController;
@property (strong, nonatomic) NSArray *arrayForHUD;
@property (strong, nonatomic) MMProgressHUD *hudToShow;

@end

@implementation FKAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.codedArray = [[NSArray alloc] init];
    self.enteredMessage = [[NSString alloc] init];
    self.torchController = [[FKATorchController alloc] init];
    self.sendCodeQueue =[NSOperationQueue new];
    [self.sendCodeQueue setMaxConcurrentOperationCount:1];
    [self.sendCodeQueue setName:@"com.bytemeetsworld.sendcodequeue"];
    self.lettersArrayForHUD = [[NSMutableArray alloc]init];
    [self.textEntered becomeFirstResponder];
    self.hudToShow = [MMProgressHUD sharedHUD];
    
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
        NSString *notSpaced = [[NSString alloc] init];
        
        notSpaced = [NSString enteredStringWithOutSpaces: _textEntered.text];
        self.arrayForHUD = [self arrayFromString:notSpaced];
                for (int j = 0; j < notSpaced.length; j++) {
                    NSLog(@"%@", self.arrayForHUD);
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        usleep(500000);
                        [self showLetterDuringSending:j FromString:notSpaced];

                    }];
                }
        self.arrayForHUD = [self arrayFromString:notSpaced];
    }
}

- (IBAction)cancelButtonPressed:(id)sender{
    
    NSLog(@"Cancel pushed.");
    //[_codeFromLetters cancel];
    [_sendCodeQueue cancelAllOperations];
    [self.textEntered resignFirstResponder];
    [ProgressHUD dismiss];
}


#pragma mark - NSOperationQueue Methods

- (void)sendCodeBlock:(NSString *)string
{
    NSString *noSpaces = [[NSString alloc] init];
    
    noSpaces = [NSString enteredStringWithOutSpaces: string];
    NSLog(@"text: %@", self.textEntered.text);
    
    self.arrayForHUD = [self arrayFromString:noSpaces];
    _codedArray = [NSString morseCodeFromArray:noSpaces];
    
    
    for (NSString *string in _codedArray) {
        
        NSLog(@"string %@", string);
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

#pragma mark - Helper Methods

- (NSArray *)arrayFromString:(NSString *)stirng
{
    NSMutableArray *holderArrayFromString = [[NSMutableArray alloc] init];
    for (int j = 0; j < stirng.length; j++) {
        NSString *tempString = [stirng substringWithRange:NSMakeRange(j, 1)];
        [holderArrayFromString addObject:[tempString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        
    }
    
    return holderArrayFromString;
}

- (void)letterToDisplayinHUB:(NSArray *)arrayToConvert
{
    for (NSString *string in arrayToConvert) {
        [ProgressHUD show:string];

    }
    
}

- (void)showLetterDuringSending:(NSInteger)number FromString:(NSString *)string
{

    [ProgressHUD showSuccess:[string substringWithRange:NSMakeRange(number, 1)]];

}
@end

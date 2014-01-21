//
//  FKAViewController.m
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "FKAViewController.h"
#import "NSString+MorseCode.h"

@interface FKAViewController ()

@end

@implementation FKAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.enteredMessage = [[NSString alloc]init];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - IBActions

- (IBAction)sendButtonPressed:(id)sender {
   
    NSString *noSpaces = [[NSString alloc]init];
    
    
    
    _enteredMessage = self.textEntered.text;
    
    noSpaces = [NSString enteredStringWithOutSpaces:self.enteredMessage];

    [NSString morseCodeFromArray:noSpaces];
    
    [self.textEntered resignFirstResponder];
}



@end

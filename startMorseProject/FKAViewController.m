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
    self.morseCodeDict = [NSString loadMorseDict];
    self.enteredMessage = [[NSString alloc]init];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - IBActions

- (IBAction)doneButtonPressed:(id)sender {
   
    NSString *noSpaces = [[NSString alloc]init];
    NSArray *tempArray = [[NSMutableArray alloc]init];
    NSMutableArray *holderArray = [[NSMutableArray alloc]init];
    
    self.enteredMessage = self.textEntered.text;
   
    NSLog(@"%@", self.enteredMessage);
    
    
    noSpaces = [NSString enteredStringWithOutSpaces:self.enteredMessage];
    noSpaces = [noSpaces uppercaseString];
    
    tempArray = [NSString arrayFromNoSpaceString:noSpaces];
    NSLog(@"%@", tempArray);
    NSString *tempSymbol = [[NSString alloc]init];
    
    for (int i = 1; i < [tempArray count]; i++) {
       
        NSString *tempKey = [tempArray objectAtIndex:i];
        
        tempSymbol = [self.morseCodeDict objectForKey:tempKey];
       
        [holderArray addObject:tempSymbol];
    }
    
    NSLog(@"%@", holderArray);
    [self.textEntered resignFirstResponder];
}



@end

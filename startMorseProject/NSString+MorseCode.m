//
//  NSString+MorseCode.m
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import "NSString+MorseCode.h"

@implementation NSString (MorseCode)

+ (NSDictionary *)loadMorseDict
{
    NSDictionary *morseCodeDict =  [NSDictionary dictionaryWithObjectsAndKeys:@".-", @"A", @"-...", @"B", @"-.-.", @"C", @"-..", @"D", @".", @"E", @"..-.", @"F", @"--.", @"G", @"....", @"H", @"..", @"I", @".---", @"J", @"-.-", @"K", @".-..", @"L", @"--", @"M", @"-.", @"N", @"---", @"O", @".--.", @"P", @"--.-", @"Q", @".-.", @"R", @"...",@"S", @"-", @"T", @"..-", @"U", @"...-", @"V", @".--", @"W", @"-..-", @"X", @"-.--", @"Y", @"--..", @"Z", @".----", @"1", @"..---", @"2", @"...--", @"3", @"....-", @"4", @".....", @"5", @"-....", @"6", @"--...", @"7", @"---..", @"8", @"----.", @"9", @"-----", @"0", nil];
    
    return morseCodeDict;
}


+ (NSString *)enteredStringWithOutSpaces:(NSString *)string
{
    NSString *newString = [[NSString alloc]init];
    newString = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString = [newString uppercaseString];
    return newString;
}

+ (NSArray *)arrayFromNoSpaceString:(NSString *) string
{
    NSMutableArray *tempArray = [[NSMutableArray alloc]init];
    
    for (int i = 0 ; i < string.length; i++) {
        NSString *tempString = [string substringWithRange:NSMakeRange(i, 1)];
        [tempArray addObject:[tempString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    
    return [NSArray arrayWithArray:tempArray];
}

+ (NSArray *)morseCodeFromArray:(NSString *)sting
{
    NSArray *tempArray = [[NSMutableArray alloc]init];
    NSMutableArray *holderArray = [[NSMutableArray alloc]init];
    NSString *tempSymbol = [[NSString alloc]init];
    NSDictionary *tempDict = [NSString loadMorseDict];
    
    tempArray = [NSString arrayFromNoSpaceString:sting];
    
    
    
    for (int i = 0; i < [tempArray count]; i++) {
        
        NSString *tempKey = [tempArray objectAtIndex:i];
        
        if ([tempDict objectForKey:tempKey] == nil) {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Crap!"
                                                           message:@"Message cannot include symbols."
                                                          delegate:self
                                                 cancelButtonTitle:@"Okay"
                                                 otherButtonTitles: nil];
            [alert show];
            [holderArray removeAllObjects];
            break;
            
        } else {
            tempSymbol = [tempDict objectForKey:tempKey];
            [holderArray addObject:tempSymbol];
        }
    }
    
    NSLog(@"%@", holderArray);
    return holderArray;
}



@end

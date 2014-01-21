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
    NSDictionary *morseCodeDict =  [NSDictionary dictionaryWithObjectsAndKeys:@".-", @"A", @"-...", @"B", @"-.-.", @"C", @"-..", @"D", @".", @"E", @"..-.", @"F", @"--.", @"G", @"....", @"H", @"..", @"I", @".---", @"J", @"-.-", @"K", @".-..", @"L", @"--", @"M", @"-.", @"N", @"---", @"O", @".--.", @"P", @"--.-", @"Q", @".-.", @"R", @"...",@"S", @"-", @"T", @"..-", @"U", @"...-", @"V", @".--", @"W", @"-..-", @"X", @"-.--", @"Y", @"--..", @"Z",nil];
    
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

+ (void)morseCodeFromArray:(NSString *)sting
{
    NSArray *tempArray = [[NSMutableArray alloc]init];
    NSMutableArray *holderArray = [[NSMutableArray alloc]init];
    NSString *tempSymbol = [[NSString alloc]init];
    NSDictionary *tempDict = [NSString loadMorseDict];
    
    tempArray = [NSString arrayFromNoSpaceString:sting];
    for (int i = 0; i < [tempArray count]; i++) {
        
        NSString *tempKey = [tempArray objectAtIndex:i];
        
        tempSymbol = [tempDict objectForKey:tempKey];
        [holderArray addObject:tempSymbol];
    }
    
    NSLog(@"%@", holderArray);
}

@end

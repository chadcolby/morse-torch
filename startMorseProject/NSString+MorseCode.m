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


//- (NSArray *)symbolsForString
//{
//    NSMutableArray *tempArray = [NSMutableArray new];
//    NSString *noSpaces = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
//    
//    for (int i = 0; i < noSpaces.length ; i++) {
//    
//        [tempArray addObject:[self symbolForLetter:[noSpaces substringWithRange:NSMakeRange(i, 1)]]];
//    }
//
//    return [NSArray arrayWithArray:tempArray];
//}
//
//- (NSString *)symbolForLetter: (NSString *)letter
//{
//    if ([letter rangeOfString:@" "].length == NSNotFound) {
//        letter = [letter uppercaseString];
//        return letter;
//    } else {
//        return @"no white space, please";
//    }
//    letter = [letter uppercaseString];
//    letter = [letter stringByReplacingOccurrencesOfString:@" " withString:@""];
//    
//    return letter;
//}
@end

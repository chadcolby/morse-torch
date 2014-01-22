//
//  NSString+MorseCode.h
//  startMorseProject
//
//  Created by Chad D Colby on 1/20/14.
//  Copyright (c) 2014 kramerica. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MorseCode)

+ (NSDictionary *)loadMorseDict;
+ (NSString *)enteredStringWithOutSpaces:(NSString *)string;
+ (NSArray *)arrayFromNoSpaceString:(NSString *) string;
+ (NSArray *)morseCodeFromArray:(NSString *)sting;


@end

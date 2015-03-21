//
//  PlayingCard.m
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/18/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//
#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

- (NSString* ) contents
{
    // PlayingCard and slef can be switched?
    // when rankingStrings is +, you can use PlayingCard
    // otherwise, you have to use self when rankingStrings is -.
    NSArray *rankStrings = [PlayingCard rankingStrings];
    return [ rankStrings [self.rank] stringByAppendingString:self.suit ];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuites ] containsObject: suit] ) {
        _suit = suit;
    }
    
}

- (NSString* ) suit
{
    return _suit? _suit : @"?";
}

- (void) setRank:(NSUInteger)rank
{
    if ( rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

+ (NSArray *) validSuites
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

+ (NSArray *) rankingStrings
{
    // @ make a string object
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank
{
    return [[self rankingStrings] count ] - 1;
}

@end

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

- (int) match : (NSArray *) otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if ([self.suit isEqualToString:otherCard.suit]) {
            score += 1;
        } else if (self.rank == otherCard.rank) {
            score += 4;
        }
    }
    
    return score;
}


// getContents method inherited from parent class Card
// overwrite the method contents
- (NSString* ) contents
{
    // PlayingCard and slef can be switched?
    // when rankingStrings is +, you can use PlayingCard
    // otherwise, you have to use self when rankingStrings is -.
    NSArray *rankStrings = [PlayingCard rankingStrings];
    return [ rankStrings [self.rank] stringByAppendingString:self.suit ];
}

// @property (strong, nonatomic) NSString *suit
// void setSuite(NSString suit)
- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits ] containsObject: suit] ) {
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

// public methods

// NSArray* validSuits() return NSArray;
+ (NSArray *) validSuits
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

// NSArray* rankingStrings(); return NSArray;
+ (NSArray *) rankingStrings
{
    // @ make a string object
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6",
             @"7", @"8", @"9", @"10", @"J",@"Q",@"K"];
}

// NSUInteger maxRank() return NSUInteger
+ (NSUInteger) maxRank
{
    return [[self rankingStrings] count ] - 1;
}

@end

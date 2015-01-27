//
//  Card.m
//  cs193p-winter-20qe-hw0
//
//  Created by gongzhen on 1/17/15.
//  Copyright (c) 2015 gongzhen. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card

@synthesize chosen = _chosen;
@synthesize matched = _matched;

- ( int ) match:(NSArray *) otherCards
{
    int score = 0;
    
    // card match any of other cards, you get one point
    for (Card *card in otherCards) {
        
        if ( [card.contents isEqualToString: self.contents] ) {
            score = 1;
        }
    }
    
    return score;
}

@end

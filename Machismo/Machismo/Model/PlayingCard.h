//
//  PlayingCard.h
//  Hello world
//
//  Created by 爽 张 on 16/1/10.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property(nonatomic, strong) NSString* suit;
@property(nonatomic) NSUInteger rank;

+(NSArray*) validSuit;
+(NSUInteger) maxRank;

@end

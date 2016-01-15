//
//  Card.h
//  Hello world
//
//  Created by 爽 张 on 16/1/9.
//  Copyright © 2016年 爽 张. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property(strong, nonatomic) NSString* contents;
@property(nonatomic, getter=isChosen) bool chosen;
@property(nonatomic, getter=isMatched) bool matched;

- (int) match:(NSArray*)otherCards;
@end

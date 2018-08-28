//
//  GLAlgorithmManager.m
//  AlgorithmSegment
//
//  Created by 林界 on 2018/8/28.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import "GLAlgorithmManager.h"

@implementation GLAlgorithmManager

/*
击鼓传花

@param array 传入的数组
@param number 指定的数字
@return 返回所在的位置
*/
+ (NSInteger)playGameArray:(NSArray *) array flagNumber:(NSInteger)number {
    NSMutableArray *tempArray = [NSMutableArray arrayWithArray:array];
    while (tempArray.count > 1) {
        for (NSInteger i = 0; i < number; i++) {
            //  获取最前面的数据
            @autoreleasepool {
                NSObject *firstObject = tempArray.firstObject;
                [tempArray removeObjectAtIndex:0];
                [tempArray addObject:firstObject];
            }
        }
        [tempArray removeObjectAtIndex:0];
    }
    return [array indexOfObject:tempArray.firstObject];
}

@end

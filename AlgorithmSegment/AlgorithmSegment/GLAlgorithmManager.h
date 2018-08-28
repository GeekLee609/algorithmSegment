//
//  GLAlgorithmManager.h
//  AlgorithmSegment
//
//  Created by 林界 on 2018/8/28.
//  Copyright © 2018年 GeekLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GLAlgorithmManager : NSObject


/*
 击鼓传花
 
 @param array 传入的数组
 @param number 指定的数字
 @return 返回所在的位置
 */
+ (NSInteger)playGameArray:(NSArray *) array flagNumber:(NSInteger)number;

@end

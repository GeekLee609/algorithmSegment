//
//  Algorithm_Sort.h
//  Algorithm_Array
//
//  Created by GrowingIO on 2019/9/29.
//  Copyright © 2019 GrowingIO. All rights reserved.
//  排序算法

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Algorithm_Sort : NSObject

//冒泡排序
+ (NSArray *)bubbleSortWithArray:(NSArray *)originArray;

//插入排序
+ (NSArray *)inserSortWithArray:(NSArray *)originArray;

//选择排序
+ (NSArray *)selectSortWithArray:(NSArray *)originArray;


@end

NS_ASSUME_NONNULL_END

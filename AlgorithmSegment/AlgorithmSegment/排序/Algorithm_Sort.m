//
//  Algorithm_Sort.m
//  Algorithm_Array
//
//  Created by GrowingIO on 2019/9/29.
//  Copyright © 2019 GrowingIO. All rights reserved.
//

#import "Algorithm_Sort.h"

@implementation Algorithm_Sort

+ (NSArray *)bubbleSortWithArray:(NSArray *)originArray {
    
    if (!originArray || !originArray.count) {
        return nil;
    }
    
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:originArray];
    //默认存储的都是数字,稳定排除，时间复杂度是 O(n^2)，原地排序，控件复杂度是 O(1)
    for (NSInteger i = 0; i < muArray.count; ++i) {
        
        for (NSInteger j = 0; j < muArray.count - i - 1; ++j) {
            
            NSString *first = muArray[j];
            NSString *second = muArray[j+1];
            
            NSInteger firstNum = first.integerValue;
            NSInteger secNum = second.integerValue;
            
            if (firstNum < secNum) {
                //交互2个数的位置
                [muArray replaceObjectAtIndex:j withObject:second];
                [muArray replaceObjectAtIndex:(j+1) withObject:first];
            }
        }
    }
    return muArray.copy;
}

+ (NSArray *)inserSortWithArray:(NSArray *)originArray {
    
    if (!originArray || !originArray.count) {
        return nil;
    }
    //临时数组
    NSMutableArray *tempArray = [NSMutableArray array];
    [tempArray addObject:originArray.firstObject];
    //前面是排序好的，依次查找后面的数据，插入到前面已经排序好的数组中
    for (NSInteger i = 1; i < originArray.count; ++i) {
        
        NSString *insertString = originArray[i];
        NSInteger insertNum = insertString.integerValue;
        
        //遍历排序好的数组,从小到大排序
        for (NSInteger j = 0; j < tempArray.count; ++j) {
            
            NSString *sortString = tempArray[j];
            NSInteger sortNum = sortString.integerValue;
            //判断该插入的位置
            if (sortNum > insertNum) {
                //插入sortNum所在的位置
                [tempArray insertObject:insertString atIndex:j];
                break;
            }
            //如果插入的是最大数
            if (j == tempArray.count - 1) {
                 [tempArray addObject:insertString];
                 break;
            }
        }
    }
    return tempArray.copy;
}


//  选择排序，每一次遍历找到最大的数，时间复杂度是O(n^2),此处用到了空间复杂度O(n)以及2个临时变量
+ (NSArray *)selectSortWithArray:(NSArray *)originArray {
    
    if (!originArray || !originArray.count) {
        return nil;
    }
    
    //临时数组
    NSMutableArray *muArray = [NSMutableArray arrayWithArray:originArray];
    NSString *maxString;
    NSInteger maxIndex;
    for (NSInteger i = 0; i < muArray.count; ++i) {
        maxString = muArray[i];
        maxIndex = i;
        // 从找出一个最大的数
        for (NSInteger j = i+1; j < muArray.count; ++j) {
            
            NSString *selectString = muArray[j];
            NSInteger selectNum = selectString.integerValue;
            if (selectNum > maxString.integerValue) {
               //  记录位置
                maxString = selectString;
                maxIndex = j;
            }
        }
        //  每一次遍历找到的最大数，并且交换位置
        [muArray replaceObjectAtIndex:maxIndex withObject:muArray[i]];
        [muArray replaceObjectAtIndex:i withObject:maxString];
    }
    return muArray.copy;
}


@end

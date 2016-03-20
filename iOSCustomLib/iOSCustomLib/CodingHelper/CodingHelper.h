//
//  CodingHelper.h
//  iOSCustomLib
//
//  Created by wanghao on 16/3/20.
//  Copyright © 2016年 wanghao. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  归档帮助类
 */
@interface CodingHelper : NSObject


/**
 *  获取归档类
 *
 *  @param codingFileName 归档文件名
 *  @param encoderkey    对应归档的key
 *
 *  @return 归档类
 */
+ (NSObject *)getCodingDataWithCodeFileName:(NSString *)codingFileName EncoderKey:(NSString *)encoderkey;

/**
 *  保存归档类
 *
 *  @param object        需要保存的归档来
 *  @param codingFileName 归档文件名
 *  @param encoderkey    归档key
 */
+ (void)saveCodingData:(NSObject<NSCoding> *)object CoingFileName:(NSString *)codingFileName EncoderKey:(NSString *)encoderkey;


@end

//
//  CodingHelper.m
//  iOSCustomLib
//
//  Created by wanghao on 16/3/20.
//  Copyright © 2016年 wanghao. All rights reserved.
//

#import "CodingHelper.h"

// 归档主目录文件夹名
#define coderfoldername @"codingPath"

@implementation CodingHelper


+ (NSString *)getCodingPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *codingPath = [documentsDirectory stringByAppendingPathComponent:coderfoldername];
    if (![[NSFileManager defaultManager] fileExistsAtPath:codingPath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:codingPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    return codingPath;
}

/**
 *  根据归档文件名获取归档信息
 *
 *  @param fileName 归档文件名
 *
 *  @return 归档文件全路径
 */
+ (NSString *)getCodinhFileNamePathWithFileName:(NSString *)fileName;
{
    return [[[self class] getCodingPath] stringByAppendingPathComponent:fileName];
}

+ (NSObject *)getCodingDataWithCodeFileName:(NSString *)codingFileName EncoderKey:(NSString *)encoderkey
{
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[[self class] getCodinhFileNamePathWithFileName:codingFileName]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSObject *object = [unarchiver decodeObjectForKey:encoderkey];
    return object;
}

+ (void)saveCodingData:(NSObject<NSCoding> *)object CoingFileName:(NSString *)codingFileName EncoderKey:(NSString *)encoderkey
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:object forKey:encoderkey];
    [archiver finishEncoding];
    [data writeToFile:[[self class] getCodinhFileNamePathWithFileName:codingFileName] atomically:YES];
}

@end

//
//  SHButton.m
//  Boli
//
//  Created by 姜柏任 on 2025/7/11.
//

#import "SHButton.h"
#import "Boli-Swift.h"

@implementation SHButton

+(void)initialize {
    [super initialize];
    [SHButton setCellClass: SHButtonCell.class];
}

- (NSSize)minimumSizeWithPrioritizedCompressionOptions:(NSArray<NSUserInterfaceCompressionOptions *> *)prioritizedOptions {
    NSSize size = [super minimumSizeWithPrioritizedCompressionOptions:prioritizedOptions];
    return NSMakeSize(MAX(size.width, 20.0), MAX(size.height, 20.0));
}

@end

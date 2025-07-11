//
//  SHButton.m
//  Hydrobolic
//
//  This file subclasses NSButton in order to use our own subclassed ButtonCell.
//

#import "SHButton.h"
#import "Hydrobolic-Swift.h"

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

//
//  Mark.h
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarkVisitor.h"

NS_ASSUME_NONNULL_BEGIN

@protocol Mark <NSObject>

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) id<Mark> lastChild;

- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSInteger)index;

- (void)acceptMarkVisitor:(id<MarkVisitor>)visitor;

- (void)drawWithContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END

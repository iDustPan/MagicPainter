//
//  MarkVisitor.h
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/7.
//  Copyright © 2020 pan. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Dot, Vertex, Stroke;
@protocol Mark;

NS_ASSUME_NONNULL_BEGIN

@protocol MarkVisitor <NSObject>

- (void)visitMark:(id<Mark>)mark;
- (void)visitDot:(Dot *)dot;
- (void)visitVertex:(Vertex *)vertext;
- (void)visitStroke:(Stroke *)stroke;

@end

NS_ASSUME_NONNULL_END

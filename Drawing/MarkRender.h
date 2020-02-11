//
//  MarkRender.h
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/7.
//  Copyright © 2020 pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MarkVisitor.h"
#import "Dot.h"
#import "Vertex.h"
#import "Stroke.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkRender : NSObject<MarkVisitor>

- (instancetype)initWithCGContext:(CGContextRef)context;

@end

NS_ASSUME_NONNULL_END

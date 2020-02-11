//
//  Vertex.h
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface Vertex : NSObject<Mark>

- (instancetype)initWithLocation:(CGPoint)location;

@end

NS_ASSUME_NONNULL_END

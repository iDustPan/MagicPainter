//
//  CanvasView.h
//  Drawing
//
//  Created by borderxlab_pan on 2020/2/6.
//  Copyright © 2020 pan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface CanvasView : UIView

@property (nonatomic, strong) id<Mark> mark;

@end

NS_ASSUME_NONNULL_END

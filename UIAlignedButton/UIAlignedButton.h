//
//  UIAlignedButton.h
//  UIAlignedButton
//
//  Created by Ivan Cabezon on 17/11/14.
//  Copyright (c) 2014 Ivan Cabezon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImagePosition) {
	Top,
	Right,
	Bottom,
	Left
};

IB_DESIGNABLE

@interface UIAlignedButton : UIButton

@property (nonatomic, assign) IBInspectable NSUInteger spacing;
@property (nonatomic, assign) IBInspectable NSInteger imagePosition;
@property (nonatomic, assign) IBInspectable NSInteger cornerRadius;
@property (nonatomic) IBInspectable BOOL fillFrame;
@property (nonatomic) IBInspectable BOOL customBackground;

@end

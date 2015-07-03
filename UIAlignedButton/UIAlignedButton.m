//
//  UIAlignedButton.m
//  UIAlignedButton
//
//  Created by Ivan Cabezon on 17/11/14.
//  Copyright (c) 2014 Ivan Cabezon. All rights reserved.
//

#import "UIAlignedButton.h"

@interface UIAlignedButton ()

@property (nonatomic,strong) CAGradientLayer *gradientLayer;

@end


@implementation UIAlignedButton

#pragma mark - Personalizing methods
- (void)setCustomBackground:(BOOL)customBackground
{
	_customBackground = customBackground;
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
	if (self.spacing == 0)
	{
		self.spacing = 2;
	}
	
	if (self.customBackground)
	{
		[self.gradientLayer removeFromSuperlayer];
		self.gradientLayer = nil;
		self.layer.borderColor = [UIColor colorWithRed:0.563 green:0.546 blue:0.547 alpha:1.000].CGColor;
		
		if (self.enabled)
		{
			self.gradientLayer = [self gradient];
			self.layer.borderWidth = 0;
		}
		else
		{
			self.layer.borderWidth = 2;
		}
		
		if (self.gradientLayer) {
			self.gradientLayer.frame = self.layer.bounds;
			self.gradientLayer.cornerRadius = self.layer.cornerRadius;
			[self.layer insertSublayer:self.gradientLayer atIndex:0];
		}
	}
	
	CGSize imageSize = self.imageView.frame.size;
	CGSize titleSize = [self.titleLabel.text sizeWithAttributes:@{
																  NSFontAttributeName:self.titleLabel.font
																  }];
	
	CGFloat contentHeight = (imageSize.height + titleSize.height + self.spacing);
	CGFloat contentWidth = (imageSize.width + titleSize.width + self.spacing);
	
	switch (self.imagePosition)
	{
		case Top:
		{
			CGFloat yPositionImage = self.bounds.size.height/2 - contentHeight/2;
			CGFloat yPositionTitle = yPositionImage + imageSize.height + self.spacing;
			
			if (self.fillFrame)
			{
				yPositionImage = self.spacing;
				yPositionTitle = self.bounds.size.height - self.spacing - titleSize.height;
			}
			
			[self.imageView setFrame:CGRectMake(self.bounds.size.width/2 - imageSize.width/2,
												yPositionImage,
												imageSize.width,
												imageSize.height)];
			
			[self.titleLabel setFrame:CGRectMake(self.bounds.size.width/2 - titleSize.width/2,
												 yPositionTitle,
												 titleSize.width,
												 titleSize.height)];
			break;
		}
		case Right:
		{
			CGFloat xPositionImage = self.bounds.size.width/2 + (contentWidth/2 - imageSize.width);
			CGFloat xPositionTitle = self.bounds.size.width/2 - contentWidth/2;
			
			if (self.fillFrame)
			{
				xPositionImage = self.bounds.size.width - self.spacing - imageSize.width;
				xPositionTitle = self.spacing;
			}
			
			
			[self.imageView setFrame:CGRectMake(xPositionImage,
												self.imageView.frame.origin.y,
												imageSize.width,
												imageSize.height)];
			[self.titleLabel setFrame:CGRectMake(xPositionTitle,
												 self.titleLabel.frame.origin.y,
												 titleSize.width,
												 titleSize.height)];
			break;
		}
		case Bottom:
		{
			CGFloat yPositionTitle = self.bounds.size.height/2 - contentHeight/2;
			CGFloat yPositionImage = yPositionTitle + titleSize.height + self.spacing;
			
			if (self.fillFrame)
			{
				yPositionTitle = self.spacing;
				yPositionImage = self.bounds.size.height - self.spacing - imageSize.height;
			}
			
			[self.titleLabel setFrame:CGRectMake(self.bounds.size.width/2 - titleSize.width/2,
												 yPositionTitle,
												 titleSize.width,
												 titleSize.height)];
			
			[self.imageView setFrame:CGRectMake(self.bounds.size.width/2 - imageSize.width/2,
												yPositionImage,
												imageSize.width,
												imageSize.height)];
			break;
		}
		case Left:
		{
			if (self.fillFrame)
			{
				[self.imageView setFrame:CGRectMake(self.spacing,
													self.imageView.frame.origin.y,
													imageSize.width,
													imageSize.height)];
				[self.titleLabel setFrame:CGRectMake(self.bounds.size.width - self.spacing - titleSize.width,
													 self.titleLabel.frame.origin.y,
													 titleSize.width,
													 titleSize.height)];
			}
			break;
		}
		default:
			break;
	}
}


- (void)setCornerRadius:(NSInteger)cornerRadius
{
	self.layer.cornerRadius = cornerRadius;
	[self setClipsToBounds:YES];
}


- (CAGradientLayer *)gradient
{
	UIColor *colorOne = [UIColor colorWithRed:0.138 green:0.136 blue:0.198 alpha:1.000];
	UIColor *colorTwo = [UIColor colorWithRed:0.109 green:0.110 blue:0.160 alpha:1.000];
	
	NSArray *colors =  [NSArray arrayWithObjects:(id)colorOne.CGColor, colorTwo.CGColor,nil];
	
	NSNumber *stopOne = [NSNumber numberWithFloat:0.0];
	NSNumber *stopTwo = [NSNumber numberWithFloat:1.0];
	
	NSArray *locations = [NSArray arrayWithObjects:stopOne, stopTwo, nil];
	CAGradientLayer *headerLayer = [CAGradientLayer layer];
	headerLayer.colors = colors;
	headerLayer.locations = locations;
	
	return headerLayer;
}


@end
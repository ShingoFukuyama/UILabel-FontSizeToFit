//
//  UILabel+FontSizeFit.m
//  UILabel_FontSizeToFitObjC
//
//  Created by FukuyamaShingo on 2/22/16.
//  Copyright © 2016 FukuyamaShingo. All rights reserved.
//

#import "UILabel+FontSizeToFit.h"

@implementation UILabel (FontSizeToFit)

- (void)fontSizeToFit
{
    [self fontSizeToFitWithMinimumFontScale:0.2f diminishRate:0.5f];
}

- (void)fontSizeToFitWithMinimumFontScale:(CGFloat)minimumFontScale diminishRate:(CGFloat)diminishRate
{
    NSString *text = self.text;
    if (!text || text.length == 0) {
        return;
    }
    CGSize size = self.frame.size;
    NSString *fontName = self.font.fontName;
    CGFloat fontSize = self.font.pointSize;
    CGFloat minimumFontSize = fontSize * minimumFontScale;
    
    CGSize area;
    UIFont *font;
    CGFloat fs = fontSize;
    __block NSMutableDictionary *newAttributes;
    [self.attributedText enumerateAttributesInRange:NSMakeRange(0, self.attributedText.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:
     ^(NSDictionary *attributes, NSRange range, BOOL *stop) {
         newAttributes = [attributes mutableCopy];
    }];
    if (!newAttributes) {
        return;
    }
    while (1) {
        font = [UIFont fontWithName:fontName size:fs];
        newAttributes[NSFontAttributeName] = font;
        area = [text boundingRectWithSize:CGSizeMake(size.width, CGFLOAT_MAX)
                                  options:NSStringDrawingUsesLineFragmentOrigin
                               attributes:newAttributes
                                  context:nil].size;
        if (area.height <= size.height) {
            break;
        }
        
        if (fs == minimumFontSize) {
            break;
        }
        
        fs -= diminishRate;
        if (fs < minimumFontSize) {
            fs = minimumFontSize;
        }
    }
    self.font = font;
}

@end

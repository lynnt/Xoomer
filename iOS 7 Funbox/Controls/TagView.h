//
//  TagView.h
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "FXBlurView.h"
#import "DataModel.h"

@interface TagView : FXBlurView

@property (nonatomic) Tag *tag;

- (void)sizeToFit;

@end

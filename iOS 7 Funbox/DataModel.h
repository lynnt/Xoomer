//
//  DataModel.h
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GalleryItem : NSObject
@property (nonatomic) UIImage *image;
@property (nonatomic) NSString *title;
@property (nonatomic) NSString *description;
@end

@interface PieGraph : NSObject
@property (nonatomic) NSDictionary *data;
@property (nonatomic) NSString *primary;
@end

@interface Tag : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *description;
@property (nonatomic) UIImage *thumbnail;
@property (nonatomic) NSArray *items;
@property (nonatomic) CGPoint position;

@end

@interface Scene : NSObject
@property (nonatomic) UIImage *backgroundImage;
@property (nonatomic) NSArray *tags;
+ (Scene *)Canada;
@end
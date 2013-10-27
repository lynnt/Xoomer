//
//  DataModel.m
//  iOS 7 Funbox
//
//  Created by Nanyi Jiang on 10/26/2013.
//  Copyright (c) 2013 Nanyi Jiang. All rights reserved.
//

#import "DataModel.h"


@implementation Tag



@end

@implementation GalleryItem



@end

@implementation PieGraph



@end

@implementation Scene
+ (Scene *)Canada {
    static Scene *canada;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        canada = [[Scene alloc] init];
        
        canada.backgroundImage = [UIImage imageNamed:@"hitman"];
        
        Tag *Ontario = [[Tag alloc] init];
        
        GalleryItem *pic1 = [[GalleryItem alloc] init];
        pic1.title = @"Waterloo";
        pic1.description = @"A university town in Ontario";
        pic1.image = [UIImage imageNamed:@"scene"];
        
        Ontario.title = @"ONTARIO";
        Ontario.description = @"Yours to discover";
        Ontario.items = @[pic1];
        Ontario.position = CGPointMake(300, 300);
        
        canada.tags = @[Ontario];
        
    });
    return canada;
}


@end


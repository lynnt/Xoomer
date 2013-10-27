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
        
        canada.backgroundImage = [UIImage imageNamed:@"map"];
        
        Tag *Ontario = [[Tag alloc] init];
        
        GalleryItem *pic1 = [[GalleryItem alloc] init];
        pic1.title = @"Waterloo";
        pic1.description = @"A university town in Ontario";
        pic1.image = [UIImage imageNamed:@"waterloo.png"];
        
        GalleryItem *pic2 = [[GalleryItem alloc] init];
        pic2.title = @"Ottawa";
        pic2.description = @"The longest skating rink";
        pic2.image = [UIImage imageNamed:@"ottawa.png"];
        
        GalleryItem *pic3 = [[GalleryItem alloc] init];
        pic3.title = @"test";
        pic3.description = @"Random text here";
        pic3.image = [UIImage imageNamed:@"1.png"];
        
        GalleryItem *pic4 = [[GalleryItem alloc] init];
        pic4.title = @"Fall";
        pic4.description = @"Fall in Ontario";
        pic4.image = [UIImage imageNamed:@"2.png"];
        
        GalleryItem *pic5 = [[GalleryItem alloc] init];
        pic5.title = @"Fall";
        pic5.description = @"Fall in Ontario";
        pic5.image = [UIImage imageNamed:@"3.png"];
        
        GalleryItem *pic6 = [[GalleryItem alloc] init];
        pic6.title = @"Fall";
        pic6.description = @"Fall in Ontario";
        pic6.image = [UIImage imageNamed:@"4.png"];
        
        GalleryItem *pic7 = [[GalleryItem alloc] init];
        pic7.title = @"Fall";
        pic7.description = @"Fall in Ontario";
        pic7.image = [UIImage imageNamed:@"5.png"];
        
        GalleryItem *pic8 = [[GalleryItem alloc] init];
        pic8.title = @"Fall";
        pic8.description = @"Fall in Ontario";
        pic8.image = [UIImage imageNamed:@"6.png"];
        
        PieGraph *graph = [[PieGraph alloc] init];
        graph.primary = @"ONTARIO";
        graph.data = @{@"ONTARIO": @0.3873,
                       @"OTHERS": @0.6127};
        
        Ontario.title = @"ONTARIO";
        Ontario.description = @"Yours to discover";
        
        Ontario.items = @[pic1, pic2, pic3, pic4, pic5, pic6, pic7, pic8,graph];
        Ontario.position = CGPointMake(600, 762);
        Ontario.quotes = @[@"ROB FORD", @"Toronto's NHL Team",@"Maple Leafs", @"Toronto", @"Blue Jays", @"Waterloo"];
        
        Tag *BritishColumbia = [[Tag alloc] init];
        
        GalleryItem *BcPic1 = [[GalleryItem alloc] init];
        BcPic1.title = @"Surrey";
        BcPic1.description = @"Morning view in Surrey";
        BcPic1.image = [UIImage imageNamed:@"surrey"];
        
        GalleryItem *BcPic2 = [[GalleryItem alloc] init];
        BcPic2.title = @"Park";
        BcPic2.description = @"Pacific Rim Nation Park";
        BcPic2.image = [UIImage imageNamed:@"park"];
        
        GalleryItem *BcPic3 = [[GalleryItem alloc] init];
        BcPic3.title = @"BcPic3";
        BcPic3.description = @"Pic1";
        BcPic3.image = [UIImage imageNamed:@"b1"];
        
        GalleryItem *BcPic4 = [[GalleryItem alloc] init];
        BcPic4.title = @"BcPic4";
        BcPic4.description = @"4";
        BcPic4.image = [UIImage imageNamed:@"b2"];
        
        GalleryItem *BcPic5 = [[GalleryItem alloc] init];
        BcPic5.title = @"BcPic5";
        BcPic5.description = @"5";
        BcPic5.image = [UIImage imageNamed:@"b3"];
        
        GalleryItem *BcPic6 = [[GalleryItem alloc] init];
        BcPic6.title = @"6";
        BcPic6.description = @"6";
        BcPic6.image = [UIImage imageNamed:@"b4"];
        
        GalleryItem *BcPic7 = [[GalleryItem alloc] init];
        BcPic7.title = @"BcPic7";
        BcPic7.description = @"Demo";
        BcPic7.image = [UIImage imageNamed:@"b5"];
        
        GalleryItem *BcPic8 = [[GalleryItem alloc] init];
        BcPic8.title = @"BcPic3";
        BcPic8.description = @"Demo";
        BcPic8.image = [UIImage imageNamed:@"b6"];
        
        
        PieGraph *BCgraph = [[PieGraph alloc] init];
        BCgraph.primary = @"BRITISH COLUMBIA";
        BCgraph.data = @{@"BRITISH COLUMBIA": @0.1261,
                       @"OTHERS": @0.8739};
        
        BritishColumbia.description = @"MOST BEAUTIFUL PLACE ON EARTH";
        BritishColumbia.title = @"BRITISH COLUMBIA";
        BritishColumbia.items = @[BcPic1, BcPic2, BcPic3, BcPic4, BcPic5, BcPic6, BcPic7, BcPic8, BCgraph];
        BritishColumbia.position = CGPointMake(174, 644);
        BritishColumbia.quotes = @[@"CANUCKS",@"VANCOUVER",@"WHISTLER",@"SNOWBOARDING",@"WINTER OLYMPIC",@"STEVE NASH",@"A THINKING APE",@"BANFF",@"ERIC HAMBER",@"UBC",@"SIMON FRASER"];
        
        Tag *Alberta = [[Tag alloc] init];
        Alberta.position = CGPointMake(296, 640);
        Alberta.title = @"Alberta";
        Alberta.description = @"The primary supply and service hub for Canada's crude oil and also oil sands";
        
		Tag *Sask = [[Tag alloc] init];
        Sask.position = CGPointMake(398, 722);
        Sask.title = @"Sask";
        Sask.description = @"A prairie province in Canada";
        
        Tag *Manitoba = [[Tag alloc] init];
        Manitoba.position = CGPointMake(508, 690);
        Manitoba.title = @"Manitoba";
        Manitoba.description = @"A largely continental climate";
        
        Tag *Quebec = [[Tag alloc] init];
        Quebec.position = CGPointMake(836, 650);
        Quebec.title = @"Quebec";
        Quebec.description = @"Canada's largest province by area";
        
        Tag *Newfoundland = [[Tag alloc] init];
        Newfoundland.position = CGPointMake(1000, 612);
        Newfoundland.title = @"Newfoundland";
        Newfoundland.description = @"A large Canadian island off the east coast of the North American mainland";
        
  		Tag *NovaScotia = [[Tag alloc] init];
        NovaScotia.position = CGPointMake(1030, 804);
        NovaScotia.title = @"Its provincial capital is Halifax. Nova Scotia is the second-smallest province in Canada";
        NovaScotia.description = @"COLD";
        
		Tag *NewBrunswick = [[Tag alloc] init];
        NewBrunswick.position = CGPointMake(966, 780);
        NewBrunswick.title = @"NewBrunswick";
        NewBrunswick.description = @"One of Canada's three Maritime provinces";
        
		Tag *Nunavut = [[Tag alloc] init];
        Nunavut.position = CGPointMake(666, 494);
        Nunavut.title = @"Nunavut";
        Nunavut.description = @"The largest, northernmost and newest territory of Canada";
        
        Tag *Yukon = [[Tag alloc] init];
        Yukon.position = CGPointMake(154, 415);
        Yukon.title = @"YUKON";
        
        canada.tags = @[Ontario, BritishColumbia, Yukon, Alberta, Sask, Manitoba, Quebec, Newfoundland, NewBrunswick, NovaScotia, Nunavut];
    });
    return canada;
}
@end


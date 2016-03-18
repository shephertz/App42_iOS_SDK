//
//  App42InAppConstants.h
//  App42IAMSample
//
//  Created by Rajeev Ranjan on 02/01/15.
//  Copyright (c) 2015 Rajeev Ranjan. All rights reserved.
//

#ifndef App42IAMSample_App42InAppConstants_h
#define App42IAMSample_App42InAppConstants_h

typedef enum : NSUInteger {
    kApp42_Alert,
    kApp42_AlertConfirm,
    kApp42_PopUp,
    kApp42_Interstitial,
    kApp42_Survey,
    kApp42_Invite,
    kApp42_Custom,
    kApp42_None,
} App42IAMDialogueType;

typedef enum : NSUInteger {
    kApp42_Daily,
    kApp42_Weekly,
    kApp42_Monthly,
    kApp42_Yearly,
} App42IAMFrequencyType;

typedef enum : NSUInteger {
    kApp42_Facebook,
    kApp42_Twitter,
    kApp42_WhatsApp,
    kApp42_Mail,
} App42IAMChannelType;

typedef enum : NSUInteger {
    kApp42_Top,
    kApp42_Bottom,
    kApp42_Center
} App42IAMLayoutGravity;

typedef enum : NSUInteger {
    kApp42_CenterImage,
    kApp42_LeftImage,
    kApp42_RightImage,
    kApp42_NoImage
} App42IAMLayoutType;

typedef enum : NSUInteger {
    kApp42_Forever,
    kApp42_Manual,
    kApp42_Automate
} App42IAMLayoutCancelType;


/*** Config First Level Keys ***/
#define APP42IAM_PRIORITIES         @"priorities"
#define APP42IAM_CAMPAIGNS          @"campaigns"
#define APP42IAM_DOWNLOADS          @"downloads"
#define APP42IAM_CONFIG_VERSIION    @"version"
#define APP42IAM_VIRALITYPRIORITIES @"viralityPriorities"

    /*** APP42IAM_CAMPAIGNS Keys ***/
    #define APP42IAM_CAMPAIGN_NAME      @"campaignName"
    #define APP42IAM_STARTDATE          @"startDate"
    #define APP42IAM_ENDDATE            @"endDate"
    #define APP42IAM_INSTALLPROPS       @"installProperties"
    #define APP42IAM_SUPERPROPS         @"superProperties"
    #define APP42IAM_LOCATION           @"locations"
    #define APP42IAM_WHAT               @"what"
    #define APP42IAM_WHEN               @"when"
    #define APP42IAM_FREQUENCY          @"frequency"
    #define APP42IAM_COUPONCODE         @"couponCode"

#define APP42IAM_CONTENT            @"content"
#define APP42IAM_TYPE               @"type"
#define APP42IAM_NAME               @"name"
#define APP42IAM_ACTION             @"action"
#define APP42IAM_CANCEL             @"cancel"
#define APP42IAM_LAYOUT             @"layout"
#define APP42IAM_PROPERTIES         @"properties"
#define APP42IAM_OS                 @"os"
#define APP42IAM_EVENTS             @"events"
#define APP42IAM_VALUE              @"value"
#define APP42IAM_TEXT               @"text"
#define APP42IAM_ANSWERS            @"answers"
#define App42IAM_UNIT               @"unit"
#define App42IAM_REWARDRULES        @"rewardRules"
#define App42IAM_CHANNELS           @"channels"
#define App42IAM_URL                @"url"
#define App42IAM_SUBJECT            @"subject"
#define App42IAM_WHOMTYPE           @"whomType"
#define App42IAM_POINTS             @"points"
#define APP42IAM_COLOR              @"color"
#define APP42IAM_SIZE               @"size"
#define APP42IAM_STYLE              @"style"

#define App42IAM_REFERRER           @"referrer"
#define App42IAM_FRIEND             @"friend"
#define App42IAM_ALLUSER            @"allUser"

/*** CustomDialogue Keys ***/
#define APP42IAM_TITLETEXT          @"titleText"
#define APP42IAM_TITLE_COLOR        @"titleColor"
#define APP42IAM_MESSAGE            @"message"
#define APP42IAM_MESSAGE_COLOR      @"messageColor"
#define APP42IAM_BACKGROUND_COLOR   @"backgroundColor"
#define APP42IAM_BACKGROUND_IMAGE   @"backgroundImage"

#define APP42IAM_OK_BTNTEXT           @"okBtnText"
#define APP42IAM_CANCEL_BTNTEXT       @"cancelBtnText"
#define APP42IAM_BTN_BACKGROUNDCOLOR  @"btnBackgroundColor"
#define APP42IAM_BTN_TITLECOLOR       @"btnTitleColor"
#define APP42IAM_LAYOUTGRAVITY        @"layoutGravity"
#define APP42IAM_LAYOUTTYPE           @"layoutType"
#define APP42IAM_BACKCOLOR            @"backColor"
#define APP42IAM_ICONIMAGE            @"iconImage"
#define APP42IAM_MESSAGE1             @"message1"
#define APP42IAM_MESSAGE2             @"message2"
#define APP42IAM_MESSAGE3             @"message3"
#define APP42IAM_CROSSSTATUS          @"crossSatus"
#define APP42IAM_AUTOTIMEOUT          @"autoTimeOut"
#define APP42IAM_ROUNDEDCORNER        @"roundedCorners"
#define APP42IAM_CUSTOMTITLE          @"customTitle"

#define APP42IAM_IMAGENAME          @"imageName"
#define APP42IAM_IMAGEURL           @"imageURL"

/** LOCAL CACHE KEYS **/
#define APP42IAM_SUBSCRIBEDEVENTS       @"subscribedEvents"
#define APP42IAM_CONFIG_LASTCHANGED     @"app42_config_lastChanged"
#define APP42IAM_LASTAVAILABLE_CAMPS    @"app42_lastAvailable_campaigns"
#define APP42IAM_ELIGIBLITY_CHECKEDON   @"app42_eligiblity_checkedOn"
#define APP42IAM_IS_AVAILABLE           @"isAvailable"
#define APP42IAM_REFERRER_INFO          @"app42_referrer_info"

#define App42IAM_IS_FIRSTSESSION        @"app42_is_firstSession"

/**
 * Frequency types
 */
#define APP42IAM_DAILY      @"daily"
#define APP42IAM_WEEKLY     @"week"
#define APP42IAM_MONTHLY    @"month"
#define APP42IAM_YEARLY     @"year"

#define APP42IAM_CONFIG_EXPIRYTIME      24*60 //Default expiry time in mins

#define APP42IAM_COUNTRY    @"app42iam_country"
#define APP42IAM_CITY       @"app42iam_city"

#define DELETE_BUTTONIMAGE_URL @"http://apphype.shephertz.com/repo/ios/deleteIcon.png"
#define DELETE_BUTTON2XIMAGE_URL @"http://apphype.shephertz.com/repo/ios/deleteIcon@2x.png"
#define DELETEBUTTON @"deleteButton.png"
#define DELETEBUTTON2X @"deleteButton@2x.png"
/**
 * Custom dialogue layout type
 */
#define APP42IAM_LEFTIMAGE      @"leftimage"
#define APP42IAM_RIGHTIMAGE     @"rightimage"
#define APP42IAM_CENTERIMAGE    @"centerimage"
#define APP42IAM_NOIMAGE        @"noimage"

/**
 * Custom dialogue layout gravity
 */
#define APP42IAM_TOP      @"top"
#define APP42IAM_BOTTOM   @"bottom"
#define APP42IAM_CENTER   @"center"

/**
 * Custom dialogue layout cancel type i.e. Cross Status
 */
#define APP42IAM_FOREVER    @"forever"
#define APP42IAM_MANUAL     @"manual"
#define APP42IAM_AUTOMATE   @"automate"

/**
 * Actions to be performed
 */
#define APP42IAM_TRACKEVENT     @"trackevent"
#define APP42IAM_OPENURL        @"openurl"
#define APP42IAM_ABTEST         @"abtest"
#define APP42IAM_CUSTOMCODE     @"customcode"

/**
 * Radio Button Image
 */
#define APP42IAM_RADIOBUTTON_OFF    @"RadioButtonOff.png"
#define APP42IAM_RADIOBUTTON_ON     @"RadioButtonOn.png"
#define APP42IAM_RADIOBUTTON_OFF_URL    @"http://cdn.shephertz.com/repository/files/7aa2aa0863bfade24c975d5fef63594248b14887456a70d1c884da88aee42f81/a47b8aaa950b515c6a735224c3453e3538a9dfe2/RadioButtonOff.png"

#define APP42IAM_RADIOBUTTON_ON_URL     @"http://cdn.shephertz.com/repository/files/7aa2aa0863bfade24c975d5fef63594248b14887456a70d1c884da88aee42f81/307ceca6daa872d58bfd447781c09c25139b7f18/RadioButtonOn.png"

/**
 * Checkbox Button Image
 */

#define APP42IAM_CHECKBOX   @"CheckboxUnchecked.png"
#define APP42IAM_CHECKBOX_SELECTED  @"CheckboxChecked.png"
#define APP42IAM_CHECKBOX_URL   @"http://cdn.shephertz.com/repository/files/7aa2aa0863bfade24c975d5fef63594248b14887456a70d1c884da88aee42f81/00a67c4862dbb74a5d09c03515c532c69ce89db6/Checkbox.png"
#define APP42IAM_CHECKBOX_SELECTED_URL  @"http://cdn.shephertz.com/repository/files/7aa2aa0863bfade24c975d5fef63594248b14887456a70d1c884da88aee42f81/aab42afb1977d6a60cb3cae4460e2af2d5cf4180/CheckboxSelected.png"
#endif

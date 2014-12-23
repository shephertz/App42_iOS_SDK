* [Release Version 3.1.1](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-311)
* [Release Version 3.1](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-31)
* [Release Version 3.0](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-30)
* [Release Version 2.8.2](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-282)
* [Release Version 2.8.1](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-281)
* [Release Version 2.8](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-28)
* [Release Version 2.7](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-27)
* [Release Version 2.6](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-26)
* [Release Version 2.5](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-25)
* [Release Version 2.4](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-24)
* [Release Version 2.3](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-23)
* [Release Version 2.2](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-22)
* [Release Version 2.1.2](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-212)
* [Release Version 2.1.1](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-211)
* [Release Version 2.1](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-21)
* [Release Version 2.0](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-20)
* [Release Version 1.9](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-19)
* [Release Version 1.8](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-18)
* [Release Version 1.7](https://github.com/shephertz/App42_iOS_SDK/blob/master/Change%20Log.md#version-17)


## Version 3.1.1
 

**Release Date:** 23-12-2014

**Release Version:** 3.1.1

**Feature :** 

```
__App42 iOS AsyncAPI now supports Swift__
```

**This release contains the following bug fix:**
```
None
```
__Note:-__ The Synchronous APIs are deprecated and will be removed from the version 4.0 onwards.


## Version 3.1

**Release Date:** 16-12-2014

**Release Version:** 3.1

__Note:-__ We are releasing a separate framework with asynchronous APIs. The Synchronous APIs are deprecated now and will be removed from the framework version 4.0 onwards.

**The following features have been pushed to the services :**
```
-Async APIs
-Offline Storage and caching
```
**This release contains the following bug fix:**
```
None
```

## Version 3.0
 

**Release Date:** 28-10-2014

**Release Version:** 3.0
**The following Services have been pushed to the latest :**

```
EventService

```

**This release contains the following bug fix:**

```
None
```

## Version 2.8.2
 

**Release Date:** 03-10-2014

**Release Version:** 2.8.2


**This release contains the following bug fix:**

```
-iOS8 compatibility issue
```

## Version 2.8.1
 

**Release Date:** 06-08-2014

**Release Version:** 2.8.1


**The following features have been pushed to the services :**

**PUSH SERVICE**

```
deleteChannel
```

**This release contains the following bug fix:**

```
None
```


## Version 2.8
 

**Release Date:** 20-06-2014

**Release Version:** 2.8


**The following Services have been pushed to the latest :**

```
GiftService
TimerService

```

**This release contains the following bug fix:**

```
None
```

## Version 2.7
 

**Release Date:** 29-04-2014

**Release Version:** 2.7


**The following features have been pushed to the services :**

**GEO SERVICE**

```
getAllStorageByPaging
getAllPointsByPaging
deleteGeoPoints  

```

**PUSH SERVICE**

```
updatePushBadgeforDevice
updatePushBadgeforUser

```

**REVIEW SERVICE**

```
getAllReviewsByUser

```

**STORAGE SERVICE**

```
insertJSONDocumentWithAttachment
updateDocumentByQuery

```

**USER SERVICE**

```
createUserWithProfile
getUsersByGroup

```

**This release contains the following bug fix:**

```
None
```


## Version 2.6
 

**Release Date:** 14-04-2014

**Release Version:** 2.6


**The following features have been pushed to the services :**

**BUDDY SERVICE**

```
deleteMessageById
deleteMessageByIds
unFriend  

```

**This release contains the following bug fix:**

```
None
```

## Version 2.5
 

**Release Date:** 11-04-2014

**Release Version:** 2.5


**The following features have been pushed to the services :**

**PUSH SERVICE**

```
sendPushMessageToDevice

```

**This release contains the following bug fix:**

```
Fixed selectKeys bug
```


## Version 2.4
 

**Release Date:** 04-04-2014

**Release Version:** 2.4


**The following features have been pushed to the services :**

**SCOREBOARD SERVICE**

```
getUsersWithScoreRange

```

**This release contains the following bug fix:**

```
None
```



## Version 2.3
 

**Release Date:** 29-03-2014

**Release Version:** 2.3


**The following features have been pushed to the services :**

**PUSH SERVICE**

```
unsubscribeDeviceForUser
resubscribeDeviceForUser

```

**This release contains the following bug fix:**

```
None
```


## Version 2.2
 

**Release Date:** 26-03-2014

**Release Version:** 2.2

**The following features have been pushed  :**

```
+(void) setDbName:(NSString*) l_dbName;//Added to App42API
-(void) setQuery:(NSString*)_collectionName metaInfoQuery:(Query*) _metaInfoQuery;//Added to All Services
```

**The following features have been pushed to the services :**

**PUSH SERVICE**

```
deleteAllDevices

```

**STORAGE SERVICE**

```
addOrUpdateKeys
addAttachmentToDocs
```

**User SERVICE**

```
addUserInfo(Add Extra Information while creating user)
```

**SCOREBOARD SERVICE**

```
addCustomScore(Add Extra Information of user while saves score)
```

**REVIEW SERVICE**

```
getAllReviewsByUser
```


**This release contains the following bug fix:**

```
Bug Fix: editScoreValueById 
Bug Fix: throwing exception in case of wrong parameter like null, empty or no internet connection,request time-out etc.
```



## Version 2.1.2

**Release Date:** 06-03-2014

**Release Version:** 2.1.2

**This release contains the following bug fix:**

```
Fixed bug in BuddyService.
```



## Version 2.1.1

**Release Date:** 04-02-2014

**Release Version:** 2.1.1

**This release contains the following bug fix:**

```
Fixed bug in findDocumentsByLocation API of storage service
```


## Version 2.1

**Release Date:** 03-01-2014

**Release Version:** 2.1

**The following features have been pushed :**

```
Log uncaught exception
```


## Version 2.0

**Release Date:** 23-12-2013

**Release Version:** 2.0

**The following Services have been pushed to the latest :**

```
Avatar Service
Achievement Service
```

**This release contains the following bug fix:**

```
Update user profile bug fix
```

## Version 1.9

**Release Date:** 18-12-2013

**Release Version:** 1.9

**The following features have been pushed :**

```
Added Facebook profile access from scorelist
```

**This release contains the following bug fix:**

```
None
```


## Version 1.8

**Release Date:** 06-12-2013

**Release Version:** 1.8

**The following features have been pushed :**

```
setLoggedInUser
setCacheStoragePolicy
sendPushToTargetUsers
saveOrUpdateDocumentByKeyValue
getTopNRankersFromFacebook(including rankers in specified date range)
```

**This release contains the following bug fix:**

```
None
```

## Version 1.7

**Release Date:** 25-10-2013

**Release Version:** 1.7

**The following Services have been pushed to the latest :**

```
AB Test Service
```

**This release contains the following bug fix:**

```
None
```




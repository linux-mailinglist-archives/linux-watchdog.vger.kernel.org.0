Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58B9F3684D2
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Apr 2021 18:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236647AbhDVQ3X (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Apr 2021 12:29:23 -0400
Received: from mail-eopbgr40087.outbound.protection.outlook.com ([40.107.4.87]:39648
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236459AbhDVQ3T (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Apr 2021 12:29:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TcER+7yDg++NP4JssU/r5+ft4f5UKqx0gQrWpsAFWf+2SrIQ6pjoGbHDUs0LC48GQ7ds2LdCAQzIl+wI54L2UGuFZO3AGjM4i7H6sP7NEl1Rl0dARrosEKhFi+DvV4NXi4Ic3kNyOQQ7rlbY4piXt8Cy7NcWJmSMjxhU1p6gVQ0IPWTy5xPB4ouGZ7qMf0E58nxun8JPqKz2/Zec6esGFo4Y6CeKBLsVI/DSmOYLq3cZlwF+9aNE9jWT6E3CFgJGJoAKDdKTx/+brkp6UKaxf8aAYepDa1gYAYozLb/qAc8vPlL7VXfZdbUHkC7An1NWYE92lWjB2NPK4tRobI536A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6t8b1oX91iberN8HPxYNwM90rZ3VyT83A/oV0fkXBM=;
 b=iWNvgaU0uEY/R03otAp7VWaWhQbRcTyjeTcuNCgXqPeeYkgUyqcslbsPmV50DDOBX3Trsulcql+RQNkUnn0pq+5vic4WWAeVm3StdRUL5jKGz7g3Jr7vLpBfU16ZELKYrOrasb3LaC9dBgjrbyrsBkNoAvjA8JksYbmOycgcfG9/4RFNYJV3BDExEBCTNmN8Sj2lDMyU1F3cinNqKa53pPoyZ7VkiZ4LMHRasrHcAJgCEVkzJ9F9uvYgwoxj911k2ux0dgMUHj+9Y+UBk4YrIJVQS5MyZD1EvYYSrWy3drWP2LhQwZ/AnedBma8m0E7c2Hdz3EKO4QQDFS8eQ/J0bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k6t8b1oX91iberN8HPxYNwM90rZ3VyT83A/oV0fkXBM=;
 b=Dba1wiBP+eTp2fvJ0bMqoEHfuNPHXtFPWhvdkLLCHSVGOo7j3gmDMoNzzBjowN/yH3GGyd7e2VtqXj6IWo6UhMBNdDrVZOSN1r2L6xW90CLc8krm8SGkKsRWYOb21xU09EoCxxu0e8hiHn0MiaufmXbKyPufDSXw3K4fuX5gco0=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM6PR08MB3718.eurprd08.prod.outlook.com (2603:10a6:20b:81::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Thu, 22 Apr
 2021 16:28:41 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.020; Thu, 22 Apr 2021
 16:28:41 +0000
Subject: Re: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-3-francesco.zanella@vimar.com>
 <20210421164228.GB110463@roeck-us.net>
From:   Francesco Zanella <francesco.zanella@vimar.com>
Message-ID: <1b53153c-e890-cf3c-74f7-9106965c23fe@vimar.com>
Date:   Thu, 22 Apr 2021 18:28:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210421164228.GB110463@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [151.71.13.13]
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To AM6PR08MB2981.eurprd08.prod.outlook.com
 (2603:10a6:209:44::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.150] (151.71.13.13) by ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:22::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22 via Frontend Transport; Thu, 22 Apr 2021 16:28:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb855bc2-c0e8-4ca6-6b89-08d905abb0de
X-MS-TrafficTypeDiagnostic: AM6PR08MB3718:
X-Microsoft-Antispam-PRVS: <AM6PR08MB37188C644D5986C748261939E9469@AM6PR08MB3718.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IxKhT02+++/w3+ZTxRExhSDNmlQPVIPa73TF7sa6kwdd3FTWmAA+zccuotFXx3bU9UELfyQjk1420I+j1tEjuNP0mmOQC7vgA8eC/6oSDU2lC5uCCSwOdI/w/gdug2cJ3SeW8UvhCB3ra0cy0Hlt3hb1tv7KpuOHO41xU/sAs18nBaf6V3edA4yEHW4E+Q4GCdiSX1YQX+iclm/8II9eSGR0oMVuwcTQAgqFOi98STMRSFZCaiZMhNsQ+D0O2OlVbA5PBhusLt81tG3auTC7OOvjCc2r361d9lGl+vFw5smVf1AO5zqrXUc6YmNRK4L9ICmWhgoSb7OWkMwcImeWNte+DMniQPBkNu4M6yx6feLYqGip3qwxgbw7La5GqAbLRVpr4FAi3mIDaPeRdaDeUu5Q5Uaf4SzjtlL2qAC6X0L3LCHFLn2K9PhwrFidk67O8y6wAGwk9cSdF3gMD6UCjPzjiJzCdaizboV7rCj4UEJmaIVic67IbShVmDwE7ANXTXE4u+gBzdZD6fZJcYkmSckRuhp+Yk5yKFuZIN8HCVai5k+ZHG/gORrAxfmalGuqKOs0WyofCp68JFcTg6Xt9AySYrmqhg/coY5ifHmWb570f+D63DwLsEGcQDzPRSQSPMSKrsvKH20S+2e7EM/0ZLpkSPuRiiBU7qYlqE0C0DpjfUokwtQPmLtRkiLCxB5zzAKTIYMUB2BxVla/ZjE1B03HO7A7X68l8c/MEBxVV+VYJ8k9l1ZotfV4hxrbrGDz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39830400003)(396003)(136003)(376002)(346002)(366004)(8676002)(66946007)(186003)(8936002)(16526019)(44832011)(38350700002)(478600001)(316002)(86362001)(66556008)(66476007)(26005)(6916009)(31686004)(2616005)(83380400001)(6486002)(53546011)(31696002)(4326008)(52116002)(16576012)(36756003)(2906002)(5660300002)(956004)(38100700002)(45980500001)(43740500002)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RlFhU1FFVkNaYWhYT0JNOVFUVFJaVzFXSUdwWEZCVGpsU2tCM0hmdFNUbE81?=
 =?utf-8?B?UU5SV1ZsTzExK2RpRC8wVFkyNDkydlJvS3I5aHpXTHNBb0UyRi9lUmFYOW1h?=
 =?utf-8?B?eksyRE01V05lMzROaEJ5Q3pjWEhVQUlaeTVYM0NpU1YyMGlTSVhnOGxlSDRj?=
 =?utf-8?B?YStmQ2gwbElXQmdMZTc2WVphYUV2TDkxanFSRzRGcmYyTXZiTFJMQWNwVitL?=
 =?utf-8?B?Yit6eFhFOFdQSS9veHB6ZHpuZVdUTFdTWFJvY0lqOXhEM0tVK2xzVVFzaHhy?=
 =?utf-8?B?a2hkYkpIQkZKSHVod3E1Z2NIUy9tazM3WXNCb0lRNEpoMVNUT2hKbU9kV3dz?=
 =?utf-8?B?akVzakRrWXlhb25YRWxxRDAzUFo0alVGOVNiUjA1SUxNcFN3OGJCNHFpVjdq?=
 =?utf-8?B?NTNxc3VqN1pOVUZlV1pNUEhIQWRyL1BqZExCalV0c3FDU3ZkTytRVFpheXdj?=
 =?utf-8?B?dnh4TGt0OXcwb0EyTjlLa01kcDFPdTlJRmxYS0xRTGxub0hxNVpjdlQrUGFL?=
 =?utf-8?B?cXZLSEdKOXp0Q2hoWjNDdlRMUjV0bEVVV0VoODYxVnlVRWdveWxGVktnbFNj?=
 =?utf-8?B?blVudFdHRHNocW9JZEtiWFVNZS84YkVWNmpRM1o4SkNPNlk2RkU0SHNHc0J3?=
 =?utf-8?B?ZXV6WURvcExuQ2w4Y0I1aWdSczN4VEtGdVFIWVVVS0ZNN3RuSzBhN2hQYmp6?=
 =?utf-8?B?ei85N3dvTDVqOGJ3S2ZkakJMbkl3YWl1SThrdHZvVjM4Z1ptVURDbHJIcjc1?=
 =?utf-8?B?OVQ5L2NYemhmU3pSMklTM0htOTFPUzB2SWxwR3hsMVlGWGhCWjkydVNubVB4?=
 =?utf-8?B?K3p0ajVuWVk2b2krWDNnei9MTHI5ZnRMZlgwdStyWFcySHpSMThvTERKM2Rw?=
 =?utf-8?B?dFovd3p1ODNWVDJEUDhRYlgyZTBlK3lsN1U3V1pkU0FWdHpYSW4rV1RQSVNU?=
 =?utf-8?B?YTRDcUZ2T0N6TjNsK2g3K3RyWUVjTTJSZmVNZUtWZDdBZ2h1UEp6N3BrNlNt?=
 =?utf-8?B?MnJDQ3VxN2dNSnpLMUJ4blB2NGxNbWczeXMxSnBoR01FTXFoaS9UMEE5VDJM?=
 =?utf-8?B?ZnExcitNd1dBbFdrNC9VazVUemtJRGRmL3dCcVY4czF6UnVQd2owVjZMV1ZG?=
 =?utf-8?B?NFplalpRUStIWEdXcUdlMEpwL0V3ZUphSk9VR2ZmSy9neXVKOU8xQjgxMFRO?=
 =?utf-8?B?U015ejgzSFRJR0VWU1k2WFFpZFVWV1RTUTJ3R0dTSDF2SmxrYXpXV0M3clM3?=
 =?utf-8?B?TDB4K3hnY3BvL3UrY3JRM3pyZHNLN3JCNWJPY0k3WnFJMUVWM0VHS2t4MGtQ?=
 =?utf-8?B?M3hrNW51cjUzS2ZjSXVoejhLdHhDdXhRU0VGeHdXT09GcmcvdXNDUlBNcXRj?=
 =?utf-8?B?WFZNcFVDejlvRmVyaVErSUpIajVpVmVYRlEvcUgxNTdxT3VMcXFIbFJxL1Nq?=
 =?utf-8?B?aDNOU3BwandJNHVlSFUzZ3ZZVDNMRU5FWE40b0ZBN0dMckdtY3ROV0ZlcXNL?=
 =?utf-8?B?KzU0b0dhQlk0VjJmTnZsNnFWR2NtazFxTDR6MXp6SjJmMkk5NjZzcExUcDB4?=
 =?utf-8?B?cWRVWE1qK3FLdzJsNVpUREp4ZG9VL1h5MWcrNlNNSk5jeUErM3JtM1NlRzdr?=
 =?utf-8?B?SXRoak1PZmtGWERvS3pWNUN1bWFJend5Q0RYczE1a1pmWi8xczcwMXJZNnRZ?=
 =?utf-8?B?bTF4NTdpVloxNllqbWRQbCtRdVpVNGFlVjdSVnNHNFNkb28vYVMxU3BvTHo5?=
 =?utf-8?Q?tBaxEjIYALqo+WlU2/ZmupRBmoZ7UjM98M7hmh8?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb855bc2-c0e8-4ca6-6b89-08d905abb0de
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:28:41.5608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVaiRImBg63Ju1ktG6OmR19J2om7IWSHOhHlczDrcorMDrWY5iyUwFycOFmOz1/D7RWiLEeeKbKBef2exbKYaKujkXGWTRImpp2malp9538=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3718
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 21/04/21 18:42, Guenter Roeck wrote:
> On Wed, Apr 21, 2021 at 06:26:21PM +0200, Francesco Zanella wrote:
>> If "start-at-boot" property is present in the device tree, start pinging
>> hw watchdog at probe, in order to take advantage of kernel configs:
>> - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was
>>   been enabled before the kernel (by uboot for example) and userspace
>>   doesn't take control of /dev/watchdog in time;
>> - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
>>   /dev/watchdog within the timeout.
>>
>> Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
>> ---
>>  drivers/watchdog/gpio_wdt.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
>> index 0923201ce874..1e6f0322ab7a 100644
>> --- a/drivers/watchdog/gpio_wdt.c
>> +++ b/drivers/watchdog/gpio_wdt.c
>> @@ -31,6 +31,7 @@ struct gpio_wdt_priv {
>>  	struct gpio_desc	*gpiod;
>>  	bool			state;
>>  	bool			always_running;
>> +	bool			start_at_boot;
>>  	unsigned int		hw_algo;
>>  	struct watchdog_device	wdd;
>>  };
>> @@ -147,6 +148,9 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>>  	priv->always_running = of_property_read_bool(np,
>>  						     "always-running");
>>  
>> +	priv->start_at_boot = of_property_read_bool(np,
>> +						    "start-at-boot");
>> +
>>  	watchdog_set_drvdata(&priv->wdd, priv);
>>  
>>  	priv->wdd.info		= &gpio_wdt_ident;
>> @@ -161,7 +165,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>>  
>>  	watchdog_stop_on_reboot(&priv->wdd);
>>  
>> -	if (priv->always_running)
>> +	if (priv->always_running || priv->start_at_boot)
>>  		gpio_wdt_start(&priv->wdd);
> 
> So the only real difference to always_running is that always_running
> doesn't stop the watchdog on close but keeps it running.
> 
> Does that really warrant another property ? Why not just use
> always-running ?
> 
> The special use case of being able to stop the watchdog doesn't seem
> to be worth the trouble. Please explain your use case.
> 
> Guenter
> 

You got the point.
I would like to be able to stop the watchdog when I want.
From my point of view always_running is used in the very special
case when the wdt chip can't be stopped.
I want a normal wdt that can be stopped (for example during a system
update), but I want it to start at boot for the 2 reasons that I
explained before:
- I need continuity in hw wdt pinging because I start in uboot,
  so I take advantage of WATCHDOG_HANDLE_BOOT_ENABLED that makes
  the kernel to do that job; but it is triggered only if it is
  started at probe, if I'm not wrong.
- I would like to monitor with the wdt also the kernel at boot,
  and more importantly handle the case when the userspace app
  doesn't take control of /dev/watchdog for whatever reason
  within the timeout set with WATCHDOG_OPEN_TIMEOUT.

Hope that this explain my target.
Thanks for your attention,

Francesco

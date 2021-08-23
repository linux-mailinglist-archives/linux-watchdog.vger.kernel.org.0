Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A24CB3F5000
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Aug 2021 19:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231686AbhHWR7G (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 23 Aug 2021 13:59:06 -0400
Received: from mail-dm6nam12on2079.outbound.protection.outlook.com ([40.107.243.79]:25130
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231640AbhHWR7F (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 23 Aug 2021 13:59:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjiYGv+GjRCl3iRhCuVC2SCKnFjMXXTVsfDidxH8wJXMup2BoWN2njpZF1icGZ4yEqT8JIfU1enNFEhVVMfmC5fty4fBA9eacc6PqoiM6jKKm2HaxD1UoEmhJz4kaqBY8zJIAYJSMK35CVO9e/ov7IXCCCeSHnyJ0lK84Ynq3tUd0/hbtPEpipNv+5Rouu3ns1pE3YW8bW+p97CuxdVGDC2iXDxlISY+3hhHRL1d+2mhxdx4/dNpR/WF/uOfYND6LtLkzUhJZ0xyMSJ/YGRjjG9RkynpkIIvfLmRVLxkRvJ+KTg7OIWcrLDJbWh77PMfi2bAEIAVZUwmV6ZnzQjzfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzcBCPHL9fyw2Fe+wyCDzZJtv5gQtcfKxJtnQ/FcC50=;
 b=Ea0nbE5soooYy5vJFqzaJX14TucYeAEo4S1x0KaM7nbpYafxujE8TubqOP+1r7sRGxkVZiBGQlFz+TqBUHddQQUH4qwgf3oAbSgZFoJOYav9Ba9Ghm5wEChPVuwg87FhQigd3rkfHrzLUtpIt+frZQ9Qa0YriXKZhoCCLBsph4YxLKCsDoEgnsG9ZDnZMH6X6A/33ydB0annz1B9s5tTjEVZPR17rLf0Ev9oyZJsazUNdQ3OVpk+YbN1sRptdpL1MgWRxiIuTpbXR1twpOZgdbWXOmHalzQ7p9O3LgPVEoihahDqaXB84vKcuPmRWBtp9Jn5njrUByRmWw3kMqGxxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fzcBCPHL9fyw2Fe+wyCDzZJtv5gQtcfKxJtnQ/FcC50=;
 b=4vHsyHMf5FwOTJWPQKuC9ajtCCsdItLceNPjk4JHNUWDzD26xCzEmWUep6D+QTomlXnifJBtt//bES7U92tthYZNpV9B1mzdDbqHsdpdiKy0LhWQiDaRyuJ2MYUUfU/mEV0ywGr69VBsEBNXS39DPtfmpyJ7vkeJlGOalWBBuaM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4512.namprd12.prod.outlook.com (2603:10b6:806:71::9)
 by SN1PR12MB2541.namprd12.prod.outlook.com (2603:10b6:802:24::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:58:20 +0000
Received: from SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998]) by SA0PR12MB4512.namprd12.prod.outlook.com
 ([fe80::887:2dce:ae8f:5998%5]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 17:58:20 +0000
Subject: Re: [PATCH] Watchdog: sp5100_tco: Replace watchdog cd6h/cd7h port I/O
 accesses with MMIO accesses
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
        rrichter@amd.com, thomas.lendacky@amd.com
References: <20210813213216.54780-1-Terry.Bowman@amd.com>
 <416a67a7-646b-eb8d-b617-80cbbbc028c6@roeck-us.net>
 <396d4558-9ddf-55e8-75bf-cb1a15de393a@amd.com>
 <b32c2263-94a1-fef5-4455-6d7bef40a968@roeck-us.net>
From:   Terry Bowman <Terry.Bowman@amd.com>
Message-ID: <c47b05ee-5e0a-08ee-318a-52e370619d2c@amd.com>
Date:   Mon, 23 Aug 2021 12:58:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <b32c2263-94a1-fef5-4455-6d7bef40a968@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR08CA0030.namprd08.prod.outlook.com
 (2603:10b6:805:66::43) To SA0PR12MB4512.namprd12.prod.outlook.com
 (2603:10b6:806:71::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.65] (165.204.77.1) by SN6PR08CA0030.namprd08.prod.outlook.com (2603:10b6:805:66::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:58:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 757ee922-e3c6-424d-c9bf-08d9665f97a9
X-MS-TrafficTypeDiagnostic: SN1PR12MB2541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB254129D9FC42E150421D49B183C49@SN1PR12MB2541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nGIPvnpcDz8NEvB3joyn2gDm8spoyYuZQs1aixbEdMS3YFCKjGVsZQV0fTqiYWkuDPNRqIbBsBfigC3tKiGHR/lD71dbVWiE9JBfSD+yTfEe3RvRvFa6IbCSD2Tlu1EXIR/r4dAQCVZN63C+wzA7oSepgHJr+L1+VkyPjo52VAFLahlZLGyX6rr5t3xclPdHv3M64jjToWJvb8uf3sdEtILkAU9Zzp6q2ITqVzJzi071tngoTO0yXnrxgQuIXoE7fPAtDfW8ZV1Os4jSLnpQAzFYNWQREsQ1fNaeYnuZclh+fhTE9rg1eDZIkg+n8FDrwAwsfpdkNyunhu/nX7mJqVLcQlqJprhP11XffLGgtDgk58gVbMwWlkvItPfO8cBs9uP1L6Zz8Kk4zZ2aGjmAvqZdgwzNTXdrcAqeVkpKJvdLTgZ/fgsSKUj16Jg5NODwcNk00GBEfsaSB/RxhwwEqjNaBMFzOjZa0+kTFXy0x7HVRkQ1elV6+CeAioMKaCv46bC3z2Yk6mShV29z3bzhPMtGQibXpUvH3ZbGJoB2EGIFGQBKUWlAEDJsPYlI0VGRWe0upfnoSUW3MruaqAm4ZFmjk54AwefEuIv5IWQGqNmpA7dIAdXleIKecNC7JBUhsc5+rAvi7s0YYojOQl5NuzItBG6vo4fet/3ywWCD+gs5hzEB7jkc9zdL7ZMWdZ2IB1JtmWYzoMoMxf0q2W+TwDVwARBqw7r8X/ivqnc/Ov4BgwZaH+eIs0cjTowkblWk4QEBczq1F7QjhOATwBN/TQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4512.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(31696002)(8936002)(83380400001)(186003)(4326008)(36756003)(26005)(66556008)(5660300002)(8676002)(2616005)(66946007)(66476007)(478600001)(956004)(316002)(6486002)(53546011)(86362001)(2906002)(16576012)(38100700002)(31686004)(32563001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnF3OWJkRThEMGl0anB0blpra1ZEWmtDVklzejBPb0ZPVGFzQ2pjVUk1T0dO?=
 =?utf-8?B?YXlBQklIbWVSdktBRS9HTUh1MEJlRkV3c3VsbFRGV2xCdktpK2N4WmxrUjFn?=
 =?utf-8?B?QkV3Mm01cTJVenpXWUNCS3ZnRTlnWlpuVkR0NEJnNUpSME1yc1BRWWRPRkFX?=
 =?utf-8?B?RFZSeUxvejNVb2NkZDFlUE5WQUNzOXltZ0JDTmFqKzM2ZURJUnNiaUZiME50?=
 =?utf-8?B?cnRwWjRMa3NlMGlPUWtjaXEyZVZnOVdaTFo4bEsxZGM3MkgyK1ZNdW5kdmwv?=
 =?utf-8?B?b1dCNEtRL2R4RlZOVU1QZS9BMnNOUUg2ZzRza1AwRE9xekRRSVJnNUJCNmp2?=
 =?utf-8?B?d0UxZjlGUXU5WHlFMVVxZ013cVVOaTVmWmVZMm5Ma1JnTzRZNTRoWWw2bE5y?=
 =?utf-8?B?N05mMDVXQmxFa0JheGtRTGlOSFJOQnZFQkVaV25Kb3ArWDF1RGdram9nRmNa?=
 =?utf-8?B?S3RONGlYTnhBdHgrTFVObndhdmFaVXQ5dTRsQlAxeUkwTjdwclNmQjUwSHJG?=
 =?utf-8?B?dDJXNVl6SDQ4QVZERHBldjVnYkRIRnhxUWFWSzB3ZTJZTitOWGhUWC9id01U?=
 =?utf-8?B?bkRsMzdyVXN0Q3dBMWFDR1ZyYUxNV3F1REZ2akR4Y00rZ25teFAwRjRySXBK?=
 =?utf-8?B?T0N2aGxydkhNSktIVmRjdFVlTFJDamNaQW5MbXp0QU05ZjJJU3pKWkRTbHNm?=
 =?utf-8?B?NUVFVG9waHpIZ2R4RHlJTmpVYklhTURUaERMN3JLRlp0UjhIdmh6Sm9JYUxB?=
 =?utf-8?B?d09PakFNdjcyQ1pONmpNUEV4NjM2U00zeTl1YUw2Vk8zTGpHRjg5Lzg5bWNm?=
 =?utf-8?B?Vmhicyt0ZEJkaEhaNkZ6UE1MVkgvb1RKUGdDci9COUpZVVpkRFloWTNYYUZY?=
 =?utf-8?B?ZklNSFlZZWo1MklHSW1janBZVXlSQTBPS090UWRaNlZGYUJDaXVnaEY3aksr?=
 =?utf-8?B?Z2VYUmhsa3pkcnR6MXBVaStoRUp4Wjh5SWg0WlZQbjFERDJkRHFXYVN6cUV5?=
 =?utf-8?B?UzJqQmRYTVlkZUZ1OU00ejVBa3AzV0pMbzMyWWlTTlhDY2FldW00ckwxK0dG?=
 =?utf-8?B?SHFPQUFnaTRXNHlybWFkMGxHSDJla3V1c0ZBb3FVRG1LbXV5WitrcjhaelVR?=
 =?utf-8?B?dElpSmdSSlU0WlVEeDAvTzhBNW5TMjNTNk9mMjN2aUZxcS9oaHRCcDVUVHpx?=
 =?utf-8?B?Z012SWE1OXVBWGp4eEthWnA4MmdLbkdYQVdHdzM3eWYyL3JVNGcwRXNKMlhm?=
 =?utf-8?B?K0VScUlwMEV6Mnh4cGVzYUVMWm9LSm83NVFidEdDUkpaSm9xV0UyM0JSN010?=
 =?utf-8?B?Q01LNUF5ajFiOGZVWnIxREpvZUFmc2NuN2d2UDUwTG5ZVUxlV1d3T2pRNi9B?=
 =?utf-8?B?cWRLU0JuN3oyY3kvVVJqQndRcy9wZE5HS0xSZ1lYNTVXVXV0djNkQWt6RWlh?=
 =?utf-8?B?N1VLeTRWVWNpZ2JNa3dpN21ORUxnbStxQlZVMXp4azFDcXJEU3k0UlhFT0lF?=
 =?utf-8?B?UjZ3cTV5amVtM0ppZk9sVzJ3WFB1d2t1NC9wMlVYVWJjTmNyZFZEeTlMMFEz?=
 =?utf-8?B?ZTJIZXVoM0hDWStDb2FIdHM2RGdhb0dWWUxjMkxXQzk3cWxDdUR2L2xodlZW?=
 =?utf-8?B?YjVxVzB2bU5sOFhUamRJeFJJNEhxS1h0WXJEUllJNjNnUmdCWW1ST1Ayb0w0?=
 =?utf-8?B?ODZPMStJUmtLcjc5TFcrM016bXRtU0lISUEwU3RkaGc0WG53OVp0L1VTcGRw?=
 =?utf-8?Q?kDRSoCIoHsG8tT0rw3rdLy092NwOB5GME5Sa1Za?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757ee922-e3c6-424d-c9bf-08d9665f97a9
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4512.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:58:20.4547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMQJJA7gvXoavN9O2sVClCF4ErGk2McEkw012UsgReGPevqc3jm+/Nvue3Yzr4r/w2wmdm98JPKofWbANz/JGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2541
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 8/18/21 3:34 PM, Guenter Roeck wrote:
> On 8/16/21 2:29 PM, Terry Bowman wrote:
>>
>>
>> On 8/13/21 5:37 PM, Guenter Roeck wrote:
>>> On 8/13/21 2:32 PM, Terry Bowman wrote:
>>>> Use MMIO instead of port I/O during SMBus controller address discovery.
>>>> Also, update how EFCH capability is determined by replacing a family check
>>>> with a PCI revision ID check.
>>>>
>>>> cd6h/cd7h port I/O can be disabled on recent AMD hardware. Read accesses to
>>>> disabled cd6h/cd7h port I/O will return F's and written data is dropped.
>>>> The recommended workaround to handle disabled cd6h/cd7h port I/O is
>>>> replacing port I/O with MMIO accesses. The MMIO access method has been
>>>> available since at least SMBus controllers using PCI revision 0x59.
>>>>
>>>> The sp5100_tco driver uses a CPU family match of 17h to determine
>>>> EFCH_PM_DECODEEN_WDT_TMREN register support. Using a family check requires
>>>> driver updates for each new AMD CPU family following 17h. This patch
>>>> replaces the family check with a check for SMBus PCI revision ID 0x59 and
>>>> later. Note: Family 17h processors use SMBus PCI revision ID 0x59. The
>>>> intent is to use the PCI revision ID check to support future AMD processors
>>>> while minimizing required driver changes. The caveat with this change is
>>>> the sp5100_tco driver must be updated if a new AMD processor family changes
>>>> the EFCH design or the SMBus PCI ID value doesn't follow this pattern.
>>>>
>>>> Tested with forced WDT reset using `cat >> /dev/watchdog`.
>>>>
>>>
>>> I am sorry, I don't understand why the new code can not use devm functions,
>>> why the new data structure is necessary in the first place, and why it is
>>> not possible to improve alignment with the existing code. This will require
>>> a substantial amount of time to review to ensure that the changes are not
>>> excessive (at first glance it for sure looks like that to me).
>>>
>>> Guenter
>>>
>>
>> Hi Guenter,
>>
>> I can change the patch to use devm functions as you mentioned. My
>> understanding is the patch's reservation and mapping related functions
>> are the focus. I originally chose not to use devm functions because the
>> patch's MMIO reserved and mapped resources are not held for the driver
>> lifetime as is the case for most device managed resources. The
>> sp5100_tco driver must only hold these MMIO resources briefly because
>> other drivers use the same EFCH MMIO registers. An example of another
>> driver using the same registers is the piix4_smbus driver (drivers/i2c
>> /busses/i2c-piix4.c). This patch can be changed to use the devm
>> functions but the driver may not benefit from the device management.
>>
>> The 'struct efch_cfg' addition is needed for MMIO reads/writes as well
>> as during cleanup when leaving sp5100_region_setup(). This structure was
>> chosen to contain the data instead of passing multiple parameters to
>> each EFCH function called.
>>
>> Do you have any recommendations for how to best improve the alignment?
>>
> 
> Overall it seems to me that it might make more sense to implement this
> as new driver instead of messing with the existing driver. Have you
> thought about that ?
> 
> Guenter

A new driver was initially considered for this patch. I decided to update
the sp5100_tco driver instead because the changes are limited to
initialization and post-initialization code is not modified. Also, updating
the existing sp5100_tco driver allows for code reuse.

This patch can be split into 2 or more patches to simplify review and
testing. Would this help?

Regards,
Terry

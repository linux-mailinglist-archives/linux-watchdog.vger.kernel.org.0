Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00C6E368FB9
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 11:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241837AbhDWJsC (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Apr 2021 05:48:02 -0400
Received: from mail-eopbgr70052.outbound.protection.outlook.com ([40.107.7.52]:45966
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229811AbhDWJsA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Apr 2021 05:48:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DppyJUOaamcfMlgijtDVjH46kmnBMhFQKE5uZWQu+6sHupR8chfLyDOxS6JaUTqJZ6U/5LOyFqCc2Pdp1SMwivAmseSRYqW59HkTZSP6MD9+io/V2UXZjvIQrwEsBInXyh0pRryLw7Q4Eq0gvEuoppNmr2KnI6SwIKeGwVkYFFaOAcX4P6sjujBJtMFasN6oZiqnjOsmRZG9Nxtv/A6Ga4nNVDsQR3/gBMgWjm9T96O9ghP3Os+xIGWKUXgUOHykDpGm0f74Dj7LcsCi6B2IFVtJm2uN4iMvNnZPucKvHkF9s+kaBf6rFU+lhvq4dGC5UzxJqn/YKfXbla/K4omQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y/6U/fthNBTUM0ZwpdjQSyKEQclfMp662kw+5uFRw8=;
 b=iaBmLNzSRTwGU5MLk6veBs/Ltg1kH5Z+Y+d6vDsIiF+gvYm4HEw4OQlfGrRO2xTRZrZAHdhDEP19XMk6DwZM5jT4yBHWYhw1pB7Vkp6i4d/qM80Ohyom9WuGSm4kZNqAsrnZkmyK0y53R4/kgeziRG9GmIXToTYaFB8YEfm7lVogEdE3Tw/TmL8KabU8lGmUjmlnaLAIsl/c5BP2zSwczsBWtgvbPPSE9iQI+P65VDVdsZ6Nt9FbH0edRfoH9XtF/HYLs4Ql6IPM9hhLm7cQhjLgF4J26TqS867Dt+jTOPQrf8xLcaq6HQgh4OcUepk99oHHTGrJUMi87ridAIfeMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Y/6U/fthNBTUM0ZwpdjQSyKEQclfMp662kw+5uFRw8=;
 b=jF92M3fAZHYKSZV8IE1RZ7mbXd1T22r6JhfJ287NF0Z5u15WfYVGWhR/9hj8gGNZVwIJFLmh7lA38yEL8jzZxqcNjvuQvyNZcU9e8/Rm1mDeHDZYYUEZyoZzBVyXizYV3p5CP5Ydb/LNryo8Boffpu7KKa4FONs8W//0TwBpc2I=
Authentication-Results: vimar.com; dkim=none (message not signed)
 header.d=none;vimar.com; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM7PR08MB5335.eurprd08.prod.outlook.com (2603:10a6:20b:101::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Fri, 23 Apr
 2021 09:47:21 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.024; Fri, 23 Apr 2021
 09:47:21 +0000
Subject: Re: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, francesco.zanella@vimar.com
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
 <20210421162621.24910-3-francesco.zanella@vimar.com>
 <20210421164228.GB110463@roeck-us.net>
 <1b53153c-e890-cf3c-74f7-9106965c23fe@vimar.com>
 <20210422180539.GB107132@roeck-us.net>
From:   Francesco Zanella <francesco.zanella@vimar.com>
Message-ID: <723c0890-552c-4a41-d836-9beb052cabd7@vimar.com>
Date:   Fri, 23 Apr 2021 11:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210422180539.GB107132@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [151.71.13.13]
X-ClientProxiedBy: MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::18) To AM6PR08MB2981.eurprd08.prod.outlook.com
 (2603:10a6:209:44::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.150] (151.71.13.13) by MR2P264CA0006.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Fri, 23 Apr 2021 09:47:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0a298b9c-e664-43ad-b27f-08d9063cca69
X-MS-TrafficTypeDiagnostic: AM7PR08MB5335:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM7PR08MB5335756758C98705B267C01EE9459@AM7PR08MB5335.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F/fz3Qfg5WuDjo1J3EabgJvewf6gkdmXEhnY+ur7gOr7NMGxrCrjsLBnksVWGjCNy9D/RbmytWT1aLrk6t2KFFZuav5gtieF2J4lLm9nKv1YnB/73mAw+zBn9/yKjO5v2ItXh05Yu9yPyFI6PfSZ0ZhfOmboSyHBvFPBBkjh2nunc0IuKfgjNnff5WVSECf5WCHZKHagd0dryCK5jJsr+pXaXSFC0b3aiGGvXkYS9UTsQSC+JbUgtiuBwPjVnUXH0tPwitLEno+3O8qvVv2xKiTDtSTUEXInCpAkBiLWKg6kcallTyiCi8tDefOmkSf1R2uvc5so/CcXnOwERaADS/2Q0N9FpF59OXS1aRwSQKNktAEAJXddDpcO1H1xF+3EpfpfxDb2eBxGwA+SmiLyzewr00SucVajgnNJsPpuM2VDiLiUmw2KE3BwTDrymC5B3vQARPnxFWf60dSSEkVaHcTU9Ga/xXbMkGgMX0YGmGT95Z08u0HuXobGkowjqaKFOc007asJreHnzD5UGVA8tgFhccYf7uVjCmjaAl8+0cQBBGO5Ax/0guFLJvPNRnBvkPRYEMH9G7VfpIrqhn6KnYLAQ4s2l3eGVC1gHm8OvyAhe4dn8sh95F4sW/lfeJ+pwOIrl58e4a4bd+/Hv645EFrIO+FL06dLzDMKSZjSThXoSOjAlClDvaX62/sZNpbejwxRC4cz1FAC1S/EVvUliapFGQCIt3Cc9VT3KVQvRZbSczaTlioKpMXoC2u6Vmdz
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(5660300002)(6916009)(478600001)(31686004)(44832011)(36756003)(52116002)(53546011)(66946007)(38100700002)(66476007)(8936002)(38350700002)(31696002)(83380400001)(66556008)(107886003)(8676002)(2906002)(4326008)(86362001)(16526019)(26005)(956004)(186003)(2616005)(6486002)(16576012)(316002)(45980500001)(43740500002)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MFFDSGlKMDFVYkJPVjJ5N2pqcTNzbjV1ODVOQm85a0ZXNU5GYW80MjhDZjc2?=
 =?utf-8?B?cUNuWUtvSUJlVU1GWWRJNTc5aE1XNzVocnZSNkpHQ2d4RE52VHNrTC93aUth?=
 =?utf-8?B?Y29WcEN3Z3dYWFV6bkZaZnFTT1hHRjAwUUtQMWJzc0VqOEFaYmFkelc2NW5S?=
 =?utf-8?B?R1lUbmdMSzVNMnRidDNNWEhrMjFsMW12RWhrenhJSVRNSGh5VDZ4a2tmYmR0?=
 =?utf-8?B?NGNrSC9FWlpQVld4UmhvSnE2Mkk1SksvNjNVcUZEbkluVGlPWWRsZnd3djlS?=
 =?utf-8?B?dThsalZwZnhTRWZpMVRzZm1GWFJCbGU4QjJtK25MNjFvNlRVWC9IMVVnUWVK?=
 =?utf-8?B?b1FWcnJVVnkzSHZQUFVxMXlITGxEMDJXWGlzb0FNMjBKQzZSZmFJK0REZHho?=
 =?utf-8?B?MU92QkwyRUVFU000M2ZIbVVmS0xWZWFBaTRQTGwvZktQZkpFZkZMQkwxK0dF?=
 =?utf-8?B?QW1valJhVnVDdlB6ZlNzeCsyQVZaSkY4VmJ5d0tLMXBhdU91K2J2ZGJGZjNG?=
 =?utf-8?B?SHZPVW9RN3ZIMTVnU1hnUTcwOUgyNzBMQ1l3SmNPK0J4SExtR0ZUdWo4SHor?=
 =?utf-8?B?aExjZTFqS0JtRzZiSnpuSm83ajRZZ3FjMHZmOWhDeGpkUjI4bm9QbFZwS0la?=
 =?utf-8?B?TmgxdGhGSHdPM01PZlB5YklpNXBncXRVcDA2cWF2Y1pBbjB4TDlDMHB2MGkz?=
 =?utf-8?B?b2VETEhFaVJJcjFCR01IWWxiMGJmY21rTmpGTGh3bFFOVXNzRXZLS21rbmE1?=
 =?utf-8?B?aCtwNXFNcDBVUUhqeGJva1RJVkFvdWtxSzZhNis4RXY5eVhjSVN4YkpValZE?=
 =?utf-8?B?a2ZNdGR4NEc4cGdvSEZPM3dKTmFjbnc0REVmM3NxalJMS1RnbnFLWVlHUHRI?=
 =?utf-8?B?OW1iZEgwV3F0V083RFFya2tGei9FbzJqVEFKaXFjT0ZNRDNQdzl1SUszV205?=
 =?utf-8?B?NkVqOXlXNDV0a21GOUtCdHozTGU4N0tLSGUxTmZjZXZmUURJQWhPUE1zbkor?=
 =?utf-8?B?dlpMYlFLbHpyc3pnb2ZlTVY0SDdtcVl3U2x4dXN5dHUzbm5tSUc1TjhkdzI3?=
 =?utf-8?B?ZUQ5OTY1L3hBaXUyVEhDbTBhS0ZvNGJmZklEVzlDSkoyN3JpSHl2TEdXMEls?=
 =?utf-8?B?dFRKYjBPYyt1T3ZDNEZvdWlSdmNjQno2QUF6ZU5SaENEN0p3UzBwaWhDNk12?=
 =?utf-8?B?a1hIYWRxK0k5Q2hzU2dlWFdXdTMyVVJjNkVQZXJuQTcrYUJ2dkNldTJwUita?=
 =?utf-8?B?b0R1ZHZSbWFkTkVIVEdKbE5oR1R1SzlOMHFnR3VLUWVUdUZid2EvZzMwU3hl?=
 =?utf-8?B?VVozRlcyZGo5UTl3K0l0cVdaR1FWZUtia2t2R3d2RS9nWFhKQklWdkNackFl?=
 =?utf-8?B?bXJGTk90VVFGOFZOUjBuS2Y3R2xyTjFQdnFtZC82TG9WcGZSd3VzNk9WS1N2?=
 =?utf-8?B?SHpDU2lQc0ozZ2xlenV0TE12NTd5QVJvYlBQQnM2emlYa2ZyQTdUa3NhcVlm?=
 =?utf-8?B?YXNJWkxyS1RPV2wxaDI0dFlDWE9JVm9PTGxyc2RVWWJhQVY3d01qamtMeDBS?=
 =?utf-8?B?NWxMMVo0dU84M2FxWTRvYm1odE4rdUl0a21JeU11WlcxMTNCYnJtUDl1N0xT?=
 =?utf-8?B?SDViTGV4cElFNUMzNUwrTHp6WjdWd1ltaTJoVWRzMEl6WmFnMUFBUFVBc2Yy?=
 =?utf-8?B?ZGtFYVhqeHNaZUVDbzhKZElJTFcxdDlvQ0Y4OHpRYVBBd2haKzc3TWYvMGx4?=
 =?utf-8?Q?7/Y9zTNwtolA1yvae250wutrzG16ew3ZZeJXIF9?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a298b9c-e664-43ad-b27f-08d9063cca69
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 09:47:21.5373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sK+I5+tLFTYTXhKmDQH1XzLwsh3MbVJA4o54j8UryN6a4fAZvpb6bowoV8ve1NOHtfjx/Gi5hVMQyrz9JdsveCujd1keqdk3JGPEYHXZ7d0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5335
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 22/04/21 20:05, Guenter Roeck wrote:
> On Thu, Apr 22, 2021 at 06:28:40PM +0200, Francesco Zanella wrote:
>>
>>
>> On 21/04/21 18:42, Guenter Roeck wrote:
>>> On Wed, Apr 21, 2021 at 06:26:21PM +0200, Francesco Zanella wrote:
>>>> If "start-at-boot" property is present in the device tree, start pinging
>>>> hw watchdog at probe, in order to take advantage of kernel configs:
>>>> - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was
>>>>   been enabled before the kernel (by uboot for example) and userspace
>>>>   doesn't take control of /dev/watchdog in time;
>>>> - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
>>>>   /dev/watchdog within the timeout.
>>>>
>>>> Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
>>>> ---
>>>>  drivers/watchdog/gpio_wdt.c | 6 +++++-
>>>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
>>>> index 0923201ce874..1e6f0322ab7a 100644
>>>> --- a/drivers/watchdog/gpio_wdt.c
>>>> +++ b/drivers/watchdog/gpio_wdt.c
>>>> @@ -31,6 +31,7 @@ struct gpio_wdt_priv {
>>>>  	struct gpio_desc	*gpiod;
>>>>  	bool			state;
>>>>  	bool			always_running;
>>>> +	bool			start_at_boot;
>>>>  	unsigned int		hw_algo;
>>>>  	struct watchdog_device	wdd;
>>>>  };
>>>> @@ -147,6 +148,9 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>>>>  	priv->always_running = of_property_read_bool(np,
>>>>  						     "always-running");
>>>>  
>>>> +	priv->start_at_boot = of_property_read_bool(np,
>>>> +						    "start-at-boot");
>>>> +
>>>>  	watchdog_set_drvdata(&priv->wdd, priv);
>>>>  
>>>>  	priv->wdd.info		= &gpio_wdt_ident;
>>>> @@ -161,7 +165,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>>>>  
>>>>  	watchdog_stop_on_reboot(&priv->wdd);
>>>>  
>>>> -	if (priv->always_running)
>>>> +	if (priv->always_running || priv->start_at_boot)
>>>>  		gpio_wdt_start(&priv->wdd);
>>>
>>> So the only real difference to always_running is that always_running
>>> doesn't stop the watchdog on close but keeps it running.
>>>
>>> Does that really warrant another property ? Why not just use
>>> always-running ?
>>>
>>> The special use case of being able to stop the watchdog doesn't seem
>>> to be worth the trouble. Please explain your use case.
>>>
>>> Guenter
>>>
>>
>> You got the point.
>> I would like to be able to stop the watchdog when I want.
>> From my point of view always_running is used in the very special
>> case when the wdt chip can't be stopped.
>> I want a normal wdt that can be stopped (for example during a system
>> update), but I want it to start at boot for the 2 reasons that I
>> explained before:
>> - I need continuity in hw wdt pinging because I start in uboot,
>>   so I take advantage of WATCHDOG_HANDLE_BOOT_ENABLED that makes
>>   the kernel to do that job; but it is triggered only if it is
>>   started at probe, if I'm not wrong.
> 
> That depends. If the driver can read the current state (ie if
> it can detect if the watchdog is running) it can report it
> to the watchdog core accordingly. That would be the preferred
> mechanism. Everything else is just a workaround for bad hardware
> (bad as in "it doesn't report its state").
> 
> Guenter
> 
>> - I would like to monitor with the wdt also the kernel at boot,
>>   and more importantly handle the case when the userspace app
>>   doesn't take control of /dev/watchdog for whatever reason
>>   within the timeout set with WATCHDOG_OPEN_TIMEOUT.
>>
>> Hope that this explain my target.
>> Thanks for your attention,
>>
>> Francesco

Right, I agree with you that's the optimal way, but we are talking
about a low cost, simple GPIO WDT, that has only an input GPIO as
an interface with the system... how can it report its state if the
only way to enable/disable it is a particular state of the GPIO
that we are going to pilot?
I think that this driver was born for that kind of low cost chips
(I'm using a SGM706 for example), why can't we let it take
advantage of a useful kernel mechanism?

Thank you,

Francesco

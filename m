Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79376395700
	for <lists+linux-watchdog@lfdr.de>; Mon, 31 May 2021 10:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230143AbhEaIdc (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 31 May 2021 04:33:32 -0400
Received: from gecko.sbs.de ([194.138.37.40]:46504 "EHLO gecko.sbs.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230426AbhEaIdc (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 31 May 2021 04:33:32 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14V8VWdH002403
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 May 2021 10:31:32 +0200
Received: from [167.87.247.112] ([167.87.247.112])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14V8RsMT032494;
        Mon, 31 May 2021 10:27:54 +0200
Subject: Re: [PATCH v2] watchdog: iTCO_wdt: Account for rebooting on second
 timeout
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <0b8bb307-d08b-41b5-696c-305cdac6789c@siemens.com>
 <20210530131947.GB2483596@roeck-us.net>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5bf45bf8-0cd6-a131-fe11-1651ed60e8cc@siemens.com>
Date:   Mon, 31 May 2021 10:27:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210530131947.GB2483596@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 30.05.21 15:19, Guenter Roeck wrote:
> On Sun, May 30, 2021 at 01:24:23PM +0200, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> This was already attempted to fix via 1fccb73011ea: If the BIOS did not
>> enable TCO SMIs, the timer definitely needs to trigger twice in order to
>> cause a reboot. If TCO SMIs are on, as well as SMIs in general, we can
>> continue to assume that the BIOS will perform a reboot on the first
>> timeout.
>>
>> QEMU with its ICH9 and related BIOS falls into the former category,
>> currently taking twice the configured timeout in order to reboot the
>> machine. For iTCO version that fall under turn_SMI_watchdog_clear_off,
>> this is also true and was currently only addressed for v1, irrespective
>> of the turn_SMI_watchdog_clear_off value.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>
>> Changes in v2:
>>  - consider GBL_SMI_EN as well
>>
>>  drivers/watchdog/iTCO_wdt.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>> index bf31d7b67a69..3f1324871cfd 100644
>> --- a/drivers/watchdog/iTCO_wdt.c
>> +++ b/drivers/watchdog/iTCO_wdt.c
>> @@ -71,6 +71,8 @@
>>  #define TCOBASE(p)	((p)->tco_res->start)
>>  /* SMI Control and Enable Register */
>>  #define SMI_EN(p)	((p)->smi_res->start)
>> +#define TCO_EN		(1 << 13)
>> +#define GBL_SMI_EN	(1 << 0)
>>  
>>  #define TCO_RLD(p)	(TCOBASE(p) + 0x00) /* TCO Timer Reload/Curr. Value */
>>  #define TCOv1_TMR(p)	(TCOBASE(p) + 0x01) /* TCOv1 Timer Initial Value*/
>> @@ -355,8 +357,12 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>>  
>>  	tmrval = seconds_to_ticks(p, t);
>>  
>> -	/* For TCO v1 the timer counts down twice before rebooting */
>> -	if (p->iTCO_version == 1)
>> +	/*
>> +	 * If TCO SMIs are off, the timer counts down twice before rebooting.
>> +	 * Otherwise, the BIOS generally reboots when the SMI triggers.
>> +	 */
>> +	if (p->smi_res &&
>> +	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>>  		tmrval /= 2;
> 
> This expands the scope of this adjustment to all versions, while at the same
> time making it conditional for v1. Is this correct ? What for systems with v1
> TCO where the above conditions are not met ?

Yes, this is intended. You find the reference to "reboots on second
timeout" even in latest EHL datasheets (v6).

Jan

> 
> Guenter
> 
>>  
>>  	/* from the specs: */
>> @@ -521,7 +527,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>>  		 * Disables TCO logic generating an SMI#
>>  		 */
>>  		val32 = inl(SMI_EN(p));
>> -		val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
>> +		val32 &= ~TCO_EN;	/* Turn off SMI clearing watchdog */
>>  		outl(val32, SMI_EN(p));
>>  	}
>>  
>> -- 
>> 2.26.2

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

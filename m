Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C7A426B6A
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Oct 2021 15:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241530AbhJHNHL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Oct 2021 09:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhJHNHK (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Oct 2021 09:07:10 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA58C061570;
        Fri,  8 Oct 2021 06:05:15 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id z11so13678708oih.1;
        Fri, 08 Oct 2021 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NwsrAhEELdrD0yf4RSjEr+rJMAn0uIiuidWlamL/LOY=;
        b=PXybhPRq+OocRcXM0uT95Rqd+6ho1ULptdg17EqaD9MOH284R2N2Jp61anXiO9EXNw
         gcxYQJ4LKqL9nDCIkZP9o3MFX0FXe+ilzb99+XiDeOGQUmG5+lE6860016W/NEbAMrIQ
         VAdEcSUBD1eJpDBMIh+2HNNkA0j6SqavnPaP82DDb9Cn363WOVo2jqZR+QS4ho1q1ZFk
         cWYWSCeUD8n407i2uKMgq46DEzHpAPZYXwtn35SGQGLS/Igec17zBEsHnD5EqIbTTzd7
         fZgW3AeGYbNB8ZLmPtNRFCH+iOgnaD8cMcDFxCnnZESImELw4MxJn0hSbP4dvxmHTRZE
         xK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NwsrAhEELdrD0yf4RSjEr+rJMAn0uIiuidWlamL/LOY=;
        b=LQ1Dqe5GxS0plzfIcZze9NApLZUx8mXbSE9rbHz872BVXRFTDJnYAgW+6I7y92sLCw
         JYgnu+q5hZ7PhyXZ0yeL5nn/Dj8/dOlG3ckXojhvBTuAtTn7g36jc7Pyu+Ug8HzIf9+n
         3vZW3SHfWhZdVCu92jdgDGVMhpqWyfrmzJa3D160MW8fG63HKdXc59L+JjOqIQmSbEAe
         3X2LgqCK6rNDgyZonGd2Hq5GgvRQ5bq/S9eUXCcYMK6se9gwwODCb3WhI8pjd4LZFvdm
         75JCvCc9JQSLx+rJnH2kobkIAz2ZKpjog9SMHRNenwxvRkNqH9QDCu9mQz2ZrLsZEnh4
         Wz3Q==
X-Gm-Message-State: AOAM532RpQzIYlaLRcW5qrKadCmVOBrJIS8bIiCBfZWDWYWkgK/sNZBR
        yEP5OKyc+jJ2QMH8ywlCe6IYeCDpLBU=
X-Google-Smtp-Source: ABdhPJzAgwXcB0KHIplrVqdpfaS8VOmrwW848F9e71enp8VB33pR/GG9zLflWD7oktfsLxaZ3F2PDQ==
X-Received: by 2002:a05:6808:118c:: with SMTP id j12mr7746018oil.65.1633698314656;
        Fri, 08 Oct 2021 06:05:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 63sm343194oih.14.2021.10.08.06.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 06:05:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>,
        "Javier S . Pedro" <debbugs@javispedro.com>
References: <20211008003302.1461733-1-linux@roeck-us.net>
 <9b9c797c-04f1-0ccf-b6fe-e9f1e4f5c17d@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] Revert "watchdog: iTCO_wdt: Account for rebooting on
 second timeout"
Message-ID: <66dece5d-d2e2-c3e0-3d7a-565385fe5003@roeck-us.net>
Date:   Fri, 8 Oct 2021 06:05:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9b9c797c-04f1-0ccf-b6fe-e9f1e4f5c17d@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/8/21 12:52 AM, Jan Kiszka wrote:
> On 08.10.21 02:33, Guenter Roeck wrote:
>> This reverts commit cb011044e34c ("watchdog: iTCO_wdt: Account for
>> rebooting on second timeout") and commit aec42642d91f ("watchdog: iTCO_wdt:
>> Fix detection of SMI-off case") since those patches cause a regression
>> on certain boards (https://bugzilla.kernel.org/show_bug.cgi?id=213809).
>>
>> While this revert may result in some boards to only reset after twice
>> the configured timeout value, that is still better than a watchdog reset
>> after half the configured value.
>>
>> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
>> Fixes: aec42642d91f ("watchdog: iTCO_wdt: Fix detection of SMI-off case")
>> Cc: Jan Kiszka <jan.kiszka@siemens.com>
>> Cc: Mantas Mikulėnas <grawity@gmail.com>
>> Reported-by: Javier S. Pedro <debbugs@javispedro.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/watchdog/iTCO_wdt.c | 12 +++---------
>>   1 file changed, 3 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>> index 643c6c2d0b72..ced2fc0deb8c 100644
>> --- a/drivers/watchdog/iTCO_wdt.c
>> +++ b/drivers/watchdog/iTCO_wdt.c
>> @@ -71,8 +71,6 @@
>>   #define TCOBASE(p)	((p)->tco_res->start)
>>   /* SMI Control and Enable Register */
>>   #define SMI_EN(p)	((p)->smi_res->start)
>> -#define TCO_EN		(1 << 13)
>> -#define GBL_SMI_EN	(1 << 0)
>>   
>>   #define TCO_RLD(p)	(TCOBASE(p) + 0x00) /* TCO Timer Reload/Curr. Value */
>>   #define TCOv1_TMR(p)	(TCOBASE(p) + 0x01) /* TCOv1 Timer Initial Value*/
>> @@ -357,12 +355,8 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>>   
>>   	tmrval = seconds_to_ticks(p, t);
>>   
>> -	/*
>> -	 * If TCO SMIs are off, the timer counts down twice before rebooting.
>> -	 * Otherwise, the BIOS generally reboots when the SMI triggers.
>> -	 */
>> -	if (p->smi_res &&
>> -	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>> +	/* For TCO v1 the timer counts down twice before rebooting */
>> +	if (p->iTCO_version == 1)
>>   		tmrval /= 2;
>>   
>>   	/* from the specs: */
>> @@ -527,7 +521,7 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
>>   		 * Disables TCO logic generating an SMI#
>>   		 */
>>   		val32 = inl(SMI_EN(p));
>> -		val32 &= ~TCO_EN;	/* Turn off SMI clearing watchdog */
>> +		val32 &= 0xffffdfff;	/* Turn off SMI clearing watchdog */
>>   		outl(val32, SMI_EN(p));
>>   	}
>>   
>>
> 
> Sigh, how broken is this architecture of the iTCO? Agreed, this leaves
> no option then.
> 
> BTW, the fact that we saw an inconsistency in read-back timeout
> indicates that there is still an issue for the remaining /= 2 case
> (means v1), but I'm loosing interest in fixing those issues, given how
> hard it is to test broadly without breaking users first.
> 

Agreed. This is because the /=2 handling is only implemented in
iTCO_wdt_set_timeout() without matching code in iTCO_wdt_get_timeleft().
I don't have hardware to test, so I am not going to touch that code
myself. We can address that if/when someone reports the actual problem
and has the ability to test a fix.

Thanks,
Guenter



Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8EE3FBD3D
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Aug 2021 22:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233986AbhH3UBU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Aug 2021 16:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233423AbhH3UBT (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Aug 2021 16:01:19 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE867C061575;
        Mon, 30 Aug 2021 13:00:25 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso19914668ots.5;
        Mon, 30 Aug 2021 13:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=mA95KUP0dYKYEnYZnEFeu7CCPib9IonakfUcwEE/oNw=;
        b=pOjLWxcC6TZyp0PNKbMFVHrbtffNwVR+PSEUdvVN96tugh2yf6nPx4fuxjYjBknWxo
         wIuG2VQoerR3QSoZ85GLtgByveplnptziB2bAxZOL9JVN245t71ZklyaB5XyGvHS+EJK
         jYIkBnEHmkUvyJgmbJ85EM2L4/VDQ0C0mPQd8qBGklaI2LxM1hJcIiKWRKJ1PjHiEZ57
         ojM67wIRS3PRPQojQQuIe9ePPEjmDIyuxtliAyMz0dR7gZZtO1bUddhKJyfxnpu98aAr
         DakS/V2V7aj+d/ZshZU53eT+WKvBfGKTjj+J6XQzlyOrIdDxOXyBGMe561GyoGVrbpRi
         8Q3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mA95KUP0dYKYEnYZnEFeu7CCPib9IonakfUcwEE/oNw=;
        b=KiYvjmkixOWzRs+hIYSMDOEg3y+ipn0LrEJFzIj2c3/1XFZ7VLf7SNBJcVkp6W7jlx
         1A6Dpq5P1tM2GQwLMbQ0rNcQiypGUTy3a3j24Q+BwsF4adc1stnjB2NkpgHUa+Uppra/
         UNwPSid/zis3woJ2MRrlm3ua2g8IIgIl9XfH+T1NOYvql/QUZ5t4yJvfz16axB70PZER
         pwzCXEA6g3Le3VCp7Rl4VmGOVuX1l+vsYb4xIeB8An2s8Rx1ET87/hMfOgumB5bDkWMU
         BX+rwqGk2QzdZ1921exPhStDqbJ/uIdgCUHTMO98u1SZuAC94LyUXcmDcZfjoMAJL4xC
         jJAg==
X-Gm-Message-State: AOAM530OZg+CxPJbdT2IoOj8dYi2e0K0kHy2ye6XTnXWFfgbDio3oo3R
        kCaceV3RB2/3NBYxh4fWYpE=
X-Google-Smtp-Source: ABdhPJzu9t6ULQDN9iPuR1EwZkartl+sZ7v42aI2K8dwtEpW2CpzhjgTbqrl3Dog7smMDFurjtOKzA==
X-Received: by 2002:a05:6830:4124:: with SMTP id w36mr21016879ott.72.1630353625041;
        Mon, 30 Aug 2021 13:00:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z78sm3106348ooa.29.2021.08.30.13.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Aug 2021 13:00:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Fix detection of SMI-off case
To:     Jan Kiszka <jan.kiszka@siemens.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Christian Storm <christian.storm@siemens.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?Q?Mantas_Mikul=c4=97nas?= <grawity@gmail.com>
References: <d84f8e06-f646-8b43-d063-fb11f4827044@siemens.com>
 <1444efd5-b778-949b-34e8-99d2541350e9@siemens.com>
 <85c2c85e-147c-b54e-e84d-10b989610979@siemens.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <904ea225-e7de-a11a-419a-0c7ac05e9b6e@roeck-us.net>
Date:   Mon, 30 Aug 2021 13:00:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <85c2c85e-147c-b54e-e84d-10b989610979@siemens.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/30/21 12:47 PM, Jan Kiszka wrote:
> On 20.08.21 15:45, Jan Kiszka wrote:
>> On 26.07.21 13:46, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> Obviously, the test needs to run against the register content, not its
>>> address.
>>>
>>> Fixes: cb011044e34c ("watchdog: iTCO_wdt: Account for rebooting on second timeout")
>>> Reported-by: Mantas Mikulėnas <grawity@gmail.com>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>>   drivers/watchdog/iTCO_wdt.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
>>> index b3f604669e2c..643c6c2d0b72 100644
>>> --- a/drivers/watchdog/iTCO_wdt.c
>>> +++ b/drivers/watchdog/iTCO_wdt.c
>>> @@ -362,7 +362,7 @@ static int iTCO_wdt_set_timeout(struct watchdog_device *wd_dev, unsigned int t)
>>>   	 * Otherwise, the BIOS generally reboots when the SMI triggers.
>>>   	 */
>>>   	if (p->smi_res &&
>>> -	    (SMI_EN(p) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>>> +	    (inl(SMI_EN(p)) & (TCO_EN | GBL_SMI_EN)) != (TCO_EN | GBL_SMI_EN))
>>>   		tmrval /= 2;
>>>   
>>>   	/* from the specs: */
>>>
>>
>> Ping, this is still missing in master. Stable kernels had the revert,
>> but 5.14 will need this.
>>
> 
> Second reminder: 5.14 is out and now broken. Is the patch queued
> somewhere? I do not see it in the watchdog staging branch.
> 

I had it in my own watchdog-next branch for about a month.
Usually Wim picks it up from there or from the mainling list;
he handles all upstreaming. Wim ?

Guenter

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD469471727
	for <lists+linux-watchdog@lfdr.de>; Sat, 11 Dec 2021 23:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhLKW2F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 11 Dec 2021 17:28:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhLKW2F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 11 Dec 2021 17:28:05 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A074C061714;
        Sat, 11 Dec 2021 14:28:05 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id 7so18134584oip.12;
        Sat, 11 Dec 2021 14:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s26melcoJrCidVbqx79S5qGLEKqpilbd+ljQbRAxhuE=;
        b=EAIwZuwsdtaWo1HQrjvx+z2S/JOBORKzx1uRsbjui8+S9Xsz4hb8FGrF3j54TtwPc7
         7F9FKCFnrmWiwwe9ypifMscaAfANA86u29Q4pssKHV7tEhonPAcBBJLRy+HfkBPtpMLB
         ZWeZhn0Xy/iKmwOmlyoSaQj1N9KLHFB7pdNe8np5o9Rj6TLRp+MsRL3uCkUcj5Gr3Kmn
         8Ts3d/I5jaE2N+roniJM+VHvpIuuXqP6ZfrJb2qKRh83JnKR1x3Xic2EhDGAhvREKYRS
         bGKyqXJEzzLW57zVcQXGn87lT7k2csFwIErYVFZxByykXkcGLAnlGR+DYle85Rf8H0gI
         iCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s26melcoJrCidVbqx79S5qGLEKqpilbd+ljQbRAxhuE=;
        b=6Wms+/rabXJfKpYZwhdZ2MSVo6cRFPyFJlr0pVP0VQr33+/TjWNRl41XLERLWAu4OJ
         P1C0OCxWaS33U1b/1unkA0MMIW9dPIkfgSHbHVoRKUW7WMkYQerwSrdZ+KM0uFhJfCX0
         jNdakNwF/jJM8QkMDKjk/3c7Ycne3irAUyuAf11ZhBgqCjbRLXvwE7TELOuzk//2xf8K
         KiTiKtoLCRYaNamX7EKRBwmSZ2MOLs5SUOY4QzIER27ib15nxpXq9KphgCUH7hkpT57T
         KHx0nkkU0Qg+sm8afamakNpj65eCIFdit8ES+tcdyPVaKguxAarOLfnfeGCMZq92AgkU
         lTnA==
X-Gm-Message-State: AOAM530ZFYF4E5Y279jiLlSmZALgI+ePQfmC+TlB6grG6xrGyaRxQbkh
        7GcQLwP6WuZM9cCUEpeW5NBpe77x7c4=
X-Google-Smtp-Source: ABdhPJw2Uqp7K/PK1HARbbH2Lm40wVBAPyMOIYKe6tdwyAaGNAKhxyX8VdUtKPb1kYIwYmPd7Xr2ZA==
X-Received: by 2002:a05:6808:2216:: with SMTP id bd22mr19601525oib.27.1639261684214;
        Sat, 11 Dec 2021 14:28:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e4sm243360oiy.12.2021.12.11.14.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Dec 2021 14:28:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 3/4] watchdog: rzg2l_wdt: Add set_timeout callback
From:   Guenter Roeck <linux@roeck-us.net>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <20211211212617.19639-1-biju.das.jz@bp.renesas.com>
 <20211211212617.19639-3-biju.das.jz@bp.renesas.com>
 <4d5f3e8d-ff4d-27a1-d0b5-55be69d025c2@roeck-us.net>
Message-ID: <4ab667fa-2d89-53c8-edd8-a0b5e4305e80@roeck-us.net>
Date:   Sat, 11 Dec 2021 14:28:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <4d5f3e8d-ff4d-27a1-d0b5-55be69d025c2@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/21 1:38 PM, Guenter Roeck wrote:
> On 12/11/21 1:26 PM, Biju Das wrote:
>> Add support for set_timeout() callback.
>>
> This needs an explanation. WDIOF_SETTIMEOUT is, after all,
> already supported. I can see that 'count' is not recalculated,
> so that is one of the reasons. However, it also needs to be explained
> why it is necessary to stop and restart the watchdog.
> 
>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>> ---
>>   drivers/watchdog/rzg2l_wdt.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
>> index 58fe4efd9a89..c81b9dd05e63 100644
>> --- a/drivers/watchdog/rzg2l_wdt.c
>> +++ b/drivers/watchdog/rzg2l_wdt.c
>> @@ -117,6 +117,15 @@ static int rzg2l_wdt_stop(struct watchdog_device *wdev)
>>       return 0;
>>   }
>> +static int rzg2l_wdt_set_timeout(struct watchdog_device *wdev, unsigned int timeout)
>> +{
>> +    wdev->timeout = timeout;
>> +    rzg2l_wdt_stop(wdev);
>> +    rzg2l_wdt_start(wdev);
> 
> Is it necessary to stop and restart the timeout, or would it be sufficient
> to call rza_wdt_calc_timeout() ? If it is necessary, please add a comment

That should have been rzg2l_wdt_init_timeout(). Also, as mentioned in
the second patch of the series, the return value of rzg2l_wdt_start()
needs to be checked if the watchdog needs to be stopped and restarted.

Thanks,
Guenter

> describing the reason.
> 
> Either case, calling rzg2l_wdt_start() unconditionally is wrong because
> the watchdog might be stopped.
> 
> Guenter
> 
>> +
>> +    return 0;
>> +}
>> +
>>   static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>>                    unsigned long action, void *data)
>>   {
>> @@ -160,6 +169,7 @@ static const struct watchdog_ops rzg2l_wdt_ops = {
>>       .start = rzg2l_wdt_start,
>>       .stop = rzg2l_wdt_stop,
>>       .ping = rzg2l_wdt_ping,
>> +    .set_timeout = rzg2l_wdt_set_timeout,
>>       .restart = rzg2l_wdt_restart,
>>   };
>>
> 


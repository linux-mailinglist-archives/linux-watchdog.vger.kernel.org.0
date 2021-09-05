Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0CF5401207
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Sep 2021 00:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232628AbhIEW6F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Sep 2021 18:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230085AbhIEW6E (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Sep 2021 18:58:04 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A98C061575
        for <linux-watchdog@vger.kernel.org>; Sun,  5 Sep 2021 15:57:01 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id t2-20020a4ae9a2000000b0028c7144f106so1470600ood.6
        for <linux-watchdog@vger.kernel.org>; Sun, 05 Sep 2021 15:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=I5kntSdqd6qlFEB/C32n7V2FQql10S3sSTj+3GC16KY=;
        b=lRskhOxxtMymF758KFP2JPwCplTC+BYrgcocCmtmk6CG6vzSEhcz30BWoNFShmF3cg
         5wRV+RA2PWf3fUWG6+Z+gH8CHY37eH36cc67K975hWQleojpLfGO9QVIKmr+Ufluy17n
         WTFpUDORzRe72El65WFe+U7hBOl7VdYl0QrDOa+55ny4jgzeZoKVGCtNbrRJTrkOAKmK
         cA5w7qxnX7LUTKmMCvJ9mbbgmOyGPB12ubqLhOmnfV6S5ZsvFfZ5ldoTPuqnl/ZneZFl
         U0cIHBiwVgjNco0tQq0pbElxZCw/oth/7mN1eNYzh312+8MEwyhpX4IZtjasnJpHvhMa
         fVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I5kntSdqd6qlFEB/C32n7V2FQql10S3sSTj+3GC16KY=;
        b=H3Wmv34qz2+V4bnSBMMxA7kcXyo8qHpaWopCVr+/aOFL7We7Yoi+8FExo7Valbzkp1
         HB9BQU14AGqXgWIVIUJuf4aif6ujBt1BSuprZaWNjiyy8EwW76Gfw3rVLnF3onqjA00Q
         YcxDdTv2XMdCNpH1UwqL3jthvOBsge4Hvt8ZePMBuSRGd7Cwjezx4fgRyoVrmHZI9+Nl
         nqlzptAKFfPcRjgeaX0Rx/EFHKSA1wRhOKJ/SWe7LoGADHvHbrJ5HvYb+97SMBVciWxY
         XT//PvCn9+pQcXelAnlJ8SAd76mdEzDHpWmsDX9CjpGor+aZyk6+nY6NeAP5XSnFM3Nj
         ooQg==
X-Gm-Message-State: AOAM533fFg/qVNW6BN2o19Rv1nlOSQTkqt9V6Px0aQVYpKHZPnDNoucP
        +SdeeWz9NzThY6fYBrCtH4Sb5xkgonM=
X-Google-Smtp-Source: ABdhPJxlP4klFSSsp1zPGV3W1z+BWZlwC3nrNk/MAZ32Fg4ai657weJnXs9SgpzP/pm0Y6RDqCeO6A==
X-Received: by 2002:a4a:5241:: with SMTP id d62mr11766252oob.9.1630882620126;
        Sun, 05 Sep 2021 15:57:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c10sm1441093ots.48.2021.09.05.15.56.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Sep 2021 15:56:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: was [Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout
 feature]
To:     "Klein, Curtis" <curtis.klein@hpe.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
Cc:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
 <67d601c9-8f95-cb10-40df-4d962ec6f9ba@kernel.org>
 <7fdd262e-84fb-0c34-baa9-162130f1e109@roeck-us.net>
 <85ce6068-c98e-dbe0-a4b6-5c877b460f64@kernel.org>
 <54d77fb1-2531-c6ed-738e-9f661443b097@kernel.org>
 <CS1PR8401MB1270909863CE345530C9FFFB89D19@CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ab0b4ca3-28f4-227b-faf8-984ca1d8fbe5@roeck-us.net>
Date:   Sun, 5 Sep 2021 15:56:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CS1PR8401MB1270909863CE345530C9FFFB89D19@CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/5/21 3:22 PM, Klein, Curtis wrote:
> On 9/4/21, 1:19AM, Jiri Slaby wrote:
>> On 04. 09. 21, 10:16, Jiri Slaby wrote:
>>> On 02. 09. 21, 16:05, Guenter Roeck wrote:
>>>> On 9/1/21 11:55 PM, Jiri Slaby wrote:
>>>>> On 03. 02. 21, 21:11, Curtis Klein wrote:
>>>>>> This adds the option to use a hrtimer to generate a watchdog pretimeout
>>>>>> event for hardware watchdogs that do not natively support watchdog
>>>>>> pretimeouts.
>>>>>>
>>>>>> With this enabled, all watchdogs will appear to have pretimeout support
>>>>>> in userspace. If no pretimeout value is set, there will be no change in
>>>>>> the watchdog's behavior.
>>>>>
>>>>> Hi,
>>>>>
>>>>> on my Dell Latitude 7280, CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT=y causes
>>>>> all reboot, kexec, suspend to panic. Disabling that option makes it
>>>>> all work again. Provided it happens very late in the process, I don't
>>>>> know how to grab some logs...
>>>>>
>>>>> Any ideas?
>>>>>
>>>>
>>>> AFAICS the timer does not stop on reboot. I think we'll need to
>>>> augment the code
>>>> to do that.
>>>
>>> No, it is stopped via device unregister -> watchdog_dev_unregister ->
>>> watchdog_cdev_unregister -> watchdog_hrtimer_pretimeout_stop.
>>>
>>> But look:
>>> watchdog_cdev_unregister
>>>     -> wdd->wd_data = NULL;
>>>     -> watchdog_hrtimer_pretimeout_stop
>>>       -> hrtimer_cancel(&wdd->wd_data->pretimeout_timer);
>>>
>>> The diff below obviously fixes the issue,
>>
>> Which is exactly a -next commit:
>> commit c7b178dae139f8857edc50888cfbf251cd974a38
>> Author: Curtis Klein <curtis.klein@hpe.com>
>> Date:   Tue Jun 22 23:26:23 2021 -0700
>>
>>       watchdog: Fix NULL pointer dereference when releasing cdev
>>
>>> --- a/drivers/watchdog/watchdog_dev.c
>>> +++ b/drivers/watchdog/watchdog_dev.c
>>> @@ -1096,6 +1096,8 @@ static void watchdog_cdev_unregister(struct
>>> watchdog_device *wdd)
>>>                   watchdog_stop(wdd);
>>>           }
>>>
>>> +       watchdog_hrtimer_pretimeout_stop(wdd);
>>> +
>>>           mutex_lock(&wd_data->lock);
>>>           wd_data->wdd = NULL;
>>>           wdd->wd_data = NULL;
>>> @@ -1103,7 +1105,6 @@ static void watchdog_cdev_unregister(struct
>>> watchdog_device *wdd)
>>>
>>>           hrtimer_cancel(&wd_data->timer);
>>>           kthread_cancel_work_sync(&wd_data->work);
>>> -       watchdog_hrtimer_pretimeout_stop(wdd);
>>>
>>>           put_device(&wd_data->dev);
>>>    }
>>>
>>> thanks,
>>
>>
>> --
>> js
>> suse labs
> 
> Does it still make sense to stop the timer on reboot or suspend?
> 
> I haven't had any problems with rebooting but I haven't been able to test
> suspending.
> 
Only if it is really a problem.

Guenter


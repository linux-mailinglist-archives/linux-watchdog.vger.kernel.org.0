Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5509931FC04
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Feb 2021 16:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhBSPdr (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 19 Feb 2021 10:33:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbhBSPdo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 19 Feb 2021 10:33:44 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 828EFC061756;
        Fri, 19 Feb 2021 07:33:03 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id x19so1339139ooj.10;
        Fri, 19 Feb 2021 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dZWzjwDwgpes2J1nXakSGE31X2/pA1LAQ1abCPN1fNY=;
        b=MNVXZGXB6jjL2r9vEv/Z/gvjxtcMRL8Xgum2SHszl1ADw6t/WF5ebqP3DQVXgwpXWM
         9iqS5EuFeEGVUu+d/QNOwpxCw8GdHWqKbxvGRIrpP7OG7c2OCTwqVN1DnmbGrBuzYWBw
         kzV8Qlk4n5TY9huq6iSHlZQFcjasdmslg0q9lTRhUuvbPiRCANiW4LChuTcXQpC0WDzh
         BP+VBtNhzhffhkUXLo017R4Ao1DCI+VyRGRptWareJoELGm28yt0Sts1dCL73JMbTGQh
         Xmfw65BuvDvi4vtWV2diujRj9uvSfYe57La3HCcuPHe+uVVBH4u+FzhzoNQPltYQ2FXL
         7gTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=dZWzjwDwgpes2J1nXakSGE31X2/pA1LAQ1abCPN1fNY=;
        b=IVVET25VysGthIcCaMCOVkvFjH+zn7eCSSPFpxutZq0asR12Ou2ZOtJpsiOcUvqogg
         NRxj/oRfj62LMdDgH7Gj8VE8+OHNgRtaWzXRK5L3KR62v5gSoumRZsxuLoQ7+WddSSQS
         JzzDTVmAumOMs/ZKz19Vbc1+PQcpd6oTdBqvZge2J8smOGUM5Z3YIgG62qOoaCHRXsLH
         jDVeGGzXesb9l06WJGGNbdAzdiIxjYWKjqRP08IZHmN/xiq1WgEgMXEvbayzHGCFJy1I
         HOuyz80jAoldYqp8NBjdtDi+t1ypZDZpHkNRQNuAW6h6n35yMNT+EkI68m0r2tjlbvm4
         RmNQ==
X-Gm-Message-State: AOAM531MSNNfRmfKFXj8gIv9xiRwGt0ELUQ9WOjEJQa9CZsOmPm2TnXW
        5z3l5GoKJNuIXPjbY17pr3HgOrHkyus=
X-Google-Smtp-Source: ABdhPJyQ8Z8wZkHkNSUVPitBa+XXjdUl33017x8EqVsoIvhBFMtt4h5z6kLVoiX6f+pSdMer2F+npg==
X-Received: by 2002:a4a:a381:: with SMTP id s1mr6033258ool.60.1613748782432;
        Fri, 19 Feb 2021 07:33:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v20sm509831oie.2.2021.02.19.07.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 07:33:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: R: [PATCH v1] watchdog: wdat: add param. to start wdog on module
 insertion
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210218163200.1154812-1-f.suligoi@asem.it>
 <20210219105447.GI2542@lahna.fi.intel.com>
 <bf4e89bd11964f2e9f621f949adc338b@asem.it>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <4ed7ec8c-d5bf-41b8-96c4-b34db670315d@roeck-us.net>
Date:   Fri, 19 Feb 2021 07:32:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bf4e89bd11964f2e9f621f949adc338b@asem.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/19/21 6:01 AM, Flavio Suligoi wrote:
> Hi Mika,
> 
>>>  	 const struct wdat_instruction *instr, u32 *value)
>>>  {
>>> @@ -437,6 +443,8 @@ static int wdat_wdt_probe(struct platform_device
>> *pdev)
>>>  	}
>>>
>>>  	wdat_wdt_boot_status(wdat);
>>> +	if (start_enabled)
>>> +		wdat_wdt_start(&wdat->wdd);
>>
>> No objections to this if it is really needed. However, I think it is
>> better start the watchdog after devm_watchdog_register_device() has been
>> called so we have everything initialized.
> 
> Yes, it is needed. We need this feature to enable the watchdog
> as soon as possible and this is essential for unmanned applications,
> such as routers, water pumping stations, climate data collections,
> etc.  
> 
FWIW, in your use case the watchdog should be enabled in the
BIOS/ROMMON.

> Right, ok for the correct positioning of the wdat_wdt_start function
> at the end of the watchdog device initialization. Thanks!
> 

No, it isn't, because it won't set WDOG_HW_RUNNING, and the
watchdog core won't know that the watchdog is running.
The watchdog has to be started before the call to
wdat_wdt_set_running(). If that isn't possible with the
current location of wdat_wdt_set_running(), then
wdat_wdt_set_running() has to be moved accordingly.
Either case, both have to be called before calling
devm_watchdog_register_device().

Having said that, I'd prefer to have a module parameter
in the watchdog core. We already have a number of similar
module parameters in various drivers, all named differently,
and I'd rather not have more.

Guenter

>>
>>>  	wdat_wdt_set_running(wdat);
>>>
>>>  	ret = wdat_wdt_enable_reboot(wdat);
>>> --
>>> 2.25.1
> 
> Regards,
> Flavio
> 


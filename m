Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6FB616A818
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 15:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727539AbgBXOPV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Feb 2020 09:15:21 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46185 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727489AbgBXOPV (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Feb 2020 09:15:21 -0500
Received: by mail-pl1-f196.google.com with SMTP id y8so4100779pll.13;
        Mon, 24 Feb 2020 06:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ubnVVT6qI7uXjPc1KQmojOU0uY/xl8NGz3VGIX5HNBc=;
        b=SFl8sfij2SzuzRD/MqxHZCrFH3Kt3RLYSp33JZO30sqPxNMDzLj+mmvl0Ubpxv5VQH
         WlU+ckd1Bv4C9Zmy+9fQIW4KvWcXx7izP6YMT7VuBt356HjETVFGBcYuN+xxM2KR8Zbw
         +Re8EvV6pdushQliODKSJ90UMzSe2l8Kf2b2Zk8nd0P7e3GjNmzJQrZfBf1gAhieumS/
         RMtAd5UrJWoRQQSrqOSozOK9aY/+5MO9mZx2gBCAodH2CwTRhf6R6TBfYzGYVN4KVcxT
         keIz6Zoc9pzYfHet7yyntrC4X/bS5fzpY1K94cxNti1P0Ww64BOF4FdJgiFbgEwNdb5u
         cV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ubnVVT6qI7uXjPc1KQmojOU0uY/xl8NGz3VGIX5HNBc=;
        b=ihYlqkGj9mEAMVhNx1hr4D9o3YOMau9uMj1YfsT1gJoHpuFHWw79XvGL29gIzy3dJY
         36b3an46brVWP8JObd0b6LFzDn4tw6UTbUMrbavYFBzF4hWS5kWPxoABkwdLunLSIomY
         KZWl2cZ1gECOQhsWNowAUbBwkbe/Y2Xv2C6cS1zH/cDwO3hfgU3mD3yDGAYoU/o1AmxS
         0pCC8N6Xbn+WpSp33UySM/m1xkmVPLZ66cla6U2ilIj0odqCgUi0QDeOLat3ww6XI2XV
         IIJV6se/Vj5riFaucwTMuJRQDo5rokeSdnRlKfG/VWwSa2VMFBqbQObEygQfhMMBWmH0
         dqpw==
X-Gm-Message-State: APjAAAXbz822tov+aFZnwO9coJ0bC2lFhajEtbeIn4bxPuMawvHj4tr3
        r9YYreiVXIiPPhDK1ivqtE8=
X-Google-Smtp-Source: APXvYqwXN5Q+WIqw9lgTr9ImuUegHgpzk3JW2OBJbZvQqEUTnnkuLgM1HXf28ZOfeWIVE3AfwuwgHQ==
X-Received: by 2002:a17:902:bb93:: with SMTP id m19mr51549174pls.310.1582553720077;
        Mon, 24 Feb 2020 06:15:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w14sm13074074pgi.22.2020.02.24.06.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2020 06:15:19 -0800 (PST)
Subject: Re: [PATCH] watchdog: imx2_wdt: Drop .remove callback
To:     Anson Huang <anson.huang@nxp.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
References: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
 <20200224102211.clzqw4vtzc4nz5df@pengutronix.de>
 <DB3PR0402MB391637EB54A1FD37059FBE47F5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <33c3778f-fc7e-8564-f767-91aafae03122@roeck-us.net>
Date:   Mon, 24 Feb 2020 06:15:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB391637EB54A1FD37059FBE47F5EC0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/24/20 3:44 AM, Anson Huang wrote:
> Hi, Uwe
> 
>> Subject: Re: [PATCH] watchdog: imx2_wdt: Drop .remove callback
>>
>> On Mon, Feb 24, 2020 at 10:51:27AM +0800, Anson Huang wrote:
>>> .remove callback implementation doesn' call clk_disable_unprepare()
>>> which is buggy, actually, we can just use
>>> devm_watchdog_register_device() and
>>> devm_add_action_or_reset() to handle all necessary operations for
>>> remove action, then .remove callback can be dropped.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>>   drivers/watchdog/imx2_wdt.c | 37
>>> ++++++++++---------------------------
>>>   1 file changed, 10 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
>>> index f8d58bf..1fe472f 100644
>>> --- a/drivers/watchdog/imx2_wdt.c
>>> +++ b/drivers/watchdog/imx2_wdt.c
>>> @@ -244,6 +244,11 @@ static const struct regmap_config
>> imx2_wdt_regmap_config = {
>>>   	.max_register = 0x8,
>>>   };
>>>
>>> +static void imx2_wdt_action(void *data) {
>>> +	clk_disable_unprepare(data);
>>
>> Does this have the effect of stopping the watchdog? Maybe we can have a
>> more expressive function name here (imx2_wdt_stop_clk or similar)?
> 
> This action is ONLY called when probe failed or device is removed, and if watchdog
> is running, the core driver will prevent it from being removed.
> 
>>
>> Is there some watchdog core policy that tells if the watchdog should be
>> stopped on unload?
> 
> watchdog_stop_on_unregister() should be called in .probe function to make core
> policy stop the watchdog before removing it, but I think this driver does NOT call
> it, maybe I should add the API call, need Guenter to help confirm.
> 
The driver doesn't have a stop function, which implies that the watchdog
can not be stopped once started. Calling watchdog_stop_on_unregister()
seems to be pointless.

That also implies that the watchdog can not be unloaded after it has
been started since it can't be stopped. More on that below.

>>
>>> +}
>>> +
>>>   static int __init imx2_wdt_probe(struct platform_device *pdev)  {
>>>   	struct device *dev = &pdev->dev;
>>> @@ -292,6 +297,10 @@ static int __init imx2_wdt_probe(struct
>> platform_device *pdev)
>>>   	if (ret)
>>>   		return ret;
>>>
>>> +	ret = devm_add_action_or_reset(dev, imx2_wdt_action, wdev->clk);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>>   	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
>>>   	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ?
>> WDIOF_CARDRESET : 0;
>>>
>>> @@ -315,32 +324,7 @@ static int __init imx2_wdt_probe(struct
>> platform_device *pdev)
>>>   	 */
>>>   	regmap_write(wdev->regmap, IMX2_WDT_WMCR, 0);
>>>
>>> -	ret = watchdog_register_device(wdog);
>>> -	if (ret)
>>> -		goto disable_clk;
>>> -
>>> -	dev_info(dev, "timeout %d sec (nowayout=%d)\n",
>>> -		 wdog->timeout, nowayout);
>>
>> Does the core put this info in the kernel log? If not dropping it isn't obviously
>> right enough to be done en passant.
> 
> This is just an info for user which I think NOT unnecessary, so I drop it in this patch
> as well.
> 
>>
>>> -	return 0;
>>> -
>>> -disable_clk:
>>> -	clk_disable_unprepare(wdev->clk);
>>> -	return ret;
>>> -}
>>> -
>>> -static int __exit imx2_wdt_remove(struct platform_device *pdev) -{
>>> -	struct watchdog_device *wdog = platform_get_drvdata(pdev);
>>> -	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
>>> -
>>> -	watchdog_unregister_device(wdog);
>>> -
>>> -	if (imx2_wdt_is_running(wdev)) {
>>> -		imx2_wdt_ping(wdog);
>>> -		dev_crit(&pdev->dev, "Device removed: Expect reboot!\n");
>>> -	}
>>
>> I also wonder about this one. This changes the timing behaviour and so
>> IMHO shouldn't be done as a side effect of a cleanup patch.
> 
> Guenter has a comment of "use devm_watchdog_register_device(), and the watchdog subsystem
> should prevent removal if the watchdog is running ", so I thought no need to check the watchdog's
> status here, but after further check the core code of watchdog_cdev_unregister() function, I ONLY
> see it will check whether need to stop watchdog before unregister,
> 

I would suggest for someone to try and trigger this message, and let me know
how you did it. If the watchdog is running, it should not be possible to unload
the driver; attempts to unload it should result in -EBUSY. If it is possible
to unload the driver, there is a bug in watchdog core which will need to get
fixed.

> ...
> 
> 1083         if (watchdog_active(wdd) &&
> 1084             test_bit(WDOG_STOP_ON_UNREGISTER, &wdd->status)) {
> 1085                 watchdog_stop(wdd);
> 1086         }
> 
> Hi, Guenter
> 	Do you think watchdog_stop_on_unregister() should be called in .probe function to
> make watchdog stop before unregister?
> 
How would you expect the watchdog core to stop the watchdog
with no stop function in the driver ?

Thanks,
Guenter

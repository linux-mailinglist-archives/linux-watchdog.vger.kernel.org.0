Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AE90154621
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Feb 2020 15:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727828AbgBFO2x (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Feb 2020 09:28:53 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:51744 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFO2x (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Feb 2020 09:28:53 -0500
Received: by mail-pj1-f68.google.com with SMTP id fa20so54331pjb.1;
        Thu, 06 Feb 2020 06:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=W9ALG/NMrSP99dg/aoNyLPey5VzoAsXx3y2vXq62GYo=;
        b=rpIpws3O+HZ6Lc5x7VQmH9T+d9xppIoTRipGopSQPkoQS2xnsk3TLOQv4FtwQYzG3I
         k0y9r9KbPGTXDIOYe6G4qhsRv1jvyVSWILQVCBFe4z46lVIJ8zFerkNGvOnzFANm5EJP
         cALTN4f1ZUpo0iNdbF5ziyUro1SlI5gNgKsEVrbBQUpHgDIfTsvTtcvbQuuUUFCdYxGG
         IamcTadDO8iudiB5NoNCpik6T2unp0iTHGV9tQYFnPICFM4wKXpxVwvLh3C1QlbTaynq
         NjyM/gImrbOBZ/pmX7ydJ+8N/2ryNOaZV8QBIcgcMl1byItSYfUFXP9BZtNtaom2u7f1
         kdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=W9ALG/NMrSP99dg/aoNyLPey5VzoAsXx3y2vXq62GYo=;
        b=IDUnJNjWDM6mkaaAIfpE8UzWRCaWzNz7CODGlzrJs5PZ8E0vGxYwK8ZVSIkOpwS2Gl
         jupKsvQNDesQWClDkLLU5C5EAaAugk793NSwuDRmPi/wFpS6/ywgxRdrTRSEc08pNX0B
         mBR51PLIP+S7WqoDL61xMEKMglg5r9m7IH7B1hG4mZN1SL6Dwh2TdmHulc2hHHSmCseO
         nk5Smyt9lqYwwV5QzBPRhJ1Wuwzl1SYOW509IUzIpP+7k8vuiuKyb0YGcesghjUiWfWw
         WL1EebVSz5420nPL/EtltwP3n3BbasANBKTlLIOdRNoU+V1Xz4ti+87t//bGBW0dQsid
         AZcg==
X-Gm-Message-State: APjAAAWhuZ33Vfty7odHlLxjlip6So3LciL3lv4MTKeQRXpmsbGI2eJp
        OA1qK8x/8GtV2E4VhFToimc=
X-Google-Smtp-Source: APXvYqypBydYNQeTB/d0ng2TllaB9XhTxAS1bYyMp/rv9X9YNy19vLVchiY5bHtUHbFElaUXwPsUnw==
X-Received: by 2002:a17:902:fe10:: with SMTP id g16mr4009622plj.93.1580999332830;
        Thu, 06 Feb 2020 06:28:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g10sm3968225pgc.87.2020.02.06.06.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 06:28:52 -0800 (PST)
Subject: Re: [PATCH 3/3] watchdog: da9062: add power management ops
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     support.opensource@diasemi.com, robh+dt@kernel.org,
        lee.jones@linaro.org, stwiss.opensource@diasemi.com,
        Adam.Thomson.Opensource@diasemi.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-4-m.felsch@pengutronix.de>
 <20200123205132.GA13377@roeck-us.net>
 <20200206090010.ya6p2kvab452kedr@pengutronix.de>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <76f08a4c-b8cd-8efe-f122-aa1f48e79e91@roeck-us.net>
Date:   Thu, 6 Feb 2020 06:28:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200206090010.ya6p2kvab452kedr@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/6/20 1:00 AM, Marco Felsch wrote:
> Hi Guenter,
> 
> On 20-01-23 12:51, Guenter Roeck wrote:
>> On Wed, Jan 08, 2020 at 10:57:04AM +0100, Marco Felsch wrote:
>>> Disable the watchdog during suspend if it is enabled and re-enable it on
>>> resume. So we can sleep without the interruptions.
>>>
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> I got an kbuild email so I checked the linux-next master tree. On
> linux-next this patch isn't used instead the old v1 was used...
> 

FWIW, The subject line of this patch doesn't include "v2".

Guenter

> Regards,
>    Marco
> 
>>> ---
>>> v2:
>>> - add dlg,use-sw-pm check to differentiate between automatic and manual
>>>    disabling/enabling.
>>> ---
>>>   drivers/watchdog/da9062_wdt.c | 37 +++++++++++++++++++++++++++++++++++
>>>   1 file changed, 37 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/da9062_wdt.c b/drivers/watchdog/da9062_wdt.c
>>> index e149e66a6ea9..c9b9d6394525 100644
>>> --- a/drivers/watchdog/da9062_wdt.c
>>> +++ b/drivers/watchdog/da9062_wdt.c
>>> @@ -15,6 +15,7 @@
>>>   #include <linux/jiffies.h>
>>>   #include <linux/mfd/da9062/registers.h>
>>>   #include <linux/mfd/da9062/core.h>
>>> +#include <linux/property.h>
>>>   #include <linux/regmap.h>
>>>   #include <linux/of.h>
>>>   
>>> @@ -30,6 +31,7 @@ static const unsigned int wdt_timeout[] = { 0, 2, 4, 8, 16, 32, 65, 131 };
>>>   struct da9062_watchdog {
>>>   	struct da9062 *hw;
>>>   	struct watchdog_device wdtdev;
>>> +	bool use_sw_pm;
>>>   };
>>>   
>>>   static unsigned int da9062_wdt_timeout_to_sel(unsigned int secs)
>>> @@ -198,6 +200,8 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>>>   	if (!wdt)
>>>   		return -ENOMEM;
>>>   
>>> +	wdt->use_sw_pm = device_property_present(dev, "dlg,use-sw-pm");
>>> +
>>>   	wdt->hw = chip;
>>>   
>>>   	wdt->wdtdev.info = &da9062_watchdog_info;
>>> @@ -212,6 +216,7 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>>>   	watchdog_set_restart_priority(&wdt->wdtdev, 128);
>>>   
>>>   	watchdog_set_drvdata(&wdt->wdtdev, wdt);
>>> +	dev_set_drvdata(dev, &wdt->wdtdev);
>>>   
>>>   	ret = devm_watchdog_register_device(dev, &wdt->wdtdev);
>>>   	if (ret < 0)
>>> @@ -220,10 +225,42 @@ static int da9062_wdt_probe(struct platform_device *pdev)
>>>   	return da9062_wdt_ping(&wdt->wdtdev);
>>>   }
>>>   
>>> +static int __maybe_unused da9062_wdt_suspend(struct device *dev)
>>> +{
>>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>>> +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +	if (!wdt->use_sw_pm)
>>> +		return 0;
>>> +
>>> +	if (watchdog_active(wdd))
>>> +		return da9062_wdt_stop(wdd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int __maybe_unused da9062_wdt_resume(struct device *dev)
>>> +{
>>> +	struct watchdog_device *wdd = dev_get_drvdata(dev);
>>> +	struct da9062_watchdog *wdt = watchdog_get_drvdata(wdd);
>>> +
>>> +	if (!wdt->use_sw_pm)
>>> +		return 0;
>>> +
>>> +	if (watchdog_active(wdd))
>>> +		return da9062_wdt_start(wdd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static SIMPLE_DEV_PM_OPS(da9062_wdt_pm_ops,
>>> +			 da9062_wdt_suspend, da9062_wdt_resume);
>>> +
>>>   static struct platform_driver da9062_wdt_driver = {
>>>   	.probe = da9062_wdt_probe,
>>>   	.driver = {
>>>   		.name = "da9062-watchdog",
>>> +		.pm = &da9062_wdt_pm_ops,
>>>   		.of_match_table = da9062_compatible_id_table,
>>>   	},
>>>   };
>>
> 


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D82E2321EA
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jul 2020 17:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgG2PtQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jul 2020 11:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbgG2PtP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jul 2020 11:49:15 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4049C061794;
        Wed, 29 Jul 2020 08:49:15 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id c6so2047320pje.1;
        Wed, 29 Jul 2020 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=gLnaOO+zAY+8NlU+JjiWFf2IL/CZfK/QEDabV8C9b7o=;
        b=MjzyvjS+g0iu3rTZhiWOY6vBVfMn1XtoUyGLeHzgyZFkDiwRoY9Ng0+Eo+blFNAEKN
         XGM1cx1rpxlHAyFxqXUAUFO3nNGCTkJQ8HtfyGVGLO9xoLbLz1en6UuRIVdBOfpi/QrE
         23gzZ0xRZAmTcrZy1J+bfVuHEdsMB4Vl5YooHW+LT3fryCFEmqC623EEhd2icvjIq7zB
         FPTdn1g2gG7comzuk8cxpr3SR+PlrvMKLzZtyCIZq9UONCtlCu1QW2Ijx6kzVSd7oKZw
         5rjL7+OVMdINEFtqgqGmLv3ortSaKMcZJlk90tuvRU8L/cHXLzqtzJOh7Eo84av+4gSB
         ZzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=gLnaOO+zAY+8NlU+JjiWFf2IL/CZfK/QEDabV8C9b7o=;
        b=MmAiVkdQTEuQ0B2IEmdFSxX/XT7Gu33uDPifii/lSoPDxN4K8o2si6jvEC3Zjjqd2L
         2stYF2eWq5T8sc6uE8xQTaK9htUpcu3QXNyWs3mVRz+euUfUob0pI9iUqMwQKEJ4EXvM
         xoEMCpaEHW6C0sINZGPg0J3OZNzuQiauQk3EdM3YqMIhNgqxi4HYiV6ebOQdCi7KMNGx
         rM5zsjjwyCJIUQLiB01qzk5cgJrcYFf9HbY6diwnjK5afcOyiAgKK2V02KYrmYl1tIb1
         DZTNRHWYUUPCZLMUBmofy1crpjUrU0vcqB9jFHGsWxFdXtd1OXF2FSd9JfXkIVJV/rkO
         Jedw==
X-Gm-Message-State: AOAM531C+h9U2+7P63/gVBerFFEqHftPH26GKfrz6jQwrIKDX2yleEIg
        z0Tb8crH7FyGmoSpFlNbjuA=
X-Google-Smtp-Source: ABdhPJwj30BNrHgShCDgRrKFE5t6TVJTZEpfs4pUb3XX8t15TXPiVJDN1rSFX9roK0d8MU7OhbYHEg==
X-Received: by 2002:a17:90b:18b:: with SMTP id t11mr10478129pjs.105.1596037755366;
        Wed, 29 Jul 2020 08:49:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g19sm2693002pfb.152.2020.07.29.08.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2020 08:49:14 -0700 (PDT)
Subject: Re: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
 for wdog operations
To:     Anson Huang <anson.huang@nxp.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>
References: <1595989227-24700-1-git-send-email-Anson.Huang@nxp.com>
 <a7461ad9-cc73-d38b-d1a8-c1fe49b2031c@roeck-us.net>
 <DB3PR0402MB391641A2991A7651B72283D0F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <2e962b44-d1eb-f060-f1d2-a079322d4c22@roeck-us.net>
Date:   Wed, 29 Jul 2020 08:49:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB3PR0402MB391641A2991A7651B72283D0F5700@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/20 8:32 AM, Anson Huang wrote:
> Hi, Guenter
> 
> 
>> Subject: Re: [PATCH V2 1/2] watchdog: imx7ulp: Strictly follow the sequence
>> for wdog operations
>>
>> On 7/28/20 7:20 PM, Anson Huang wrote:
>>> According to reference manual, the i.MX7ULP WDOG's operations should
>>> follow below sequence:
>>>
>>> 1. disable global interrupts;
>>> 2. unlock the wdog and wait unlock bit set; 3. reconfigure the wdog
>>> and wait for reconfiguration bit set; 4. enabel global interrupts.
>>>
>>> Strictly follow the recommended sequence can make it more robust.
>>>
>>> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>>> ---
>>> Changes since V1:
>>> 	- use readl_poll_timeout_atomic() instead of usleep_ranges() since IRQ is
>> disabled.
>>> ---
>>>  drivers/watchdog/imx7ulp_wdt.c | 29 +++++++++++++++++++++++++++++
>>>  1 file changed, 29 insertions(+)
>>>
>>> diff --git a/drivers/watchdog/imx7ulp_wdt.c
>>> b/drivers/watchdog/imx7ulp_wdt.c index 7993c8c..7d2b12e 100644
>>> --- a/drivers/watchdog/imx7ulp_wdt.c
>>> +++ b/drivers/watchdog/imx7ulp_wdt.c
>>> @@ -5,6 +5,7 @@
>>>
>>>  #include <linux/clk.h>
>>>  #include <linux/io.h>
>>> +#include <linux/iopoll.h>
>>>  #include <linux/kernel.h>
>>>  #include <linux/module.h>
>>>  #include <linux/of.h>
>>> @@ -36,6 +37,7 @@
>>>  #define DEFAULT_TIMEOUT	60
>>>  #define MAX_TIMEOUT	128
>>>  #define WDOG_CLOCK_RATE	1000
>>> +#define WDOG_WAIT_TIMEOUT	10000
>>>
>>>  static bool nowayout = WATCHDOG_NOWAYOUT;
>> module_param(nowayout,
>>> bool, 0000); @@ -48,17 +50,31 @@ struct imx7ulp_wdt_device {
>>>  	struct clk *clk;
>>>  };
>>>
>>> +static inline void imx7ulp_wdt_wait(void __iomem *base, u32 mask) {
>>> +	u32 val = readl(base + WDOG_CS);
>>> +
>>> +	if (!(val & mask))
>>> +		WARN_ON(readl_poll_timeout_atomic(base + WDOG_CS, val,
>>> +						  val & mask, 0,
>>> +						  WDOG_WAIT_TIMEOUT));
>>> +}
>>> +
>>>  static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool
>>> enable)  {
>>>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>>>
>>>  	u32 val = readl(wdt->base + WDOG_CS);
>>>
>>> +	local_irq_disable();
>>>  	writel(UNLOCK, wdt->base + WDOG_CNT);
>>> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
>>>  	if (enable)
>>>  		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
>>>  	else
>>>  		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
>>> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
>>> +	local_irq_enable();
>>>  }
>>>
>>>  static bool imx7ulp_wdt_is_enabled(void __iomem *base) @@ -72,7
>>> +88,12 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)  {
>>>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>>>
>>> +	local_irq_disable();
>>> +	writel(UNLOCK, wdt->base + WDOG_CNT);
>>> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
>>>  	writel(REFRESH, wdt->base + WDOG_CNT);
>>> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
>>
>> Per reference manual (section 59.5.4), the waits are not required here, and
>> neither is the unlock. For practical purposes, disabling interrupts is useless as
>> well since the refresh write operation is just a single register write.
> 
> Correct, the example in reference manual does NOT have this flow for refresh, but
> I checked with our design team yestoday, their validation code indeed has this flow,
> that is why I added it for refresh operation as well.

If it is needed, they'll need to update the manual. Urgently.
Really, missing the information that the watchdog must be unlocked
in order to refresh the timer would not just be be a minor flaw
in the manual. Either it is needed and must be mentioned (because
the watchdog would otherwise simply not work), or it isn't needed
and should not be done.

Thanks,
Guenter

> I will do a test on our EVK board, and if it works without this flow, I will remove them
> In V3.
> 
> Thanks,
> Anson
> 
> 
> 
> 


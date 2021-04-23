Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84B3E368C28
	for <lists+linux-watchdog@lfdr.de>; Fri, 23 Apr 2021 06:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbhDWE1P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 23 Apr 2021 00:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWE1P (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 23 Apr 2021 00:27:15 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAE30C061574;
        Thu, 22 Apr 2021 21:26:39 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v6so20240085oiv.3;
        Thu, 22 Apr 2021 21:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iZIVRJ/1L+R/Ao4ZMJex5tNbh8LEffzgJnSPIEXz8WU=;
        b=b2emO8T0aueqh/TOPlp/EU0x6JHEgeusVkModO8dk08+KZnh7Mc+AZ95OsnWw5DQgF
         T9Ya+H6FaMQVwqflXE6d7qn/kZmxwxHsRUOt9XkEixirSt34oDUvQRqS++oIQyYU/XDc
         ezjA3pEZ4OYi5nrQr3/6x52YeHIlA0Sls1xY/YgrZqcXN+bX8zpxM4cKIptVzwqz+XWN
         2guRUwSd4blIKDNj4he8MTlUaAkL6I2C8Al841zAIur+s+6PCzxJjgv5eWGW47qaDB2c
         z1u77EJUgPseN4539v9qNL5w8uXxTHbJZhLMbYbvRv8X7NvedXL2JAhyHhd/YMRlznaP
         Mlpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iZIVRJ/1L+R/Ao4ZMJex5tNbh8LEffzgJnSPIEXz8WU=;
        b=uUUMoPbDa1DSNZFiKgXVdwFo2dXo+l54rmv29kPR5WJEsUIdhX1cgVd2nRwWMhOe82
         QyQLC3lNv397jYfk9dg6Zq3EEIzogEJWOK0pQcwCDa3vVbFUlorw80ejD6M1ySy0wTlc
         Xw/D5VdNwjxlcDKud7J3LuyXbm+0wxyGW5nus3IbEylDAVrDMwNhcE5x0ZB/fIW4mOOR
         hXBDALu3iGm02hbiUbl1TgWb/gMg2I2sTkOM6ZhxNCsU1VQu+/vg9tGXOx+pvN3sSqEb
         67Fbmmd60PD+UIpd4pGG3I9/Tf9Lgz+lhiq9TUIttXMBBj1ohyzlJN2A2lI0GE9ho8xU
         zkhA==
X-Gm-Message-State: AOAM530p8Lr2HN6fnl1dml+einXlESCkyZDIOb9bgk8I/bNn2rQ5giwz
        g0oJCR2k+0a8bL8yGm+eTgSGrZyFKXE=
X-Google-Smtp-Source: ABdhPJwhnyspaDstKSqfy7B6y6YZZtbHlW6/h/IiSYi5qvzs1UbPRc7Mfikd/Dsr/58mu8J/1AuJpw==
X-Received: by 2002:aca:3bc4:: with SMTP id i187mr2544300oia.174.1619151998603;
        Thu, 22 Apr 2021 21:26:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e15sm1074812otj.32.2021.04.22.21.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 21:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH V7 1/2] watchdog: mtk: support pre-timeout when the bark
 irq is available
To:     =?UTF-8?B?546L5pOO?= <wangqing@vivo.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <AOUAdwCCDk8v*1Yj0s9Qo4qH.3.1619149686926.Hmail.wangqing@vivo.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3acb9bb1-763b-5af7-de3c-d7d8d3f5b2f7@roeck-us.net>
Date:   Thu, 22 Apr 2021 21:26:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AOUAdwCCDk8v*1Yj0s9Qo4qH.3.1619149686926.Hmail.wangqing@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 4/22/21 8:48 PM, 王擎 wrote:
> 
>> On 4/22/21 7:53 PM, Wang Qing wrote:
>>> Use the bark interrupt as the pretimeout notifier if available.
>>>
>>> When the watchdog timer expires in dual mode, an interrupt will be
>>> triggered first, then the timing restarts. The reset signal will be
>>> initiated when the timer expires again.
>>>
>>> The pretimeout notification shall occur at timeout-sec/2.
>>>
>>> V2:
>>> - panic() by default if WATCHDOG_PRETIMEOUT_GOV is not enabled.
>>>
>>> V3:
>>> - Modify the pretimeout behavior, manually reset after the pretimeout
>>> - is processed and wait until timeout.
>>>
>>> V4:
>>> - Remove pretimeout related processing. 
>>> - Add dual mode control separately.
>>>
>>> V5:
>>> - Fix some formatting and printing problems.
>>>
>>> V6:
>>> - Realize pretimeout processing through dualmode.
>>>
>>> V7:
>>> - Add set_pretimeout().
>>>
>>> Signed-off-by: Wang Qing <wangqing@vivo.com>
>>> ---
>>>  drivers/watchdog/mtk_wdt.c | 76 +++++++++++++++++++++++++++++++++++++++++++---
>>>  1 file changed, 71 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
>>> index 97ca993..ab3ac5d
>>> --- a/drivers/watchdog/mtk_wdt.c
>>> +++ b/drivers/watchdog/mtk_wdt.c
>>> @@ -25,6 +25,7 @@
>>>  #include <linux/reset-controller.h>
>>>  #include <linux/types.h>
>>>  #include <linux/watchdog.h>
>>> +#include <linux/interrupt.h>
>>>  
>>>  #define WDT_MAX_TIMEOUT		31
>>>  #define WDT_MIN_TIMEOUT		1
>>> @@ -184,15 +185,23 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
>>>  {
>>>  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
>>>  	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>> +	unsigned int timeout_interval = timeout;
>>>  	u32 reg;
>>>  
>>>  	wdt_dev->timeout = timeout;
>>> -
>>> +	/*
>>> +	 * In dual mode, irq will be triggered at timeout / 2
>>> +	 * the real timeout occurs at timeout
>>> +	 */
>>> +	if (wdt_dev->pretimeout) {
>>> +		wdt_dev->pretimeout = timeout / 2;
>>
>> min_timeout is set to 1. I don't this works well if timeout == 1.
>> You'll either need to set min_timeout to 2, or handle that case.
> 
> It is appropriate to change min_timeout  to 2.
> 
>>
>>> +		timeout_interval = wdt_dev->pretimeout;
>>
>> timeout_interval is unnecessary. Just update timeout accordingly.
>> It needs to take the situation of timeout == 1 into account, though.
> 
> timeout represents the reset time. When the user calls timeout_show, 
> He hopes to get the configured timeout, not the value changed
> by pre-timeout.
> I modify it like this more in line with the original intention.
> 
>>
>>> +	}
>>>  	/*
>>>  	 * One bit is the value of 512 ticks
>>>  	 * The clock has 32 KHz
>>>  	 */
>>> -	reg = WDT_LENGTH_TIMEOUT(timeout << 6) | WDT_LENGTH_KEY;
>>> +	reg = WDT_LENGTH_TIMEOUT(timeout_interval << 6) | WDT_LENGTH_KEY;
>>>  	iowrite32(reg, wdt_base + WDT_LENGTH);
>>>  
>>>  	mtk_wdt_ping(wdt_dev);
>>> @@ -239,13 +248,46 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
>>>  		return ret;
>>>  
>>>  	reg = ioread32(wdt_base + WDT_MODE);
>>> -	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>>> +	if (wdt_dev->pretimeout)
>>> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>>> +	else
>>> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>>>  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
>>>  	iowrite32(reg, wdt_base + WDT_MODE);
>>>  
>>>  	return 0;
>>>  }
>>>  
>>> +static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
>>> +					unsigned int timeout)
>>> +{
>>> +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
>>> +	void __iomem *wdt_base = mtk_wdt->wdt_base;
>>> +	u32 reg = ioread32(wdt_base + WDT_MODE);
>>> +
>>> +	if (timeout && !wdd->pretimeout) {
>>> +		wdd->pretimeout = wdd->timeout / 2;
>>> +		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>>> +	} else if (!timeout && wdd->pretimeout) {
>>> +		wdd->pretimeout = 0;
>>> +		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
>>> +	} else
>>> +		return 0;
>>> +
>>> +	iowrite32(reg, wdt_base + WDT_MODE);
>>
>> What is the point of setting the mode here ? It will
>> be set again in mtk_wdt_set_timeout(). Seems to me all
>> you need to do here is to set wdd->pretimeout,
>> then call mtk_wdt_set_timeout().
> 
> mtk_wdt_set_timeout() only set timeout and ping().
> Here also need to config to the dualmode or not.
> 
Ah, you are correct. Sorry, I confused this with the start function.
That makes me wonder if it would be better to extract a separate
function, mtk_wdt_set_mode(), for that purpose. Thoughts ?

Thanks,
Guenter

> Thanks,
> Qing
>>
>> Guenter
>>
>>> +
>>> +	return mtk_wdt_set_timeout(wdd, wdd->timeout);
>>> +}
>>> +
>>> +static irqreturn_t mtk_wdt_isr(int irq, void *arg)
>>> +{
>>> +	struct watchdog_device *wdd = arg;
>>> +
>>> +	watchdog_notify_pretimeout(wdd);
>>> +
>>> +	return IRQ_HANDLED;
>>> +}
>>> +
>>>  static const struct watchdog_info mtk_wdt_info = {
>>>  	.identity	= DRV_NAME,
>>>  	.options	= WDIOF_SETTIMEOUT |
>>> @@ -253,12 +295,21 @@ static const struct watchdog_info mtk_wdt_info = {
>>>  			  WDIOF_MAGICCLOSE,
>>>  };
>>>  
>>> +static const struct watchdog_info mtk_wdt_pt_info = {
>>> +	.identity	= DRV_NAME,
>>> +	.options	= WDIOF_SETTIMEOUT |
>>> +			  WDIOF_PRETIMEOUT |
>>> +			  WDIOF_KEEPALIVEPING |
>>> +			  WDIOF_MAGICCLOSE,
>>> +};
>>> +
>>>  static const struct watchdog_ops mtk_wdt_ops = {
>>>  	.owner		= THIS_MODULE,
>>>  	.start		= mtk_wdt_start,
>>>  	.stop		= mtk_wdt_stop,
>>>  	.ping		= mtk_wdt_ping,
>>>  	.set_timeout	= mtk_wdt_set_timeout,
>>> +	.set_pretimeout	= mtk_wdt_set_pretimeout,
>>>  	.restart	= mtk_wdt_restart,
>>>  };
>>>  
>>> @@ -267,7 +318,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>>  	struct device *dev = &pdev->dev;
>>>  	struct mtk_wdt_dev *mtk_wdt;
>>>  	const struct mtk_wdt_data *wdt_data;
>>> -	int err;
>>> +	int err, irq;
>>>  
>>>  	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
>>>  	if (!mtk_wdt)
>>> @@ -279,7 +330,22 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>>>  	if (IS_ERR(mtk_wdt->wdt_base))
>>>  		return PTR_ERR(mtk_wdt->wdt_base);
>>>  
>>> -	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>>> +	irq = platform_get_irq(pdev, 0);
>>> +	if (irq > 0) {
>>> +		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
>>> +					&mtk_wdt->wdt_dev);
>>> +		if (err)
>>> +			return err;
>>> +
>>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
>>> +		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
>>> +	} else {
>>> +		if (irq == -EPROBE_DEFER)
>>> +			return -EPROBE_DEFER;
>>> +
>>> +		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
>>> +	}
>>> +
>>>  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
>>>  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
>>>  	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
>>>
>>
> 
> 


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8DDD104FAF
	for <lists+linux-watchdog@lfdr.de>; Thu, 21 Nov 2019 10:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726165AbfKUJxj (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Nov 2019 04:53:39 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34179 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfKUJxj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Nov 2019 04:53:39 -0500
Received: by mail-pf1-f194.google.com with SMTP id n13so1414857pff.1;
        Thu, 21 Nov 2019 01:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=24Z96VAL0Kc1Ory+ij+teunstFq8Wsss9gha+iAZp1A=;
        b=SxVFKQkA5BaDYF5mJppd2hlZ80wgUKapnXzXhrBilpXnOlr/xCwU7vE//ig32zOceT
         XtkpMORvWROG5o5fl2D0BxBXRGBggHSUcpa95yRaTuABLqdLLXrzbyKJaQ56WlmFBceL
         xMPA2xpH+pkOrZSCtgbJISkyeOH56yfseOr377m00McqQbJObdmbdGgXfByGUef1uekX
         dGxqugCdAm2UnNFD7svyX4IVhZ40X7dISw1a+6mYfDxmD55B1fcPuW1OmCzbZDTpphNo
         Xq6lm2EXq6CMlY4Zp4SNk/A0YnWCV2Q6/dn3UCeQG0veNqkGUAsErHvJGaqxws4Y6xYW
         /bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=24Z96VAL0Kc1Ory+ij+teunstFq8Wsss9gha+iAZp1A=;
        b=AGbFZa9djw9Z8QqKQ1JWTmV+wjqkaJdbCt6ijv2/QI5Hp8sxfT+IMogCWd0v8wHwzr
         eeuzk08QSU0DzYUeFaButNXE0pw2qGFLPyFmdvJu7RKGRoG2O/VxiNUld9lMaO9BzBwK
         7aAXxD2/zn2thfBoZVRc1hw9fp7JucGNV6wgbdiiNpUyAvop6xU6qd6ZjYNGxN/ZJ0cE
         KViLek0cvbuyUUSE5ForAsmU84ginjLwmQC5AhRecTyuopHw1zgj1dj4uGsG2UffOAVy
         /jd9Cwjjo8/Qwky79BOjU1MwxsEQN2y0OBu/+1V2dZ9BC0dcBR6thfp+3WFGtbH3nl8X
         7gpA==
X-Gm-Message-State: APjAAAXawnDI3bM0c7UBeABW/YYJZeYDIhrTAVzmxr1flhmXtuo37v2w
        QOg50LnxxySfYPsfgBiyuw9JI/Cx
X-Google-Smtp-Source: APXvYqyQQtJCGLeNZ9QIHYtWJHPoYAV8WyiiJMmXgLDMcQgxIw+iZZPKs0Mi17aWOTVD3zHS2LO3Lg==
X-Received: by 2002:a62:174b:: with SMTP id 72mr8853102pfx.179.1574330017805;
        Thu, 21 Nov 2019 01:53:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e17sm2655360pfh.121.2019.11.21.01.53.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 01:53:36 -0800 (PST)
Subject: Re: [PATCH 1/1] drivers: watchdog: stm32_iwdg: set WDOG_HW_RUNNING at
 probe
To:     Christophe Roullier <christophe.roullier@st.com>,
        wim@linux-watchdog.org, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20191121082813.29267-1-christophe.roullier@st.com>
 <20191121082813.29267-2-christophe.roullier@st.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ce10681c-8fa3-0fa6-3509-376a2f37aec9@roeck-us.net>
Date:   Thu, 21 Nov 2019 01:53:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121082813.29267-2-christophe.roullier@st.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/21/19 12:28 AM, Christophe Roullier wrote:
> If the watchdog hardware is already enabled during the boot process,
> when the Linux watchdog driver loads, it should reset the watchdog and
> tell the watchdog framework. As a result, ping can be generated from
> the watchdog framework (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is set),
> until the userspace watchdog daemon takes over control
> 

This is not what the code is doing. It sets the WDOG_HW_RUNNING flag
unconditionally, no matter if the watchdog is already running or not.
It also changes the semantic of the rest of the code, as well as
functionality. The code in start_timeout no longer waits, and the ping
code explicitly (re-)enables the watchdog.

If you want an option to start the watchdog at probe time unconditionally,
please add a module parameter to do it. Otherwise you'll need to check if
it is indeed enabled before setting WDOG_HW_RUNNING, and in that case it
should not be necessary to re-enable it. It should also not be necessary
to split the start function.

Thanks,
Guenter

> Fixes:4332d113c66a ("watchdog: Add STM32 IWDG driver")
> Signed-off-by: Christophe Roullier <christophe.roullier@st.com>
> ---
>   drivers/watchdog/stm32_iwdg.c | 57 ++++++++++++++++++++++++-----------
>   1 file changed, 40 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
> index a3a329011a06..2b3be3b1c15b 100644
> --- a/drivers/watchdog/stm32_iwdg.c
> +++ b/drivers/watchdog/stm32_iwdg.c
> @@ -87,8 +87,23 @@ static inline void reg_write(void __iomem *base, u32 reg, u32 val)
>   static int stm32_iwdg_start(struct watchdog_device *wdd)
>   {
>   	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> -	u32 tout, presc, iwdg_rlr, iwdg_pr, iwdg_sr;
> -	int ret;
> +
> +	dev_dbg(wdd->parent, "%s\n", __func__);
> +
> +	/*  Start the watchdog */
> +	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> +
> +	/* reload watchdog */
> +	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
> +
> +	set_bit(WDOG_HW_RUNNING, &wdd->status);
> +	return 0;
> +}
> +
> +static int stm32_iwdg_setprescaler(struct watchdog_device *wdd)
> +{
> +	struct stm32_iwdg *wdt = watchdog_get_drvdata(wdd);
> +	u32 tout, presc, iwdg_rlr, iwdg_pr;
>   
>   	dev_dbg(wdd->parent, "%s\n", __func__);
>   
> @@ -108,19 +123,6 @@ static int stm32_iwdg_start(struct watchdog_device *wdd)
>   	/* set prescaler & reload registers */
>   	reg_write(wdt->regs, IWDG_PR, iwdg_pr);
>   	reg_write(wdt->regs, IWDG_RLR, iwdg_rlr);
> -	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> -
> -	/* wait for the registers to be updated (max 100ms) */
> -	ret = readl_relaxed_poll_timeout(wdt->regs + IWDG_SR, iwdg_sr,
> -					 !(iwdg_sr & (SR_PVU | SR_RVU)),
> -					 SLEEP_US, TIMEOUT_US);
> -	if (ret) {
> -		dev_err(wdd->parent, "Fail to set prescaler, reload regs\n");
> -		return ret;
> -	}
> -
> -	/* reload watchdog */
> -	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
>   
>   	return 0;
>   }
> @@ -131,6 +133,9 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
>   
>   	dev_dbg(wdd->parent, "%s\n", __func__);
>   
> +	/*  Start the watchdog */
> +	reg_write(wdt->regs, IWDG_KR, KR_KEY_ENABLE);
> +
>   	/* reload watchdog */
>   	reg_write(wdt->regs, IWDG_KR, KR_KEY_RELOAD);
>   
> @@ -140,12 +145,21 @@ static int stm32_iwdg_ping(struct watchdog_device *wdd)
>   static int stm32_iwdg_set_timeout(struct watchdog_device *wdd,
>   				  unsigned int timeout)
>   {
> +	int ret;
> +
>   	dev_dbg(wdd->parent, "%s timeout: %d sec\n", __func__, timeout);
>   
>   	wdd->timeout = timeout;
>   
> -	if (watchdog_active(wdd))
> -		return stm32_iwdg_start(wdd);
> +	if (watchdog_active(wdd)) {
> +		ret = stm32_iwdg_setprescaler(wdd);
> +		if (ret) {
> +			dev_err(wdd->parent, "failed to set prescaler\n");
> +			return ret;
> +		} else {
> +			return stm32_iwdg_start(wdd);
> +		}
> +	}
>   
>   	return 0;
>   }
> @@ -262,12 +276,21 @@ static int stm32_iwdg_probe(struct platform_device *pdev)
>   	watchdog_set_nowayout(wdd, WATCHDOG_NOWAYOUT);
>   	watchdog_init_timeout(wdd, 0, dev);
>   
> +	/* Make sure the watchdog is serviced */
> +	set_bit(WDOG_HW_RUNNING, &wdd->status);
> +
>   	ret = devm_watchdog_register_device(dev, wdd);
>   	if (ret)
>   		return ret;
>   
>   	platform_set_drvdata(pdev, wdt);
>   
> +	ret = stm32_iwdg_setprescaler(wdd);
> +	if (ret) {
> +		dev_err(dev, "failed to set prescaler\n");
> +		return ret;
> +	}
> +
>   	return 0;
>   }
>   
> 


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0B6230C7F
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Jul 2020 16:34:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730368AbgG1OeL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 Jul 2020 10:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbgG1OeL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 Jul 2020 10:34:11 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6EBAC061794;
        Tue, 28 Jul 2020 07:34:10 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id k4so9970908pld.12;
        Tue, 28 Jul 2020 07:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Gol3YEjZg+DdUDqVA5CTPFx2cwX3l9O5rj/E8q5KIWU=;
        b=dqIEAHN9Gj6nRHFrLPP3id5phRX61Jo38NkPro7IU3G6ipk9Sno/mdjfeZRB/G8use
         xqYknq3XvnUqmHaH725q0w8Ef6Rj9rjRJ/N46bnMrTqwKTaJXkHSmOANUVwSnQ+SMwlO
         t6MixwiEbxRPV4XhwvU3bGwpfpD6PFzHbyH+vi7OBT8OkhnceYKHoAZ8bmQyrcYMJIeA
         JR97BYgNWgizLXobVkKTh15WnONOInOc2L9zxB7FXr+BGZOm+B4teM6JVkTqiYUYaTh+
         4fjs1FVCAdau3aR1RDYdC2W//HPl4xjhBaL6hpOTSqc97HHL6KcRCYFmC4REODumSR2x
         HpDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Gol3YEjZg+DdUDqVA5CTPFx2cwX3l9O5rj/E8q5KIWU=;
        b=sMnhvafK6/tcKtUuXjUveGzO618QcFijWfe7SUM71YZXzzMkD4fZX7RIwjmeXnRGsU
         N0vQuOEdaU8yxi+Id9/16Rn5UGiNqXk+CbGlrVc+GHarbM6u7vQvR5E66aFmO+v2wx/a
         AfrZN/ezswvoGgb8KYMWsXdvkHxaZ/Y+5Ot6BgxiR+srCFHK1GJ2+eKaKl4bZ5lxHgLS
         nuR6bQ7JtTFwbDb7fZ4a9HuwAXizyAWA0SNn7jEyGcl0BUuL9XGtFz9Hmo3/nbxW290o
         o3csmK8N3J415dpFghbBxRf0eblPk4DBP8xwGfDSo2ZtXN9iIbyFY8inRO0WGE9h4jGq
         Ne8w==
X-Gm-Message-State: AOAM532W8c6SJXr0FCe6Wfr4fUoA+bMTCBlrVzYrRPJCl+yrrx3iXg3w
        pSxelXYsio3j4NmJgmcz86c=
X-Google-Smtp-Source: ABdhPJy93uhGYKVvztyUXpnZL/qAuBttRC4YS6R4ru0UvimGlBwcTqGIqXqK3s8PoQfypbrdn8yHXg==
X-Received: by 2002:a17:902:ff16:: with SMTP id f22mr10219128plj.269.1595946850409;
        Tue, 28 Jul 2020 07:34:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d29sm17673991pgb.54.2020.07.28.07.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2020 07:34:09 -0700 (PDT)
Subject: Re: [PATCH 1/2] watchdog: imx7ulp: Strictly follow the sequence for
 wdog operations
To:     Anson Huang <Anson.Huang@nxp.com>, wim@linux-watchdog.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
References: <1595918567-2017-1-git-send-email-Anson.Huang@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <566adde7-c397-72f1-145d-fbca9de77cd7@roeck-us.net>
Date:   Tue, 28 Jul 2020 07:34:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1595918567-2017-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/27/20 11:42 PM, Anson Huang wrote:
> According to reference manual, the i.MX7ULP WDOG's operations should
> follow below sequence:
> 
> 1. disable global interrupts;
> 2. unlock the wdog and wait unlock bit set;
> 3. reconfigure the wdog and wait for reconfiguration bit set;
> 4. enabel global interrupts.
> 
> Strictly follow the recommended sequence can make it more robust.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 7993c8c..b414ecf 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> @@ -48,17 +49,32 @@ struct imx7ulp_wdt_device {
>  	struct clk *clk;
>  };
>  
> +static inline void imx7ulp_wdt_wait(void __iomem *base, u32 mask)
> +{
> +	int retries = 100;
> +
> +	do {
> +		if (readl_relaxed(base + WDOG_CS) & mask)
> +			return;
> +		usleep_range(200, 1000);
> +	} while (retries--);

Sleep with interrupts disabled ? I can not imagine that this works well
in a single CPU system. On top of that, it seems quite pointless.
Either you don't want to be interrupted or you do, but sleeping
with interrupts disabled really doesn't make sense. And does it really
take 200-1000 uS for the watchdog subsystem to react, and sometimes up
to 200 * 100 = 20 mS ? That seems highly unlikely. If such a delay loop
is indeed needed, it should be limited by a time, not by number of
repetitions.

Unless there is evidence that there is a problem that needs to be solved,
I am not going to accept this code.

Thanks,
Guenter

> +}
> +
>  static void imx7ulp_wdt_enable(struct watchdog_device *wdog, bool enable)
>  {
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  
>  	u32 val = readl(wdt->base + WDOG_CS);
>  
> +	local_irq_disable();
>  	writel(UNLOCK, wdt->base + WDOG_CNT);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
>  	if (enable)
>  		writel(val | WDOG_CS_EN, wdt->base + WDOG_CS);
>  	else
>  		writel(val & ~WDOG_CS_EN, wdt->base + WDOG_CS);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
> +	local_irq_enable();
>  }
>  
>  static bool imx7ulp_wdt_is_enabled(void __iomem *base)
> @@ -72,7 +88,12 @@ static int imx7ulp_wdt_ping(struct watchdog_device *wdog)
>  {
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  
> +	local_irq_disable();
> +	writel(UNLOCK, wdt->base + WDOG_CNT);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
>  	writel(REFRESH, wdt->base + WDOG_CNT);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
> +	local_irq_enable();
>  
>  	return 0;
>  }
> @@ -98,8 +119,12 @@ static int imx7ulp_wdt_set_timeout(struct watchdog_device *wdog,
>  	struct imx7ulp_wdt_device *wdt = watchdog_get_drvdata(wdog);
>  	u32 val = WDOG_CLOCK_RATE * timeout;
>  
> +	local_irq_disable();
>  	writel(UNLOCK, wdt->base + WDOG_CNT);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_ULK);
>  	writel(val, wdt->base + WDOG_TOVAL);
> +	imx7ulp_wdt_wait(wdt->base, WDOG_CS_RCS);
> +	local_irq_enable();
>  
>  	wdog->timeout = timeout;
>  
> @@ -140,15 +165,19 @@ static void imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  {
>  	u32 val;
>  
> +	local_irq_disable();
>  	/* unlock the wdog for reconfiguration */
>  	writel_relaxed(UNLOCK_SEQ0, base + WDOG_CNT);
>  	writel_relaxed(UNLOCK_SEQ1, base + WDOG_CNT);
> +	imx7ulp_wdt_wait(base, WDOG_CS_ULK);
>  
>  	/* set an initial timeout value in TOVAL */
>  	writel(timeout, base + WDOG_TOVAL);
>  	/* enable 32bit command sequence and reconfigure */
>  	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
>  	writel(val, base + WDOG_CS);
> +	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
> +	local_irq_enable();
>  }
>  
>  static void imx7ulp_wdt_action(void *data)
> 


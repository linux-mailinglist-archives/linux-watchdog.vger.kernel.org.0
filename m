Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52668380A7E
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 May 2021 15:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbhENNn1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 May 2021 09:43:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbhENNn1 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 May 2021 09:43:27 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 038D2C061574;
        Fri, 14 May 2021 06:42:15 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id q6so15453527qvb.2;
        Fri, 14 May 2021 06:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FB0NSmh4fqQIsNAlL8pm2Yaj9257aMVxgrbCCbLsJno=;
        b=bSYGolIp2eZPKT2PgcNtJAqtAQOBuTXS6U5vqCjFx1TvzXLoqHVMaeMiurrchYeelo
         rYGqo5DS5IKEiAzb7jfVjjstWOUg7NhvxEMQh22g5VmbGdaJE68pZypRae3ZT6dR4bPX
         JDrV3b8wIOPjYJJyDD4pf2+RA9gcqbD43tbLdrMAJesJ5E15fblOoGIxwaSWPWVU4GJ/
         ZNcBD17zoVnsUNwUZvii5YtaVkt564vVvMUTGuye0KhxD16RJk2VH9RhfvzvtBSpmmcV
         GWxZ0Z7fBFBhILdZ/D4CWj/eIbJq7dOGKkqsFS9gfd1HNAXFisgsXqHirifpUtYdw42E
         lQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FB0NSmh4fqQIsNAlL8pm2Yaj9257aMVxgrbCCbLsJno=;
        b=R8aoQstGEdi/GdLq4eJx+BJildfPoc3NR7nuibyloPIW/YKCchAa9eXChBOICWjiEw
         ZvyJc4ko/gv4eTsDgnq/gPXiQ8JdJl4BY04p8POWEoqE+MbDP04hYHFrhGcqYQoqKNJK
         udLgho8U/o+5jNIEaxtSgXn5P9xtIuDG54U7s5caOTogz8S4qm9nawzE9F8KTZMWsK7I
         unWwGlRbTdZzIXESGs82VmMpPJ4KqlAIgyRTdRIspoV7SGwcam4GPpJi1GgCC03Qmi6f
         HAXV4ywhT5jbF31RuilYnJhxDuYj/jX9NfrMm5b1V71vL8uPcizIVVOTxQGBRYFJnPjP
         TG7Q==
X-Gm-Message-State: AOAM5338ZeDY7RVrxAr5/rnfILRGh/AioNjkbbd3H757EA8xVQBX/fXU
        k/hgGy5M7NWk45Yv35pbji4uCBhusDs=
X-Google-Smtp-Source: ABdhPJwSrQJEe/sqwlwIsziF0BnLoqwRecfwVX678Q3kxauWeyd7MC/VyT6Z218hFBcA+fON3YeJJA==
X-Received: by 2002:a05:6214:1705:: with SMTP id db5mr5828915qvb.13.1620999734934;
        Fri, 14 May 2021 06:42:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c185sm4825808qkg.96.2021.05.14.06.42.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 06:42:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] watchdog: imx2_wdt: avoid to ping before resume back
To:     Robin Gong <yibin.gong@nxp.com>, wim@linux-watchdog.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1621012875-22667-1-git-send-email-yibin.gong@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <efc34ded-720d-ef57-8906-37e8ab36c3cf@roeck-us.net>
Date:   Fri, 14 May 2021 06:42:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621012875-22667-1-git-send-email-yibin.gong@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/14/21 10:21 AM, Robin Gong wrote:
> Since watchdog_ping_work is not freezable so that it maybe scheduled before
> imx2_wdt_resume where watchdog clock enabled, hence, kernel will hang in
> imx2_wdt_ping without clock, and then watchdog reset happen. Add clk_is_on
> to prevent the above case by ignoring ping until watchdog driver resume
> back indeed.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx2_wdt.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index b84f80f..cc86018 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -65,6 +65,7 @@ struct imx2_wdt_device {
>   	struct regmap *regmap;
>   	struct watchdog_device wdog;
>   	bool ext_reset;
> +	bool clk_is_on;
>   };
>   
>   static bool nowayout = WATCHDOG_NOWAYOUT;
> @@ -160,6 +161,9 @@ static int imx2_wdt_ping(struct watchdog_device *wdog)
>   {
>   	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
>   
> +	if (!wdev->clk_is_on)
> +		return 0;
> +
>   	regmap_write(wdev->regmap, IMX2_WDT_WSR, IMX2_WDT_SEQ1);
>   	regmap_write(wdev->regmap, IMX2_WDT_WSR, IMX2_WDT_SEQ2);
>   	return 0;
> @@ -301,6 +305,8 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	wdev->clk_is_on = true;
> +
>   	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
>   	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
>   
> @@ -361,6 +367,8 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
>   
>   	clk_disable_unprepare(wdev->clk);
>   
> +	wdev->clk_is_on = false;
> +
>   	return 0;
>   }
>   
> @@ -375,6 +383,8 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> +	wdev->clk_is_on = true;
> +
>   	if (watchdog_active(wdog) && !imx2_wdt_is_running(wdev)) {
>   		/*
>   		 * If the watchdog is still active and resumes
> 


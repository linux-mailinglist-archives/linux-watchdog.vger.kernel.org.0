Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A33169CDC
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2020 05:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727210AbgBXEEg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 23 Feb 2020 23:04:36 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55272 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727202AbgBXEEg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 23 Feb 2020 23:04:36 -0500
Received: by mail-pj1-f66.google.com with SMTP id dw13so3573647pjb.4;
        Sun, 23 Feb 2020 20:04:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pCSYBBOwT+fM6P/sllrr2JTwBl3qxoctfKfCeZ8ANVo=;
        b=MXwEtF0NnFJ836tt6ik56UlRufY7+qvx4HKXebaqTBIZGGIniU8oKZ7XKVGLvli3Xa
         zKbs1k8Ezqz+u0VQuOb6EDcHxLPATsf6xKxeHtBmRZ5e7Sc9p5/P4ES522WuKh1LM/+H
         G0JZBF39WCgbj+3y9HwpIsTvABCXcZ4nKgbdUXyUFrGjpGF59/2sE/hu9+JCXcSpE0l8
         9DCOX489rimBU0THzjGfxsZAhIR8HBGZ2EEIigYmVquqSDArErjwcsPyrg91G26N1twm
         pMNk9M1qxh7d2bJWlnyMS/kkjoImcTjMrFa8M9XgDxkkd3tdT3Yel1K2JFQ6cOnsWs0q
         28PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pCSYBBOwT+fM6P/sllrr2JTwBl3qxoctfKfCeZ8ANVo=;
        b=G0ev+zFQxR5QPGE32Om+0hPRqN5UFmf/c3jkHHnTrltDaoLumhP3pyhOJQPEnR1T3F
         +9vDfR6HxH6Fy234RbDP1qEgnTLVfS6ELe4wN7+bdd25mt0PdzRRqT5biWDeXyqHwPxU
         BvZ3oayZzjZcCIi9hOq4O8fuPj6X0xFZWWWTSMcJvj/Xd5l4qTa4Kni+0p8wLGM/m98D
         GnlGCsX4VKgfWaeEDN00UCmt0qrpQITR3cQXPucEhDu4TPdF4SPPsPqGNoVyOZke1A1z
         wvHHZadPbMPLxsQnbfhjS5bWwH52WjZ5ppQWqOdNhgS9lSHWZrHzIqLUX5hQsFrCeChg
         XERg==
X-Gm-Message-State: APjAAAUxCEPTfrN9LO9Ci6KM7jkdWGaDxDGm2mOaVmoP3cjnktcJKREV
        37GzLoCUcC0n0sclr7+iNlM=
X-Google-Smtp-Source: APXvYqzm5v7u9jGJAuBoo8Ra2wrfZ43pgyQPxXoH0WQUF3JOVLIgK3hktuxAFaB+uatphbCwIYK1AQ==
X-Received: by 2002:a17:902:6a88:: with SMTP id n8mr47670525plk.265.1582517075508;
        Sun, 23 Feb 2020 20:04:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 188sm10321695pgf.24.2020.02.23.20.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Feb 2020 20:04:34 -0800 (PST)
Subject: Re: [PATCH] watchdog: imx2_wdt: Drop .remove callback
To:     Anson Huang <Anson.Huang@nxp.com>, wim@linux-watchdog.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Linux-imx@nxp.com
References: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <968aab4e-50ed-83d2-cac1-d0a216060628@roeck-us.net>
Date:   Sun, 23 Feb 2020 20:04:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1582512687-13312-1-git-send-email-Anson.Huang@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/23/20 6:51 PM, Anson Huang wrote:
> .remove callback implementation doesn' call clk_disable_unprepare() which
> is buggy, actually, we can just use devm_watchdog_register_device() and
> devm_add_action_or_reset() to handle all necessary operations for remove
> action, then .remove callback can be dropped.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/imx2_wdt.c | 37 ++++++++++---------------------------
>   1 file changed, 10 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index f8d58bf..1fe472f 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -244,6 +244,11 @@ static const struct regmap_config imx2_wdt_regmap_config = {
>   	.max_register = 0x8,
>   };
>   
> +static void imx2_wdt_action(void *data)
> +{
> +	clk_disable_unprepare(data);
> +}
> +
>   static int __init imx2_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -292,6 +297,10 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> +	ret = devm_add_action_or_reset(dev, imx2_wdt_action, wdev->clk);
> +	if (ret)
> +		return ret;
> +
>   	regmap_read(wdev->regmap, IMX2_WDT_WRSR, &val);
>   	wdog->bootstatus = val & IMX2_WDT_WRSR_TOUT ? WDIOF_CARDRESET : 0;
>   
> @@ -315,32 +324,7 @@ static int __init imx2_wdt_probe(struct platform_device *pdev)
>   	 */
>   	regmap_write(wdev->regmap, IMX2_WDT_WMCR, 0);
>   
> -	ret = watchdog_register_device(wdog);
> -	if (ret)
> -		goto disable_clk;
> -
> -	dev_info(dev, "timeout %d sec (nowayout=%d)\n",
> -		 wdog->timeout, nowayout);
> -
> -	return 0;
> -
> -disable_clk:
> -	clk_disable_unprepare(wdev->clk);
> -	return ret;
> -}
> -
> -static int __exit imx2_wdt_remove(struct platform_device *pdev)
> -{
> -	struct watchdog_device *wdog = platform_get_drvdata(pdev);
> -	struct imx2_wdt_device *wdev = watchdog_get_drvdata(wdog);
> -
> -	watchdog_unregister_device(wdog);
> -
> -	if (imx2_wdt_is_running(wdev)) {
> -		imx2_wdt_ping(wdog);
> -		dev_crit(&pdev->dev, "Device removed: Expect reboot!\n");
> -	}
> -	return 0;
> +	return devm_watchdog_register_device(dev, wdog);
>   }
>   
>   static void imx2_wdt_shutdown(struct platform_device *pdev)
> @@ -417,7 +401,6 @@ static const struct of_device_id imx2_wdt_dt_ids[] = {
>   MODULE_DEVICE_TABLE(of, imx2_wdt_dt_ids);
>   
>   static struct platform_driver imx2_wdt_driver = {
> -	.remove		= __exit_p(imx2_wdt_remove),
>   	.shutdown	= imx2_wdt_shutdown,
>   	.driver		= {
>   		.name	= DRIVER_NAME,
> 


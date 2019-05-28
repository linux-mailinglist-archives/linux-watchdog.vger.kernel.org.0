Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE6E2C7BE
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 May 2019 15:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727010AbfE1N03 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 28 May 2019 09:26:29 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39205 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726925AbfE1N03 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 28 May 2019 09:26:29 -0400
Received: by mail-pl1-f193.google.com with SMTP id g9so8335068plm.6;
        Tue, 28 May 2019 06:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PYJ1AErb0rdEepPQsXSA8Rz6gJJMlH5HikRlXEjgLzc=;
        b=W8qGYt+eEmeosNhfv/mPuWgf2B2FcFApZBtXRcRvRk6Tst8g2O5eN+DjnSOr3IjUbv
         8O43IFzEvzRg7lQrEPeebooJ7WH3vtOn0cGp5bdAkwbZkZB81y9H1j+JbBaUDF3PFoFu
         tlkL6V+Q5NHHHsffTh24boWKHih3PtwJ3AcUPRkNn2+4qiDEEmI3HYhjPxZ8aiMqm/xF
         ZMKhQUSkb1dCxPinW5Yk5L8eYFoBoMn9iAT2T+Ifs1JKIqTBlbu5wpc+4yFWfP1XvR56
         +3wb8A7cQi00wVCoIrIQ4RbKrECu/DWSBSJzIDWILsBloq3KeAyLb04Yrhf/kruNLIq0
         /Mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PYJ1AErb0rdEepPQsXSA8Rz6gJJMlH5HikRlXEjgLzc=;
        b=bVbrSVymAvR7E3Xk5WSXt+c4MLh5KUBRMj7ZsFPhhsM9Pb3t3oPlQdNx3D8SgzpTeu
         tQFXUYIBNYOjplSrJsf/+siVbXfDrEft0PLkj2/O/W5an57b0YP1svQpZeml/0V0k9S4
         wnYvdSGj0SQaSTxsof77hLhhBw+DXua6MM1Wn2Ps0NEfL8gPUApHOe3p10I5f/1RDeUu
         iasoZJx2FhC84PNBEwjMa1N1FOht96N9UH4DBGvMSr+Hri5/2oMTLLMLmVhNwjdPXmRO
         sDcNxD2r0PH0jRNHn26UQkGSGyyFu5ZbDOyN9peDgGMcHqQEFlyna2p7KEFVQqNUoT8j
         Gnyw==
X-Gm-Message-State: APjAAAWcZNhSDk3CY3aCDKltC64XtCRfzvD8rD4gUlWyHRJ5r/ILWBd4
        wyWCqbc3NuEXui+z6snC7ej92R/M
X-Google-Smtp-Source: APXvYqz7tIETEwEJfkQicMV+LO1cIjwoWkBFko/B0upXKLXaY5ph+qLCNicJk0ueFQr0p0CaQSigtg==
X-Received: by 2002:a17:902:30a3:: with SMTP id v32mr25974104plb.6.1559049988134;
        Tue, 28 May 2019 06:26:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d24sm2430944pjv.24.2019.05.28.06.26.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 May 2019 06:26:27 -0700 (PDT)
Subject: Re: [PATCH] watchdog: gpio: add support for nowayout option
To:     Mans Rullgard <mans@mansr.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190528090947.2610-1-mans@mansr.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <553a3b7c-808f-12ac-3301-6a111d760c26@roeck-us.net>
Date:   Tue, 28 May 2019 06:26:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528090947.2610-1-mans@mansr.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/28/19 2:09 AM, Mans Rullgard wrote:
> Add support for the nowayout option in the gpio watchdog driver.
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/gpio_wdt.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
> index ea77cae03c9d..63792bb70213 100644
> --- a/drivers/watchdog/gpio_wdt.c
> +++ b/drivers/watchdog/gpio_wdt.c
> @@ -17,6 +17,12 @@
>   #include <linux/platform_device.h>
>   #include <linux/watchdog.h>
>   
> +static bool nowayout = WATCHDOG_NOWAYOUT;
> +module_param(nowayout, bool, 0);
> +MODULE_PARM_DESC(nowayout,
> +		"Watchdog cannot be stopped once started (default="
> +				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> +
>   #define SOFT_TIMEOUT_MIN	1
>   #define SOFT_TIMEOUT_DEF	60
>   
> @@ -155,6 +161,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
>   	priv->wdd.timeout	= SOFT_TIMEOUT_DEF;
>   
>   	watchdog_init_timeout(&priv->wdd, 0, &pdev->dev);
> +	watchdog_set_nowayout(&priv->wdd, nowayout);
>   
>   	watchdog_stop_on_reboot(&priv->wdd);
>   
> 


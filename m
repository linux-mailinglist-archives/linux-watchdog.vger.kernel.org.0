Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21CF5F4E0B
	for <lists+linux-watchdog@lfdr.de>; Fri,  8 Nov 2019 15:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726976AbfKHOZH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 8 Nov 2019 09:25:07 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36272 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKHOZH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 8 Nov 2019 09:25:07 -0500
Received: by mail-pf1-f195.google.com with SMTP id v19so4688154pfm.3;
        Fri, 08 Nov 2019 06:25:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2QPC8QnLvdDe0xE5A31AT6LtAT7sdxDY8gfcrh4eodY=;
        b=MeMYs8yFEuniNnvauAknagNHFZeN4tBHxXi5NvT/F5Mm+4ANQO0gLGN36OijIBL4U0
         VgWur1KJ1tkOzo15JLqCylVrw/VcOOocPxhGPvJ76blM+SUdL7QYTN4LkK1VAF9I1hUb
         zXtRTdBZkUPMQISS5tJW155CDGXvUnJlKOV4MYXk4VMVuqcBVfh6kYmsnt963S16tuSj
         J99keTacAUtKqeqVvGK0jXjXg38lQAJ0chytk8U1/0xgWu+OSXFdga4/+9uX6xaS99GV
         B07/MfD8pHf4wOqypNtrufgvu+EnqrZXj65MNYwr+iqMjKnRqjN0wQYt+gUT4iXkz8ly
         08GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2QPC8QnLvdDe0xE5A31AT6LtAT7sdxDY8gfcrh4eodY=;
        b=ZqsG3WwJtNmWjfOzRsiq+NsqLeJyhawoiKvK1BV0g+UMKKAI3R7mvJ/Rvk2W4CnzY0
         SpqoXQnHg4y5XKo39mGjRL0wJG6dRwK7pc5vNMZTpsVuFC49JS6KG+41Z2eU6abUwrTd
         xKLMMG+S7F71F5T9/AlIdhikYtHzGSsQpwe3W+Yjx5kKRplZ1WMHMV+GMAx4du2FlcYq
         F7hKzjlItDXGyjyxXJjbqjguolSTLYWiNlJbat5xBVXLWg1oLQBLqEdcDmZje3XA63Qa
         37sDZLbxbxOpH89QbxON50BAkAb8vFJn97/QPONkWTJ6qQphldr32Sz60F/oltQ/0ewe
         2KgQ==
X-Gm-Message-State: APjAAAUcA7NPSE/RIXE9xxu3mET8rzWzQLEB3rqFWUtqxmY5YyeFsf7H
        4eM99wv4lyS+2V/uopMVwV90bB8d
X-Google-Smtp-Source: APXvYqw6YWG2/tHoaCVNv0mQYgzPu7Ea3OvB1jHTE/F/Zp5kt8YcYZKCCuxIwv66sDmc5Zu5WBaKbA==
X-Received: by 2002:a65:41c5:: with SMTP id b5mr12021246pgq.78.1573223106517;
        Fri, 08 Nov 2019 06:25:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q199sm6075664pfq.147.2019.11.08.06.25.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Nov 2019 06:25:05 -0800 (PST)
Subject: Re: [PATCH] watchdog: aspeed: Fix clock behaviour for ast2600
To:     Joel Stanley <joel@jms.id.au>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20191108032905.22463-1-joel@jms.id.au>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <74f32d61-856d-623f-2f37-965d9331aba0@roeck-us.net>
Date:   Fri, 8 Nov 2019 06:25:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191108032905.22463-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/7/19 7:29 PM, Joel Stanley wrote:
> The ast2600 no longer uses bit 4 in the control register to indicate a
> 1MHz clock (It now controls weather this watchdog is reset by a SOC
> reset). This means we do not want to set it. It also does not need to be
> set for the ast2500, as it is read-only on that SoC.
> 
> The comment next to the clock rate selection wandered away from where it
> was set, so put it back next to the register setting it's describing.
> 
> Fixes: b3528b487448 ("watchdog: aspeed: Add support for AST2600")
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/aspeed_wdt.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wdt.c
> index 4ec0906bf12c..7e00960651fa 100644
> --- a/drivers/watchdog/aspeed_wdt.c
> +++ b/drivers/watchdog/aspeed_wdt.c
> @@ -258,11 +258,6 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   	if (IS_ERR(wdt->base))
>   		return PTR_ERR(wdt->base);
>   
> -	/*
> -	 * The ast2400 wdt can run at PCLK, or 1MHz. The ast2500 only
> -	 * runs at 1MHz. We chose to always run at 1MHz, as there's no
> -	 * good reason to have a faster watchdog counter.
> -	 */
>   	wdt->wdd.info = &aspeed_wdt_info;
>   	wdt->wdd.ops = &aspeed_wdt_ops;
>   	wdt->wdd.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT_MS;
> @@ -278,7 +273,16 @@ static int aspeed_wdt_probe(struct platform_device *pdev)
>   		return -EINVAL;
>   	config = ofdid->data;
>   
> -	wdt->ctrl = WDT_CTRL_1MHZ_CLK;
> +	/*
> +	 * On clock rates:
> +	 *  - ast2400 wdt can run at PCLK, or 1MHz
> +	 *  - ast2500 only runs at 1MHz, hard coding bit 4 to 1
> +	 *  - ast2600 always runs at 1MHz
> +	 *
> +	 * Set the ast2400 to run at 1MHz as it simplifies the driver.
> +	 */
> +	if (of_device_is_compatible(np, "aspeed,ast2400-wdt"))
> +		wdt->ctrl = WDT_CTRL_1MHZ_CLK;
>   
>   	/*
>   	 * Control reset on a per-device basis to ensure the
> 


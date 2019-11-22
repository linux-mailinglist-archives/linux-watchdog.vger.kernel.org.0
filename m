Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC6210604F
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Nov 2019 06:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfKVFiu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 22 Nov 2019 00:38:50 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38560 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVFiu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 22 Nov 2019 00:38:50 -0500
Received: by mail-pj1-f68.google.com with SMTP id f7so2571488pjw.5;
        Thu, 21 Nov 2019 21:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=8dvSdtqu6VrgOIk7nTpyJSf73Tmmywkq2XApZ/zllzc=;
        b=EaW6nMbB1mOof5a3IlyBBXHvxW8PED1/Or4QY1TwmjN8VpPwdYEWZ0HE+Q0OilJT3y
         WBSl3pT4KsVj77SaZh9PH8+5K889vJb+hDm553b4JPJmx4nHg3clpTHHm7J9VOowdo4D
         /qXR8SPHlqW389eh3qqDQV6P7WjEHgZ/62/aSoR7JjI39X9jMsZOqNueCUAcG5B4syfR
         ODEb0riAbPJbr9SrFGt2w0t3zS0EeTJa3b+sgAV2eLxQk2+PcYH6Z8M6oPISod6hXJ7J
         sCkEyxxG5MkugPGFSJdJQLnEfmhWpLSSzCFqibmovpnIMt7zCqhq2pD9xlFfPBPxF23u
         XBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=8dvSdtqu6VrgOIk7nTpyJSf73Tmmywkq2XApZ/zllzc=;
        b=A2+ppskKO4+sHhKVaV4vEL58b6VBSpeYxAJI3wrMbgnBYKXbzTPiIJFsIe4O9RvdrO
         f62loP5yVp/PefMb0MpbJ7nz4GrRqyUU8bwsltkG7rA80nxT9Z46IHGDW0YSHJQtnu1L
         RowJ+s3G4rbqQ7oy8kOqzoe/05MgEh1IJ2UUbGR/qqu4OMagS+Gr0frBHLwu2yo2jc90
         2eSImE6YC3gkQ3v9liyo3DocAQzpi4j3sLAdAc8exi4MTt1qFREmPo8ydLJg1gKlIPGz
         CRQkK8vz1n2MtEdHGSPi/47wPgy/wVnOrqtpy6Nk9Cp+HFqm3v3DusneWzndBqNxLhQf
         bKtw==
X-Gm-Message-State: APjAAAUZvIme9TG+TsvRZK/3HlWmsvgRbhFskjY2E3+vyjrq+kGIi22u
        KMrsqxjpymTBK7/Vw2T19y94hISj
X-Google-Smtp-Source: APXvYqxqyvqbkhGAU6fdMSAquhZz1M7mkoymP0Y7QWhxl9QYqwhhUBPdfTpaSUnZASPyAt9xkbdQ7Q==
X-Received: by 2002:a17:90a:d204:: with SMTP id o4mr15832121pju.40.1574401129319;
        Thu, 21 Nov 2019 21:38:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j4sm1323616pjf.25.2019.11.21.21.38.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 Nov 2019 21:38:48 -0800 (PST)
Subject: Re: [PATCH v2] watchdog: make DesignWare watchdog allow users to set
 bigger timeout value
To:     "Wang, Peng 1. (NSB - CN/Hangzhou)" <peng.1.wang@nokia-sbell.com>,
        Guenter Roeck <groeck7@gmail.com>
Cc:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
From:   Guenter Roeck <guenter@roeck-us.net>
Message-ID: <2b2a1beb-d735-210c-847a-e3211f9efeca@roeck-us.net>
Date:   Thu, 21 Nov 2019 21:38:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc8ce91610dd4860858bfe92f104d74a@nokia-sbell.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/21/19 2:35 AM, Wang, Peng 1. (NSB - CN/Hangzhou) wrote:
>  From aabaa4b709bd451e566c906e8d1dca48f92f9b12 Mon Sep 17 00:00:00 2001
> From: Peng Wang <peng.1.wang@nokia-sbell.com>
> Date: Wed, 20 Nov 2019 15:12:59 +0800
> Subject: [PATCH] watchdog: make DesignWare watchdog allow users to set bigger
>   timeout value
>
> watchdog_dev.c provides means to allow users to set bigger timeout value
> than HW can support, make DesignWare watchdog align with this.
>
> ---
>
> v2 -> v1:
>         - use top_s to compare with wdd->max_hw_heartbeat_ms
>         - update wdd->timeout in case it's greater than HW supports
>         - fix comments error
>
> v1: initial version
>
> Signed-off-by: Peng Wang <peng.1.wang@nokia-sbell.com>

Sigh. I should have paid closer attention. Signed-off-by: has to be ahead of ---,

and the change log after it. The above format messes up everything.

Also, please run checkpatch and fix the problems it reports.

Sorry for not noticing it earlier. Please fix the problems and resubmit.

Thanks,

Guenter

> ---
>   drivers/watchdog/dw_wdt.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
> index fef7c61..12c116e 100644
> --- a/drivers/watchdog/dw_wdt.c
> +++ b/drivers/watchdog/dw_wdt.c
> @@ -114,7 +114,15 @@ static int dw_wdt_set_timeout(struct watchdog_device *wdd, unsigned int top_s)
>   	writel(top_val | top_val << WDOG_TIMEOUT_RANGE_TOPINIT_SHIFT,
>   	       dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
>   
> -	wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	/*
> +	 * In case users set bigger timeout value than HW can support,
> +	 * kernel(watchdog_dev.c) helps to feed watchdog before
> +	 * wdd->max_hw_heartbeat_ms
> +	 */
> +	if ( top_s * 1000 <= wdd->max_hw_heartbeat_ms )
> +		wdd->timeout = dw_wdt_top_in_seconds(dw_wdt, top_val);
> +	else
> +		wdd->timeout = top_s;
>   
>   	return 0;
>   }



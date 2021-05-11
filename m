Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED8E379E02
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 05:59:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbhEKEAe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 11 May 2021 00:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhEKEAd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 11 May 2021 00:00:33 -0400
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FBEBC061574;
        Mon, 10 May 2021 20:59:28 -0700 (PDT)
Received: by mail-oo1-xc35.google.com with SMTP id v13-20020a4aa40d0000b02902052145a469so2312775ool.3;
        Mon, 10 May 2021 20:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=giW4O7uyh9noQ9+JYEWJMRTABRiwMHrOiFKibTN3kLA=;
        b=NX3ACGqasz3BJiTxn7UpjFIeMeHy5mgdkpOUxR8SwUK1jDbDB0QQHySay46bGLU+4b
         tQiauKJe4Rki7coLFTYLM/l1SJo5/6QljT+JLJrdglpKZjOwFaIbV5/NCA/t3/GpKQg+
         JULfWHE9SRm70zYIoNge9I0lEL+3YT/ISroqfWkfn0vcFbOhsb6yFWczZ7wZRyju8cXF
         mmK7i784/Aa+uwRo26qZtf3HzmWIABTDVTUy/tF80IHNkJxUHfJOWe+/I8uqRZAzQHQE
         HGUr/hrbPhQ37e7qypo25l73vcYc0/KNBnjLeDBwfpZdw4RQ6SEL02Stte8oLUISEncv
         P/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=giW4O7uyh9noQ9+JYEWJMRTABRiwMHrOiFKibTN3kLA=;
        b=UZKkFCC6CAoLUIsTB3XDE57hMYRJXUDW/qb8F4dkFvZDVEhX0IcLan/tX1ZCHjTHUj
         r5SkT79pTvaCIVit4Tdr6WXCMl1P3f4Ypr1p0a8Ff1juNG2OdklZa+3LgqDt7WFq2TmO
         7V3FutmCFKL4WzTL3F/lzQ1nwAo67HRZ4k8WEVQgDqXUlPwxYp/uQWFP20a8ZG6+R5xy
         xSRWqL4+2VeT+/ZK8jMEYGQYLVusrM7uETGv1ZU8q2g8ke03K+MywimvBZMJ9dmRVfJn
         MUyWwsnrHb5xeWPWz7LwA8mL9QrN7RFux6DZmRfG84nn483lDaBlqteCMEPgZIDrKAFe
         5LsA==
X-Gm-Message-State: AOAM532j836vgfHgiwqZXafLX7NIkCS9lFHi8VZ551zYN2aE3wO41JNM
        PXxfyQioaaBF0PksgkNB6OuxrON2k/o=
X-Google-Smtp-Source: ABdhPJzouxajT4zAuNAX8U3eHKmyDOTpY7JrzMDbWS0lhs7KVcUStQ3Nzm1nI5PNSrFGAG51s/4vjg==
X-Received: by 2002:a4a:d0a5:: with SMTP id t5mr8027010oor.62.1620705567565;
        Mon, 10 May 2021 20:59:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o4sm1486331oia.36.2021.05.10.20.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 May 2021 20:59:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before
 suspend
To:     Robin Gong <yibin.gong@nxp.com>, wim@linux-watchdog.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1620732032-7675-1-git-send-email-yibin.gong@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d5364293-8cba-0d39-aa45-a55c5d6d2af6@roeck-us.net>
Date:   Mon, 10 May 2021 20:59:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1620732032-7675-1-git-send-email-yibin.gong@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 5/11/21 4:20 AM, Robin Gong wrote:
> Since watchdog_ping_work is not freezable so that it maybe scheduled before
> imx2_wdt_resume where watchdog clock enabled, hence, kernel will hang in
> imx2_wdt_ping without clock, and then watchdog reset happen. Prevent the
> above case by clearing WDOG_HW_RUNNING before suspend, and restore it with
> ping in imx2_wdt_resume.
> 
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>
> ---
>   drivers/watchdog/imx2_wdt.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
> index b84f80f..d3751e9 100644
> --- a/drivers/watchdog/imx2_wdt.c
> +++ b/drivers/watchdog/imx2_wdt.c
> @@ -357,6 +357,13 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
>   		 */
>   		__imx2_wdt_set_timeout(wdog, IMX2_WDT_MAX_TIME);
>   		imx2_wdt_ping(wdog);
> +
> +		/*
> +		 * clear WDOG_HW_RUNNING to prevent watchdog_ping_work running
> +		 * before imx2_wdt_resume where clock enabled, otherwise kernel
> +		 * will hang and watchdog reset happen then.
> +		 */
> +		clear_bit(WDOG_HW_RUNNING, &wdog->status);
>   	}
>   
>   	clk_disable_unprepare(wdev->clk);
> @@ -386,6 +393,7 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
>   	if (imx2_wdt_is_running(wdev)) {
>   		imx2_wdt_set_timeout(wdog, wdog->timeout);
>   		imx2_wdt_ping(wdog);
> +		set_bit(WDOG_HW_RUNNING, &wdog->status);
>   	}
>   
>   	return 0;
> 
I really don't like this; it depends on assumptions how the watchdog
core works, and it misuses WDOG_HW_RUNNING to indicate that the clock
is stopped (or that the driver is in suspend mode).

If ping doesn't work with the clock stopped, I think it would be much
better to have a flag indicating that the clock is stopped, and have
the ping function do nothing if it is called with stopped clock
(ie if suspended).

Guenter


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6A831CCBC
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Feb 2021 16:16:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbhBPPQW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Feb 2021 10:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhBPPQU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Feb 2021 10:16:20 -0500
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2A1C061574;
        Tue, 16 Feb 2021 07:15:40 -0800 (PST)
Received: by mail-oo1-xc2f.google.com with SMTP id s23so2342489oot.12;
        Tue, 16 Feb 2021 07:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wlHRyDO00CswHWyXMNtgRGHjB9u5SMJOjStX9EX5J1o=;
        b=OmNRK/bpK0scgvt9bzMW0BwKO+8hqFKMeP+qpvmVLQ7ftk/hl5FPLsQCGvKVaJKqnQ
         1pAdTXeR7QJ1WReNL6gDBjy7HsVDsrPqLT1sD7GfJPkZ6h9REja4LQN+sqVwFHpZF/Yp
         9H7t4NpWDa+6rom+BkMLk5vvHGvbIASZ5aIgJcxQL/dXMebXYNFOqGI83Zgv46xEZy/f
         pKJvWJdFAIM6vCBaB2HeeUCLiTFNA1UN3Cm7nSczt6G6UaOXqjoy1munrzmbZ3Bw456X
         omrt7oJNgQgLmRc0EW4s4JGlLzz+ELdBhUCzQJZY897GEM39akhHYarFve2uiC7wg9BJ
         7cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wlHRyDO00CswHWyXMNtgRGHjB9u5SMJOjStX9EX5J1o=;
        b=HORczmGxjgs6fuIO8pKuPcb3goIafoVmiE8erbL+xaT/xxwZmq5WE4ZepjPcFYNcDP
         6KaGiecvdcp5RIBwLQnCFr5up12GdJ/uJ1ZdMIScn/vOcIR1u2fV9/3Ohk9OtWgL+BSq
         5BVPyNNF19L21m5DCIO7VFrrLI4SpdZykkr9nCx91Lbz5Lp/153wptDneJRT4M7M6qTj
         BCG47iocSR6II6yM7cRdDopJc2iAFwX8tIC88kprngSOBQbu+nMsYxQpApopJ2mMrNs3
         SQptlDbCiaDMAq1rZvDUYnqWmR/osL+89tzrokk+H+nuxMxkSRlC0QQF5heukExBqzF6
         TALQ==
X-Gm-Message-State: AOAM533ls05GiGMaFpEUoqc5IPtmqSf71Ul+GA5DZrOjncIpi74YqCMr
        ChvoDbScKxQKiH7QS031vc1+rYqP7N0=
X-Google-Smtp-Source: ABdhPJz4QqARY3IpiFtou+75ts2zqBrWKPkax7x+NZjMNsjynY1YuRCXhOPaUj2RlfE07snwyqx2vg==
X-Received: by 2002:a4a:8c6b:: with SMTP id v40mr14540708ooj.23.1613488540018;
        Tue, 16 Feb 2021 07:15:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w18sm57183otk.79.2021.02.16.07.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 07:15:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: wdat_wdg: fix typo
To:     Flavio Suligoi <f.suligoi@asem.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210216141727.641224-1-f.suligoi@asem.it>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <df899af9-210e-5f32-83db-07e68d80ff4b@roeck-us.net>
Date:   Tue, 16 Feb 2021 07:15:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210216141727.641224-1-f.suligoi@asem.it>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 2/16/21 6:17 AM, Flavio Suligoi wrote:
> Fix the following typo:
> 
> "recommeded" --> "recommended"
> "firmare"    --> "firmware"
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/wdat_wdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/wdat_wdt.c b/drivers/watchdog/wdat_wdt.c
> index cec7917790e5..195c8c004b69 100644
> --- a/drivers/watchdog/wdat_wdt.c
> +++ b/drivers/watchdog/wdat_wdt.c
> @@ -208,7 +208,7 @@ static int wdat_wdt_enable_reboot(struct wdat_wdt *wdat)
>  	/*
>  	 * WDAT specification says that the watchdog is required to reboot
>  	 * the system when it fires. However, it also states that it is
> -	 * recommeded to make it configurable through hardware register. We
> +	 * recommended to make it configurable through hardware register. We
>  	 * enable reboot now if it is configurable, just in case.
>  	 */
>  	ret = wdat_wdt_run_action(wdat, ACPI_WDAT_SET_REBOOT, 0, NULL);
> @@ -475,7 +475,7 @@ static int wdat_wdt_suspend_noirq(struct device *dev)
>  		return 0;
>  
>  	/*
> -	 * We need to stop the watchdog if firmare is not doing it or if we
> +	 * We need to stop the watchdog if firmware is not doing it or if we
>  	 * are going suspend to idle (where firmware is not involved). If
>  	 * firmware is stopping the watchdog we kick it here one more time
>  	 * to give it some time.
> 


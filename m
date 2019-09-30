Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF242C2188
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2019 15:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730740AbfI3NM4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Sep 2019 09:12:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41936 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730693AbfI3NM4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Sep 2019 09:12:56 -0400
Received: by mail-pg1-f196.google.com with SMTP id s1so7380985pgv.8;
        Mon, 30 Sep 2019 06:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=FaFmGKrNxd9v1HavpyQ+K8DRicz4HO/nLLTmLpS4H/4=;
        b=dC3y8N+1mXAuru6Y7UPSIGS8R6/VwIKIpmGCelirODQGRZ+RUPCF4Mu7vOlrpIg8vg
         2NoWxqvY/Dy62pNz8CuzpjYeMVTRr00oTFykazjoNnjbJGwp/w2u4x8ChSz2OBbeZ8I2
         NqQMgilrDgO68KGnkuAEkSC4ei1qR+M0azgmrmmKuXMD/QA+oR91W/JLOGZV3MX3gu3i
         2dVvXIExzrGArJc7CjLOIASm65VLHAaTz0z1u5MQkfhlNgFD1hg88yOZSBPngSEcMrWF
         ce0eHEk+waH/GG7RERph9lkAJ9h/rlV30ENivlYSgMS8DSom4ysIyHcxQPTRAu18xD4n
         E/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FaFmGKrNxd9v1HavpyQ+K8DRicz4HO/nLLTmLpS4H/4=;
        b=bYDRVg6+kl4YyOoFtgSTRHPMYpuuUdmeRSQfS6Wyp2PjA1w4bMNW21bGc8MbcsVO6A
         URbn3VdEDO7V8AP3y3LFrLzxJG5WOLlnjuCQYH6wPqUUJGQvjPlrF2sEGLY0NlGLJeGy
         GrrW+6VArcHVABx/ZQM9FwXtqqufLY0f6BGfkssFfF3wGVVqfwZ9924EpVNkm3BUeGS1
         5TIE8/QuqwdgyY6JQvJuQP2Ov/vld+AsynLyrRyG+RSHCVWAJeobPqFPzE8EXLygIAzt
         0em8MC8LQlPtrVd/exEmTaOm6ZSjCMvy0GJgAQE8Ap35TIH9bCakaKAPNM8xxSUXArH2
         2EIg==
X-Gm-Message-State: APjAAAVqnFStYiRRmrTS8pPaemcjwgywLrBJMl89DaecCUXjCqUOF5F6
        O09RwoZe7IR4Er2Jx4bG+3DwzFaC
X-Google-Smtp-Source: APXvYqxPCJQaSlD8tvpwexKP7Vny6q6AkehhbKvjtfBpyahKcJFUkAysjZ0I+oWKDziZ3JCkzYmqMA==
X-Received: by 2002:a17:90a:17c5:: with SMTP id q63mr26614556pja.106.1569849175310;
        Mon, 30 Sep 2019 06:12:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y15sm15404983pfp.111.2019.09.30.06.12.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 06:12:53 -0700 (PDT)
Subject: Re: [PATCH] watchdog: meson: Fix the wrong value of left time
To:     Xingyu Chen <xingyu.chen@amlogic.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Qianggui Song <qianggui.song@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        linux-watchdog@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <ee3ea7d5-1adf-c718-4533-70b04bb23ecc@roeck-us.net>
Date:   Mon, 30 Sep 2019 06:12:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1569754429-17287-1-git-send-email-xingyu.chen@amlogic.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/29/19 3:53 AM, Xingyu Chen wrote:
> The left time value is wrong when we get it by sysfs. The left time value
> should be equal to preset timeout value minus elapsed time value. According
> to the Meson-GXB/GXL datasheets which can be found at [0], the timeout value
> is saved to BIT[0-15] of the WATCHDOG_TCNT, and elapsed time value is saved
> to BIT[16-31] of the WATCHDOG_TCNT.
> 
> [0]: http://linux-meson.com
> 
> Fixes: 683fa50f0e18 ("watchdog: Add Meson GXBB Watchdog Driver")
> Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/meson_gxbb_wdt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/meson_gxbb_wdt.c b/drivers/watchdog/meson_gxbb_wdt.c
> index d17c1a6..5a9ca10 100644
> --- a/drivers/watchdog/meson_gxbb_wdt.c
> +++ b/drivers/watchdog/meson_gxbb_wdt.c
> @@ -89,8 +89,8 @@ static unsigned int meson_gxbb_wdt_get_timeleft(struct watchdog_device *wdt_dev)
>   
>   	reg = readl(data->reg_base + GXBB_WDT_TCNT_REG);
>   
> -	return ((reg >> GXBB_WDT_TCNT_CNT_SHIFT) -
> -		(reg & GXBB_WDT_TCNT_SETUP_MASK)) / 1000;
> +	return ((reg & GXBB_WDT_TCNT_SETUP_MASK) -
> +		(reg >> GXBB_WDT_TCNT_CNT_SHIFT)) / 1000;
>   }
>   
>   static const struct watchdog_ops meson_gxbb_wdt_ops = {
> 


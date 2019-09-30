Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0C3DC219D
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Sep 2019 15:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730769AbfI3NQA (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Sep 2019 09:16:00 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45051 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726314AbfI3NP7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Sep 2019 09:15:59 -0400
Received: by mail-pg1-f194.google.com with SMTP id i14so7366949pgt.11
        for <linux-watchdog@vger.kernel.org>; Mon, 30 Sep 2019 06:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Krhzp/kdhG9uLjXBqRYQH27rCwUAa2H9/rRLKFXm9R8=;
        b=VYb1ka4/PxVoGkPHjmDuBJsrVWbSwmvn7YLvgNSi1T9B363nBLYV0+0FPnSfn0Ai9F
         QI92GHhqj9sJ+QAL4A1utu7rISIMr9rXg0qtdK8kf635nxNABtNvcKHvFBkOy6nKsHOn
         cmYOkARvR2GwNH3zfKYJv0MnbCPSkrpq7Qdfab7DfELf9acnQMOflpDi7tl6HIe1VCjl
         QKaMC23nmYOufVI9275JLDrPRaLPDUeEoUu2uhN/qQQCbCC0b+kUay7Cb3tlhfs0uIKx
         mjSciL+oHB7QLskbDgPZ5A1zUgdKk8k8v2YMLm2uT7zYt2alCuzaUt4JghRgPCaWZh9T
         B5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Krhzp/kdhG9uLjXBqRYQH27rCwUAa2H9/rRLKFXm9R8=;
        b=iCeTSY4d3L/VQJWQMqzralBrfscyvbPK6snTlXxkfXxKpGMXkM0gtW8wsjQPpwUWn8
         EDh5JkTEKm05/D7my/+QeuFJuuf1qFdeahZHrqWbV5XMNFlGSwQlpls/lQpNPvkmUjIK
         bzK+i/e0Ilq/pvAqbQGJ/H8NrkZbJPFbvJr351iO7TbP94Rvinto5sxc6FDP5+SdIup+
         1BSxK+zhAZ/XB7IyMtngiEuDNQofiiehURe0AW95EnvvHT86ui1M6zfMSQ9GevAyMTVg
         aJ4BDrNzmnXm7tEImuDwgPj4Nx2uyOfjeV7SZpqNJmYD5Q2l0AWigfnXQs18dtkdM1Es
         8d7A==
X-Gm-Message-State: APjAAAVZ3voMU+o3zzen5nqvXQWnxfnI34HveM1GGUvQg78u/PToa/28
        zK4sxLoi1wOKH+KvCeXPWU7Xflyu
X-Google-Smtp-Source: APXvYqwTq7GNmmdo48O83MFY2j/I+zEN3h/jgAOUIu+0mhcXUDci6RaLCbuxxlRgMSUCXpLZb+aVMA==
X-Received: by 2002:a17:90a:d106:: with SMTP id l6mr26995990pju.85.1569849359110;
        Mon, 30 Sep 2019 06:15:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7sm13229296pgj.35.2019.09.30.06.15.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 06:15:58 -0700 (PDT)
Subject: Re: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Ferry Toth <fntoth@gmail.com>
References: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <643ee5fc-a682-38bc-b92c-aee47913152e@roeck-us.net>
Date:   Mon, 30 Sep 2019 06:15:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/24/19 7:31 AM, Andy Shevchenko wrote:
> Normally, the watchdog is disabled when /dev/watchdog is closed, but if
> CONFIG_WATCHDOG_NOWAYOUT is defined, then it means that the watchdog should
> remain enabled. So we should keep it enabled if CONFIG_WATCHDOG_NOWAYOUT
> is defined.
> 
> Reported-by: Razvan Becheriu <razvan.becheriu@qualitance.com>
> Cc: Ferry Toth <fntoth@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/intel-mid_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/intel-mid_wdt.c b/drivers/watchdog/intel-mid_wdt.c
> index 2cdbd37c700c..470213abfd3d 100644
> --- a/drivers/watchdog/intel-mid_wdt.c
> +++ b/drivers/watchdog/intel-mid_wdt.c
> @@ -134,6 +134,7 @@ static int mid_wdt_probe(struct platform_device *pdev)
>   	wdt_dev->timeout = MID_WDT_DEFAULT_TIMEOUT;
>   	wdt_dev->parent = dev;
>   
> +	watchdog_set_nowayout(wdt_dev, WATCHDOG_NOWAYOUT);
>   	watchdog_set_drvdata(wdt_dev, dev);
>   
>   	ret = devm_request_irq(dev, pdata->irq, mid_wdt_irq,
> 


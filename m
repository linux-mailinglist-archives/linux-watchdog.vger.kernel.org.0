Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C24CE7E814D
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Nov 2023 19:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345549AbjKJS1M (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Nov 2023 13:27:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346156AbjKJS0R (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Nov 2023 13:26:17 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6AB23A21E;
        Fri, 10 Nov 2023 07:05:21 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-778a92c06d6so133833885a.2;
        Fri, 10 Nov 2023 07:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699628721; x=1700233521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=849p/NvESRZpFnJpVgwoxJCcpHggaarAP4BXMtHW02A=;
        b=DF9HvdXtJtVa9t7pssm6x9AVhY0dqpE4wLJ5FlK+QH693f3JhLkY0ioXEizOA/fiRP
         tQaRgoJUWknuuOZ25HNrHHErXKvaX6TEaXEGl/xIX+WbqSQmDrZmx/qgrEeP7S3AMPMX
         ZJeaAuECQMr+LJ7o60cmTjOvJRRgwzVh36nwoNndHRnte7tqF649w0emFt5wEzP1wzyH
         eHQWZ/vEjW69WopVeXygCWS8SLaNzo0HJNRGhRkHf9NbJ7JBGEmPNr+oUY05NOx0GT36
         5Hh4v+21lWTGGmUXT0TLTZHbFSVIwtNXVxnvJlrKva7X4NClSmcvv/jYA7JzoxtfMSCg
         tqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699628721; x=1700233521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=849p/NvESRZpFnJpVgwoxJCcpHggaarAP4BXMtHW02A=;
        b=CFFzIMbo5PlfS+qKd+nC1PiPWcHWxuB99dU5DamN+MQ/mqrH9NQ8oEUwwkt/Ef8F9F
         Qu7aqDlAm4OnY+9BC6/SoLtT9FUmQUzKE6x3oTxTLvcyvXHIpLeX3o738e/ZD9yF4ojj
         Cl3hm+/2j64tzeCumhBhSNwEQlqF+66XBhFgJVtnNW/HkCWPOaC5iAK3LRMzCzYcLPqu
         ZGu8xBkfjkuGWNPKycO9G/GidqyEcPG1fgm6WLQyBzE8i5We7AWmxmWcBYZpjJtawj/k
         us+YjGwhCMIzrnYXu0xgtQ0+YbKIZjVBo/cYAzOe1PbKq71qP4paHbpNw07xDKJBR6w0
         +Xkg==
X-Gm-Message-State: AOJu0Ywiahkg+x5U3JF0Jii8E85cfnPe8DweZdVFfJUunttooua965l6
        xbnK1SE6qo+PCwoLtXj7lSXWbQpKVss=
X-Google-Smtp-Source: AGHT+IGw02d1MIdMKxErKFoRT7igXRRoMVXqDq9TQ62bNdgZ8Xu1GktHunr2X7YCJrfStFkvF2C2nQ==
X-Received: by 2002:a05:620a:29c6:b0:779:ebe0:b662 with SMTP id s6-20020a05620a29c600b00779ebe0b662mr7435660qkp.4.1699628720865;
        Fri, 10 Nov 2023 07:05:20 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ua13-20020a05620a698d00b00774652483b7sm748992qkn.33.2023.11.10.07.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 07:05:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <846cc6e5-1db0-4399-9525-917328e535c3@roeck-us.net>
Date:   Fri, 10 Nov 2023 07:05:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] watchdog: rti_wdt: Drop RPM watchdog when unused
Content-Language: en-US
To:     Vignesh Raghavendra <vigneshr@ti.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Tero Kristo <t-kristo@kernel.org>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        afd@ti.com, n-francis@ti.com
References: <20231110100726.2930218-1-vigneshr@ti.com>
 <20231110100726.2930218-3-vigneshr@ti.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231110100726.2930218-3-vigneshr@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 11/10/23 02:07, Vignesh Raghavendra wrote:
> Do a RPM put if watchdog is not already started during probe and re
> enable it in watchdog start.
> 
> On K3 SoCs, watchdogs and their corresponding CPUs are under same PD, so
> if the reference count of unused watchdogs aren't dropped, it will lead
> to CPU hotplug failures as Device Management firmware won't allow to
> turn off the PD due to dangling reference count.
> 
> Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>   drivers/watchdog/rti_wdt.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 163bdeb6929a..87f2c333a41d 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -78,6 +78,9 @@ static int rti_wdt_start(struct watchdog_device *wdd)
>   	u32 timer_margin;
>   	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
>   
> +	if (pm_runtime_suspended(wdd->parent))
> +		pm_runtime_get_sync(wdd->parent);
> +
>   	/* set timeout period */
>   	timer_margin = (u64)wdd->timeout * wdt->freq;
>   	timer_margin >>= WDT_PRELOAD_SHIFT;
> @@ -337,6 +340,9 @@ static int rti_wdt_probe(struct platform_device *pdev)
>   	if (last_ping)
>   		watchdog_set_last_hw_keepalive(wdd, last_ping);
>   
> +	if (!watchdog_hw_running(wdd))
> +		pm_runtime_put_sync(&pdev->dev);
> +

You will have to explain why this is needed here, but not as error handling,
and why it is added in this patch after the changes in patch 1 of the series
which essentially declared that no error cleanup would be needed under
any circumstances.

Guenter

>   	return 0;
>   }
>   
> @@ -345,6 +351,9 @@ static void rti_wdt_remove(struct platform_device *pdev)
>   	struct rti_wdt_device *wdt = platform_get_drvdata(pdev);
>   
>   	watchdog_unregister_device(&wdt->wdd);
> +
> +	if (!pm_runtime_suspended(&pdev->dev))
> +		pm_runtime_put_sync(&pdev->dev);
>   }
>   
>   static const struct of_device_id rti_wdt_of_match[] = {


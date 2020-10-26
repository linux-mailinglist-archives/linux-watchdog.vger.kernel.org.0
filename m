Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21269298F91
	for <lists+linux-watchdog@lfdr.de>; Mon, 26 Oct 2020 15:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781707AbgJZOi2 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Oct 2020 10:38:28 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40313 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1781541AbgJZOgc (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Oct 2020 10:36:32 -0400
Received: by mail-oi1-f195.google.com with SMTP id m128so10677038oig.7;
        Mon, 26 Oct 2020 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5io4ps5em+DUkXTIFIaCPZ/s+MbgRWkOwsHdPLt9Ia0=;
        b=T4gb/JZVd8/y5VVMZAwz6Om3HtIzjE0Wb5LN53i42kUj17fzOjK/vJks4ytXdZKI1j
         J+0u+XAW/XHQnjx0C0b87bMF/D7ZF91b6vULADC1XWp7Pp9K9/ZjUC7T5nTLGDaYLB6U
         IQG7ncM740TCFf8fnjMX77zXkTet44tgCOL9C7pH+3ENOylJcZMER2DjRCkX+r/L4dDH
         ihieqP7Atm+BusEVY6V6NvOFwMetJ8Xi0RBC17joOSemUJFPE0SkYxY97RsieCHKJ4Gl
         EKHjbxm/OCT7glew9vPqqE0bGMAJZchsQ/FtrV+p9qxZzALiNnqSah40IRK+hJSwdyzy
         wpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5io4ps5em+DUkXTIFIaCPZ/s+MbgRWkOwsHdPLt9Ia0=;
        b=NkyjkZo7x3jXmhVJbSVIs+ZCL/+mtR2yNUKHcDA6Shr/vhTDCS4ZKpVdq0aGM/ePi4
         iEUxVJodTAN7a1YDejPoOgN05tG8BR3M1uMPBBZszQoVK1KNVgwwGaIDQ/MOd6G+NrcG
         caNj23x43ha7NBRLxtIIBAzCZY+5CSccbK7M5vsBMQygoC+BIV4MUX2bOftC91CbxsQx
         aaSvf5qk+g563kP0YfijHK3743uUhoUEoInLuodDar7WfQeEFRAvDNHck8VSFdwoyRsR
         WRxXPNo/7k58dUqKN20YDTIVtiTjmTtW4o4V+XFW8Z+2jthMliHO2HPEC3ERJfhIXgXh
         qvCw==
X-Gm-Message-State: AOAM533ODOKe7fziGO61WrjLk6ioZZvVND7TiOyeuN1QLpMj+OqLbP2B
        +MfiP2hLL0X0r+avaQNyrvTxcqkY+jk=
X-Google-Smtp-Source: ABdhPJylc0cmQrxWXkDKqgbIXR7iY+6ml/+NvcLU2t7qB4PyRBEuxXGbfP8yi34vCkCUqoInYxfaAg==
X-Received: by 2002:aca:4246:: with SMTP id p67mr10288014oia.109.1603722991001;
        Mon, 26 Oct 2020 07:36:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v21sm3657149oto.65.2020.10.26.07.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:36:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH 2/3] watchdog: sprd: change timeout value from 1000 to
 2000
To:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>
References: <20201026080919.28413-1-zhang.lyra@gmail.com>
 <20201026080919.28413-3-zhang.lyra@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <1bb8a3cf-5cdf-2c7f-29a2-3307f0de7cb0@roeck-us.net>
Date:   Mon, 26 Oct 2020 07:36:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201026080919.28413-3-zhang.lyra@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/26/20 1:09 AM, Chunyan Zhang wrote:
> From: Lingling Xu <ling_ling.xu@unisoc.com>
> 
> Because cpu_relax() takes different time on different SoCs, for some rare
> cases, it would take more than 1000 cycles for waitting load operation

waiting

> finished. The result of many times testing verified that changing the
> timeout value to 2000 can solve the issue.
> 

This is just a kludge that doesn't address the underlying problem.
As the wait loop states, "Waiting the load value operation done,
it needs two or three RTC clock cycles". This means the loop
should wait for a maximum number of clock cycles, and not run
as hot loop. If we assume that clk_get_rate() returns the clock
frequency, that frequency can be used to determine how long this
needs to be retried. It might also make sense - depending on how
long this actually takes - to use usleep_range() instead of
cpu_relax() to avoid the hot loop.

Guenter

> Fixes: 477603467009 ("watchdog: Add Spreadtrum watchdog driver")
> Signed-off-by: Lingling Xu <ling_ling.xu@unisoc.com>
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  drivers/watchdog/sprd_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/sprd_wdt.c b/drivers/watchdog/sprd_wdt.c
> index f3c90b4afead..4f2a8c6d6485 100644
> --- a/drivers/watchdog/sprd_wdt.c
> +++ b/drivers/watchdog/sprd_wdt.c
> @@ -53,7 +53,7 @@
>  
>  #define SPRD_WDT_CNT_HIGH_SHIFT		16
>  #define SPRD_WDT_LOW_VALUE_MASK		GENMASK(15, 0)
> -#define SPRD_WDT_LOAD_TIMEOUT		1000
> +#define SPRD_WDT_LOAD_TIMEOUT		2000
>  
>  struct sprd_wdt {
>  	void __iomem *base;
> 


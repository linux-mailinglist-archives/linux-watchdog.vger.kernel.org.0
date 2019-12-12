Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60B1F11C241
	for <lists+linux-watchdog@lfdr.de>; Thu, 12 Dec 2019 02:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727502AbfLLBfu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 Dec 2019 20:35:50 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35071 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbfLLBfu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 Dec 2019 20:35:50 -0500
Received: by mail-pg1-f196.google.com with SMTP id l24so279712pgk.2;
        Wed, 11 Dec 2019 17:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=znCe39Owfk1VXhozOlUo6vxKkddw4NBtn45wfJK96z0=;
        b=jW6qL+4ILoTg4t3OzSI3WHrW0oqCXiRsmJ7gaLZ0giHJ5cotlWNFXFMYpF7M4+hOnR
         Ab+sembKor1W+psbh2HCfAcME+BBqDgApocn60SQKjtBymlKUEr89OUfKjoethO+p/zw
         zpkyIvMpDvHnPSfhmisQfdY7Xr3xsKWDxtif+OeXI5W62Gm08TNWENYpoUonSF0iR7rO
         crUjH5+5zLSFRCxUvsU3Q05c6hEX5/jtALj5TaTWLzYZNg55uH8xC/Xv8nclVW5HIEO6
         kzqQF7fbBrTvzHbQpuMINQxlUcvrhU/wd8E6VTB3EQ/1cuLXZoMqhJRCfZDrRxPtLd6H
         dH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=znCe39Owfk1VXhozOlUo6vxKkddw4NBtn45wfJK96z0=;
        b=gdfg/BoZXwtSEyCbE4IvFO+u3ic8bRNSzvzyzf7m+hh6F5bbaDDDe+9qeyFUgU9afj
         VHcfKQ6ID9aNW+MpYaZIKCYnWokuB0eLgN6Umz767Blj+8ZB3YStobDgyNYImVjNHJ5b
         T7FxqHE7o8BR5LEpqIJmaztreObwWEUOFFpg6mkQZLxtMEsiYsDVwBGtSFszU/aOy54T
         DDqqtpMZFjFvWsNqLgPtL5/dQ2yifK9y1zLrE1FvDtlE4cIbC/xMp/ne71XHhFdg6pwp
         nKm+Wc5Z+85u53bzxeIdKjyfZCgzMweu4ksltAkHgCDwXu8oHMldxQC6+wS4Hqs6btvf
         bosA==
X-Gm-Message-State: APjAAAVOHS0qDQ9719AKTv7Rb8EktqKDSxd/vBJQNUtBlM/JZaBnAOe6
        j8JGwbENSZmtQuqilMCw8nw=
X-Google-Smtp-Source: APXvYqwmvOirvSuQ3HmC5UtijHoPuiSMrq4OVmDe2Pt4j1ceZwwDhwL0pTEu3D7UZsvT/UsnYMztHw==
X-Received: by 2002:a63:1b54:: with SMTP id b20mr7587104pgm.312.1576114549630;
        Wed, 11 Dec 2019 17:35:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i2sm4219838pgi.94.2019.12.11.17.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 17:35:48 -0800 (PST)
Subject: Re: [PATCH 1/2] watchdog: mtx-1: Drop au1000.h header inclusion
To:     Florian Fainelli <f.fainelli@gmail.com>,
        linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-mips@linux-mips.org, Paul Burton <paulburton@kernel.org>,
        Denis Efremov <efremov@linux.com>
References: <20191211210204.31579-1-f.fainelli@gmail.com>
 <20191211210204.31579-2-f.fainelli@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <21b7be75-db61-3b14-c57c-04af0b78b347@roeck-us.net>
Date:   Wed, 11 Dec 2019 17:35:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191211210204.31579-2-f.fainelli@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 12/11/19 1:02 PM, Florian Fainelli wrote:
> Including au1000.h from the machine specific header directory prevents
> this driver from being built on any other platforms (MIPS included).
> Since we do not use any definitions, drop it.
> 
> Reported-by: Denis Efremov <efremov@linux.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>   drivers/watchdog/mtx-1_wdt.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/watchdog/mtx-1_wdt.c b/drivers/watchdog/mtx-1_wdt.c
> index 25a92857b217..aeca22f7450e 100644
> --- a/drivers/watchdog/mtx-1_wdt.c
> +++ b/drivers/watchdog/mtx-1_wdt.c
> @@ -41,8 +41,6 @@
>   #include <linux/uaccess.h>
>   #include <linux/gpio/consumer.h>
>   
> -#include <asm/mach-au1x00/au1000.h>
> -
>   #define MTX1_WDT_INTERVAL	(5 * HZ)
>   
>   static int ticks = 100 * HZ;
> 

Given that this is nothing but yet another gpio watchdog driver, I'd
personally rather have it merged with gpio_wdt.c. On a higher level,
cleaning up old-style watchdog drivers, without converting them to
using the watchdog core, is a waste of time.

Wim, should we make it a policy to reject patches into old-style drivers
unless they fix a real bug ? It is getting a pain to have to review those
patches.

Thanks,
Guenter

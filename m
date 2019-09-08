Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 735BFAD118
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 Sep 2019 00:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731155AbfIHWyL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 8 Sep 2019 18:54:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41098 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731040AbfIHWyL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 8 Sep 2019 18:54:11 -0400
Received: by mail-pg1-f195.google.com with SMTP id x15so6675419pgg.8;
        Sun, 08 Sep 2019 15:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z0iRHKmBiQinItAoOCV7Xvfd0DCa69kHaha34GlOuj0=;
        b=bny6LTGIHPRrJwBt5jhBkz4wzOU1vAha1VqqWgPVQT033BrFy2fDtuQ2EzpLnwbOF1
         u35Uv+uBX1K9EUOieN7EdMkQ5n9G//jgX5TLRMw+l+R7toxtJp1RXvtqnm5wYze4W1Jk
         NGFHGGDWWpsoTRk/3XgDkD8D7HMMPZLvDLGsY8lGNeCEEhpWt7Cahf5IfypYMPGD57vq
         +AQbkBn7Oh/D4XA6+sNXs5CTu+AY7rwxltvUXfxRsn3+Y2T4z4v9O713SpYemDyYqLil
         35aIpIju3u+ugcAaDXdQ4/X1tANHmDMI4CJJCfkOOUn7d3zN4BMhFhQD2wZuAHzvqn0K
         /7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z0iRHKmBiQinItAoOCV7Xvfd0DCa69kHaha34GlOuj0=;
        b=ljCRzf++zKkE5dML4X072vhTsFexIMSt6+dAyZo19Zids0N5+0FOeix/bkLzbreLpF
         TmB66bg38Y7MF2HJFflquI9WjhZ65KdyRv7/Okoyqo56denmELuwc8G0+fUFxh3FXoo1
         v6UR3LGpibr/oMElqMFtFzRYNEoSp71p/J7aaIwXhpbyvqbx6N8OpSsUBanCdRvcsbAp
         FhO6YrpTcqewLiLiO6H5QyaaRePb9eZtfjG789+hNmtOMcu1j2G2mHVhQtf7Em2qOELu
         S5yL8IkzIIuNgLr6hgf6ScWvU51OFsjVtdLFonyhrYkdb8zzdZP0RiaQZZSHiE52C6tg
         jfIg==
X-Gm-Message-State: APjAAAWxvTzluzaCH00v5fbv6xkgEc7LWAq08qwUzwqwUHPwRN5ETpLk
        SriObO6UeT+SK/MBkvmiwfbIg0eh
X-Google-Smtp-Source: APXvYqxsowHN4lJTdDkAxGwi+22TzZUhytrgtNf8CHWTBgfa+l+sd8xnHMZkWBzb5zOuq7jFQEiewQ==
X-Received: by 2002:a62:76d1:: with SMTP id r200mr23938758pfc.27.1567983249347;
        Sun, 08 Sep 2019 15:54:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 30sm17871611pjk.25.2019.09.08.15.54.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Sep 2019 15:54:08 -0700 (PDT)
Subject: Re: [PATCH 2/2] watchdog: pm8916_wdt: fix missing include
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        wim@linux-watchdog.org
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org
References: <20190906203054.26725-1-jorge.ramirez-ortiz@linaro.org>
 <20190906203054.26725-2-jorge.ramirez-ortiz@linaro.org>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <50a36f88-ab09-44a1-db69-b4fa66e73534@roeck-us.net>
Date:   Sun, 8 Sep 2019 15:54:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906203054.26725-2-jorge.ramirez-ortiz@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/6/19 1:30 PM, Jorge Ramirez-Ortiz wrote:
> As per Documentation/process/submit-checklist.rst, when using  a
> facility #include the file that defines/declares  that facility.
> 
> Don't depend on other header files pulling in ones that you use.
> 

Correct, but then also don't include header files you don't use.
In this case, the include of linux/bitops.h is no longer necessary
if linux/bits.h is included since the driver doesn't really use bit
operations, only bit masks.

Guenter

> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>   drivers/watchdog/pm8916_wdt.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
> index cb5304c26ac3..b8d9df0f96f7 100644
> --- a/drivers/watchdog/pm8916_wdt.c
> +++ b/drivers/watchdog/pm8916_wdt.c
> @@ -1,5 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   #include <linux/bitops.h>
> +#include <linux/bits.h>
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/module.h>
> 


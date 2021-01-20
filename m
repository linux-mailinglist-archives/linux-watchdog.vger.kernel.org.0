Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71F9F2FD930
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jan 2021 20:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392308AbhATTHP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jan 2021 14:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392631AbhATTGI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jan 2021 14:06:08 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79957C061575;
        Wed, 20 Jan 2021 11:05:28 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id y14so6017647oom.10;
        Wed, 20 Jan 2021 11:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XsZ0D+R4gRAldoxvS3kk1TlXLeDzIWj+Q6OjhtiDafk=;
        b=cwNzQpOHjggWMeS/bJsAHYstSGpTouiiL9vjV58xTeVUepEPaIsdmQHKmo+RryrIk0
         t7g+xBR96F8KgXfqPfeyidEg3fpAY8OJL17SGKcgVHJnzag6/pBkFSBj24v8W6SdlZSB
         6eSw5XOSPYmTv0pIqnj7qjSUW12xliYbNxe0gXyfmpkoVHxlK7dhOK/hgZOexl6TluRy
         a59xpQYwfWYxPoQ5EdfaIcE+rJsPBDJVUD5NfzxlJ32P5hDPpYRsr6739DUvcv2NtSOF
         zKKMyX1ZFfo92QMGiEkpbEk52ybQojzCHyjrRm1N+XjtWKLjlPJI9/aHFxeu1IphmiG1
         K+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=XsZ0D+R4gRAldoxvS3kk1TlXLeDzIWj+Q6OjhtiDafk=;
        b=EAc8P16ypcDbrcJ+x8LVzR4E40C+H3FVWpd6rpnsAnYilJ9zrVsE0/53iLfAL7vQ3l
         SOIIH8cCK9Dhmzkvsh36zQhQRtkHeMG5mtAgiBft4eiYl04Cf0XpUcwhMZbD/R7qEno5
         FKHdCLAbzE4OMVCIqoP008wRXLSlBX0mCHSFVFN0XVcgF4Xrn81KjOrQUvuavJPohQRc
         1t8ZEkkgYjwhibJmW88sEKsRAuNesjvjGKW2AbntbcbfpPLtR3vbSyPnivR5shO0zZTJ
         p9jxO9B9I/hW7knpGHc0m1BBSyVRoNrv36Lk5u3DFDaCVHalffr1sAnAq9x2Sopkl3kI
         8O0g==
X-Gm-Message-State: AOAM531W1vp0Cj6fd4jghV2suqtK/WI/YwyPScKY4YGt2FdaqY+g4zpV
        RRiCV5KaH83Jw9nExjK3XLh6B70skNs=
X-Google-Smtp-Source: ABdhPJzI+40zdpIgkfLBKuFpWnAsnVbb7bqiXayOyDLidm4QWIAoGzXnMbxg1pUIxVbpTzQ7wwBx4Q==
X-Received: by 2002:a05:6820:41:: with SMTP id v1mr7133143oob.41.1611169527942;
        Wed, 20 Jan 2021 11:05:27 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j1sm537376oiw.50.2021.01.20.11.05.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Jan 2021 11:05:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 20 Jan 2021 11:05:26 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Cc:     jerry.hoemann@hpe.com, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog/hpwdt: Assign boolean values to a bool variable
Message-ID: <20210120190526.GA162927@roeck-us.net>
References: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611128890-79204-1-git-send-email-abaci-bugfix@linux.alibaba.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 20, 2021 at 03:48:10PM +0800, Jiapeng Zhong wrote:
> Fix the following coccicheck warnings:
> 
>  ./drivers/watchdog/hpwdt.c:345:2-12: WARNING: Assignment of
> 0/1 to bool variable.
> 
> ./drivers/watchdog/hpwdt.c:126:2-12: WARNING: Assignment of
> 0/1 to bool variable.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index cbd1498..22ddba3 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -123,7 +123,7 @@ static int hpwdt_settimeout(struct watchdog_device *wdd, unsigned int val)
>  	if (val <= wdd->pretimeout) {
>  		dev_dbg(wdd->parent, "pretimeout < timeout. Setting to zero\n");
>  		wdd->pretimeout = 0;
> -		pretimeout = 0;
> +		pretimeout = false;
>  		if (watchdog_active(wdd))
>  			hpwdt_start(wdd);
>  	}
> @@ -336,13 +336,13 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  	watchdog_init_timeout(&hpwdt_dev, soft_margin, NULL);
>  
>  	if (is_kdump_kernel()) {
> -		pretimeout = 0;
> +		pretimeout = false;
>  		kdumptimeout = 0;
>  	}
>  
>  	if (pretimeout && hpwdt_dev.timeout <= PRETIMEOUT_SEC) {
>  		dev_warn(&dev->dev, "timeout <= pretimeout. Setting pretimeout to zero\n");
> -		pretimeout = 0;
> +		pretimeout = false;
>  	}
>  	hpwdt_dev.pretimeout = pretimeout ? PRETIMEOUT_SEC : 0;
>  	kdumptimeout = min(kdumptimeout, HPWDT_MAX_TIMER);
> -- 
> 1.8.3.1
> 

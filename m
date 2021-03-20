Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2A6342DC6
	for <lists+linux-watchdog@lfdr.de>; Sat, 20 Mar 2021 16:33:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhCTPct (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 20 Mar 2021 11:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbhCTPck (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 20 Mar 2021 11:32:40 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B18DC061574
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Mar 2021 08:32:39 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id f73-20020a9d03cf0000b02901b4d889bce0so11454958otf.12
        for <linux-watchdog@vger.kernel.org>; Sat, 20 Mar 2021 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D6DNBizfASMzwy/uiGL9F1u36Qk0oJyxjvQHqCi21UE=;
        b=LbMis/+VLTQqvz2aV82osG5WeKsRCKFx0Dbgs8S+5wn9SAHu5ul+4G/lbtjNUAtfkO
         Pwqy1bhh/4fNpXiZyDfcjxDJzwdiO4nCD3CbTuvvG7hLmtYWijVXNAZYHksqGM3dviCY
         VCy0ddx2NUWERkpcadgpSWSLMNOTLxlnNA721KA4K891TnjaadGCxMQM3aQi9Etr+bcC
         ueMNWkZkOkgsvItyD2Di9yvJfxw6IzSBDrAaPHavlcLazB6MvJATTUunZwe2qGyfWQAt
         zyiAwYdygUfMdNsMxTxhgMjIOj8AlMc4wWsw4r4/4fLzuxAafcv4cJwChlEkGqdoFgQp
         F4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=D6DNBizfASMzwy/uiGL9F1u36Qk0oJyxjvQHqCi21UE=;
        b=rEuTebcJHWYeuk5hA+Ub06k6IK1e4zkOTX+KJOHYqHbCfQ1bNI3EYJ+/csDnsDTMT2
         yiPxHX1v3FsVrGJVLSemKY37i6+TEFz749VFDrRi7of/fBg3pLlyZ0ZUp0vUN+D6tUtA
         X05pcWbSPBBzvVL1Cq6n3EHwfkxK87sLq3lB7QOMLdmzbHqY+8CRL2k3iBJnYtt0P81V
         rS3ZF7MW2MOuwkPuW8W2jrogeVmmRikb6YZWRh6P9nVOZW4zCBfpAvCphWt4SHpl3TEc
         1s85yk6LP7SJPuRH0e/WXIbNWniwtGqR/mYHQjPwqmzRHcggEM9qRtR8x1IOQXMtOZQS
         aYJQ==
X-Gm-Message-State: AOAM530SEOt5X5XtZzsndP0x63XNPYH95ikKd5piJwrUt+fKi4II1p8Z
        EXa9Ysl7QOyKM+5J8lSqQEeA5ovahhY=
X-Google-Smtp-Source: ABdhPJyiNk41loglQPTNKZSO6hN/rZwA7ifHLrb9L3q2DRqatfhaE7ZSfHtfjscp9Sqt2aYFwePQJA==
X-Received: by 2002:a05:6830:1644:: with SMTP id h4mr5284118otr.349.1616254358699;
        Sat, 20 Mar 2021 08:32:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d26sm1946518oos.32.2021.03.20.08.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Mar 2021 08:32:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Use DIV_ROUND_UP() instead of open-coding it
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Michael Ellerman <mpe@ellerman.id.au>,
        enjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linux-watchdog@vger.kernel.org
References: <20210320082956.27689-1-lars@metafoo.de>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <e3ce4e26-7797-42f1-816d-e470fac1b660@roeck-us.net>
Date:   Sat, 20 Mar 2021 08:32:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210320082956.27689-1-lars@metafoo.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/20/21 1:29 AM, Lars-Peter Clausen wrote:
> Use DIV_ROUND_UP() instead of open-coding it. This makes it more clear
> what is going on for the casual reviewer.
> 

Those are all old watchdog drivers, which are not worth cleaning up.

As I said before, those drivers should only be touched to either fix
a real bug, to convert them to new style watchdog drivers, or to
drop them.

Thanks,
Guenter

> Generated using the following the Coccinelle semantic patch.
> 
> // <smpl>
> @r1@
> expression x;
> constant C1;
> constant C2;
> @@
>  ((x) + C1) / C2
> 
> @script:python@
> C1 << r1.C1;
> C2 << r1.C2;
> @@
> print C1, C2
> try:
> 	if int(C1) != int(C2) - 1 or int(C1) == 1:
> 		cocci.include_match(False)
> except:
> 	cocci.include_match(False)
> 
> @@
> expression r1.x;
> constant r1.C1;
> constant r1.C2;
> @@
> -(((x) + C1) / C2)
> +DIV_ROUND_UP(x, C2)
> // </smpl>
> 
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  drivers/watchdog/riowd.c       | 2 +-
>  drivers/watchdog/w83977f_wdt.c | 2 +-
>  drivers/watchdog/wdrtas.c      | 2 +-
>  drivers/watchdog/wdt977.c      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/riowd.c b/drivers/watchdog/riowd.c
> index 7008596a575f..aa8a929505b5 100644
> --- a/drivers/watchdog/riowd.c
> +++ b/drivers/watchdog/riowd.c
> @@ -132,7 +132,7 @@ static long riowd_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  			return -EFAULT;
>  		if ((new_margin < 60) || (new_margin > (255 * 60)))
>  			return -EINVAL;
> -		riowd_timeout = (new_margin + 59) / 60;
> +		riowd_timeout = DIV_ROUND_UP(new_margin, 60);
>  		riowd_writereg(p, riowd_timeout, WDTO_INDEX);
>  		fallthrough;
>  
> diff --git a/drivers/watchdog/w83977f_wdt.c b/drivers/watchdog/w83977f_wdt.c
> index fd64ae77780a..fbc31c4a1e0b 100644
> --- a/drivers/watchdog/w83977f_wdt.c
> +++ b/drivers/watchdog/w83977f_wdt.c
> @@ -231,7 +231,7 @@ static int wdt_set_timeout(int t)
>  	if (t < 15)
>  		return -EINVAL;
>  
> -	tmrval = ((t + 15) + 29) / 30;
> +	tmrval = DIV_ROUND_UP(t + 15, 30);
>  
>  	if (tmrval > 255)
>  		return -EINVAL;
> diff --git a/drivers/watchdog/wdrtas.c b/drivers/watchdog/wdrtas.c
> index c00627825de8..0c21ee535a74 100644
> --- a/drivers/watchdog/wdrtas.c
> +++ b/drivers/watchdog/wdrtas.c
> @@ -75,7 +75,7 @@ static int wdrtas_set_interval(int interval)
>  	static int print_msg = 10;
>  
>  	/* rtas uses minutes */
> -	interval = (interval + 59) / 60;
> +	interval = DIV_ROUND_UP(interval, 60);
>  
>  	result = rtas_call(wdrtas_token_set_indicator, 3, 1, NULL,
>  			   WDRTAS_SURVEILLANCE_IND, 0, interval);
> diff --git a/drivers/watchdog/wdt977.c b/drivers/watchdog/wdt977.c
> index c9b8e863f70f..7cff1300be3e 100644
> --- a/drivers/watchdog/wdt977.c
> +++ b/drivers/watchdog/wdt977.c
> @@ -201,7 +201,7 @@ static int wdt977_set_timeout(int t)
>  	int tmrval;
>  
>  	/* convert seconds to minutes, rounding up */
> -	tmrval = (t + 59) / 60;
> +	tmrval = DIV_ROUND_UP(t, 60);
>  
>  	if (machine_is_netwinder()) {
>  		/* we have a hw bug somewhere, so each 977 minute is actually
> 


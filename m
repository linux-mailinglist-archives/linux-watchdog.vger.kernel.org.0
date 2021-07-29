Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFB4D3DA8F8
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jul 2021 18:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhG2Q1j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 29 Jul 2021 12:27:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhG2Q1j (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 29 Jul 2021 12:27:39 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB3CC061765;
        Thu, 29 Jul 2021 09:27:34 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id y16-20020a4ad6500000b0290258a7ff4058so1714105oos.10;
        Thu, 29 Jul 2021 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wccDcOIxHNoamIBs8+qI6cGQUyc31knn7IGUD84IWoI=;
        b=Gi6LIfs9OvoxHljklLH6u2B9MqdkFBOeLMUStKM35DZ710RYV1kO+msYERWa6S3C2G
         dUuL+42LKQP4hzVVvc2oWyNfpt2NxH/dbnpik+YT8m4pC3RrPiFTNaWLxYIhCcWmqLmD
         rV6dhmZHY8+j/PRuNy0KFmoxLox25zcM4CX+mjvrSIc2Gz9b5+2QvghrEVI7zhuBikaW
         yx2KbG7aQoYzmwID0T0Tn+IDftwP7gFw2l5n/0efCVi4XLPVteBQ8MPCIi3LYsugjM4/
         0FWJ0tB/hTa0gj2OrtTahqHRqoTUiMSD6+v6vbXJAz+QwQnWAHmfJzOPOydrPIZLb12P
         HWsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wccDcOIxHNoamIBs8+qI6cGQUyc31knn7IGUD84IWoI=;
        b=UI4QzSD+dcs9pGQBiAz3NbeXZ6LF0U2Ong5BG0Y27N7K+BokGZFR7f+zlkPcatvyJi
         /0mnbmbMKsMXtzWsKDgFNMnOFNQoCjwnmNk1Oh4l4nwRYuFmPrIgg4I11UyeF0J2BcEo
         JfniJVg12ERBVBPbTNQq47eCwAa7ZqMmW/GlXL9pBSIrlSn3zpdGp1U4tIKPTAUfSosz
         TqLzFbzidSqxkYrsBQSXeNLugtLKJhIrgIm+dypQKuRLDDfZM0RjQRx7Qh1CU0V5cHlR
         z3FTvSaOyyBogfVT1BHTAUI1HCEnls44MAfINTUPR++ufsDIECOcJDG0hsCYEUfQlk+8
         wutA==
X-Gm-Message-State: AOAM5331BWscNPWMyVq2baHD6CxfZbh1kb/VVSttRDs8gOFjuyrmPzzn
        BPaKgywJOV+tDq4y5SvQZFkhJwsl4P8=
X-Google-Smtp-Source: ABdhPJzx11z/wO9bOtkouRxSASlYujObu13PzWtD5mUe7KEWY08XL6Clk9UGPlizniiwYVOBvlrfrQ==
X-Received: by 2002:a4a:cb0e:: with SMTP id r14mr3561068ooq.70.1627576053889;
        Thu, 29 Jul 2021 09:27:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y19sm540815ooa.2.2021.07.29.09.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 09:27:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] watchdog: Fix an invalid memory access in
 'watchdog_cdev_unregister()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        wim@linux-watchdog.org, curtis.klein@hpe.com
Cc:     linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <dcb65e66acd1a50d65635b35d0d340846c7d10c7.1627575359.git.christophe.jaillet@wanadoo.fr>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <af32d970-b96e-724b-7f5e-c9544f8aee6a@roeck-us.net>
Date:   Thu, 29 Jul 2021 09:27:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dcb65e66acd1a50d65635b35d0d340846c7d10c7.1627575359.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 7/29/21 9:16 AM, Christophe JAILLET wrote:
> A few lines before 'watchdog_hrtimer_pretimeout_stop(wdd)', we explicitly
> set 'wdd->wd_data' to NULL.
> So, it is more than likely than this call will lead to an invalid
> memory access.
> 
> Move this call before the 'wdd->wd_data = NULL;'
> 
> Fixes: 7b7d2fdc8c3e ("watchdog: Add hrtimer-based pretimeout feature")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Completely untested!
> Not sure at all, that it is the way to fix it.

Nice catch. Should be ok.

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/watchdog_dev.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 3bab32485273..ffd8f1a82355 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1096,6 +1096,8 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>   		watchdog_stop(wdd);
>   	}
>   
> +	watchdog_hrtimer_pretimeout_stop(wdd);
> +
>   	mutex_lock(&wd_data->lock);
>   	wd_data->wdd = NULL;
>   	wdd->wd_data = NULL;
> @@ -1103,7 +1105,6 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>   
>   	hrtimer_cancel(&wd_data->timer);
>   	kthread_cancel_work_sync(&wd_data->work);
> -	watchdog_hrtimer_pretimeout_stop(wdd);
>   
>   	put_device(&wd_data->dev);
>   }
> 


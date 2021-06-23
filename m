Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90F43B1903
	for <lists+linux-watchdog@lfdr.de>; Wed, 23 Jun 2021 13:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhFWLeH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 23 Jun 2021 07:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbhFWLeG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 23 Jun 2021 07:34:06 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86F78C061574;
        Wed, 23 Jun 2021 04:31:49 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id n99-20020a9d206c0000b029045d4f996e62so1598749ota.4;
        Wed, 23 Jun 2021 04:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bv2OIE88drJYx54rPZawJzllQ5seF6RUH1fKOPSuZ1k=;
        b=quZT8TN/B1px2LDz44aKHxqTlqdZsT0YcyKFJ9Mt2u1YrxVzQB9GHaI102LbMV9Uv6
         EMar4xkHFJQv/FDoiFqSh5U7k7nAGO8AfyEJAg/7KoJbpotJZmNMX68ooDCv+XGCvw2p
         mGfcdD1d90Za0NkPrmvgQYqpSu3RKkCkPy0Jw1BG3jd83OX34RDBq1/PmRSiiz98uoZD
         /OIyPwZxqau4cBrywhIc/7P/jt8KDA5hy41pXfB5mzSE0PTBv8qli5AmJgG0ryVsePd1
         1ueVs/8T3GhihjnwasqUmb/GFU7HKP/wNCLL7qQ9MGdJb231ahRNU2X++S2ieTpSgdjL
         ttSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=bv2OIE88drJYx54rPZawJzllQ5seF6RUH1fKOPSuZ1k=;
        b=P96g1ZmP0GMY2y5uf9Kx5hRe6y1fJVXuhXMQeP3b1pa4m7RoEX9K/9CqeSpR/RooEH
         vE3/xqr0vHIuBSxXTL/4Nv9C0huvRcCLfhNMaX9+tBpmgrHG4A2m23B26xnmLs2aPmoz
         VvzvA7H055Id6bAUaxsSik9DWjkeaUf8nTn/VJGPM9XH51GW4DaTpeIRim/bu8lrESqG
         JuPf2dFhT+Ho00jjJtf+fG1qXEnU2n971XTXnd17cxy2dUcFlQb1yd1h5wwB9sRlqdcS
         2aeyx2w9aFDiY0T4a9KyyneivE2vfYPFl6o8KP03QKkPhUqKnjC7QdoV+rU7cv6y4rj/
         LFXg==
X-Gm-Message-State: AOAM530ZfImmzbxz0uEoSZ+Btz0NX/6sYTxQHDVU1QOCSRFF+2OqQQwC
        C9Iq/szRexIBzeKFVe/WNo4=
X-Google-Smtp-Source: ABdhPJwNRZ8jdDqN5RUZfL3RqJ1gxul7jWp1js7wJOaRZ6W6Dp2Hw1giusqcSA+eEkMCo50d2Ga3eg==
X-Received: by 2002:a9d:2cf:: with SMTP id 73mr7381852otl.314.1624447908980;
        Wed, 23 Jun 2021 04:31:48 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x29sm510858ott.68.2021.06.23.04.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 04:31:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 23 Jun 2021 04:31:46 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Curtis Klein <curtis.klein@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Fix NULL pointer dereference when releasing
 cdev
Message-ID: <20210623113146.GA1316730@roeck-us.net>
References: <1624429583-5720-1-git-send-email-curtis.klein@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624429583-5720-1-git-send-email-curtis.klein@hpe.com>
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Jun 22, 2021 at 11:26:23PM -0700, Curtis Klein wrote:
> watchdog_hrtimer_pretimeout_stop needs the watchdog device to have a
> valid pointer to the watchdog core data to stop the pretimeout hrtimer.
> Therefore it needs to be called before the pointers are cleared in
> watchdog_cdev_unregister.
> 
> Fixes: 7b7d2fdc8c3e ("watchdog: Add hrtimer-based pretimeout feature")
> Reported-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Curtis Klein <curtis.klein@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_dev.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 3bab324..ffd8f1a 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -1096,6 +1096,8 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>  		watchdog_stop(wdd);
>  	}
>  
> +	watchdog_hrtimer_pretimeout_stop(wdd);
> +
>  	mutex_lock(&wd_data->lock);
>  	wd_data->wdd = NULL;
>  	wdd->wd_data = NULL;
> @@ -1103,7 +1105,6 @@ static void watchdog_cdev_unregister(struct watchdog_device *wdd)
>  
>  	hrtimer_cancel(&wd_data->timer);
>  	kthread_cancel_work_sync(&wd_data->work);
> -	watchdog_hrtimer_pretimeout_stop(wdd);
>  
>  	put_device(&wd_data->dev);
>  }
> -- 
> 2.7.4
> 

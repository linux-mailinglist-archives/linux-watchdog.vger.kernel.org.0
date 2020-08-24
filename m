Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABD124FF24
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Aug 2020 15:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727955AbgHXNk4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 24 Aug 2020 09:40:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgHXNhI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 24 Aug 2020 09:37:08 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B952AC061573;
        Mon, 24 Aug 2020 06:37:07 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q1so4243212pjd.1;
        Mon, 24 Aug 2020 06:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HA+IoySHM18+Ji1+GkkEUhRTYU4tOUsxV8f7iuUjK5g=;
        b=NYCwq2y5k6ImOIJqiNBLvPWNsOxzxMwTRw8nkWW+nitE6MBbqYGs8qNux0UrH8DtVH
         Oj1LcSHB8tVC3aHAEYXu4uSRwT9BhTDF3bCsEA1jDRzjf1Mgyp8jWJ62LBAS8Xm56GIo
         QrWV8P59A0oH/6rl08S5VoZPUL4ZgpFUlmM4khwVbz2EnHZ+r5UUHmA6mN8Lin9JNJGJ
         mGesnMeXjMpXwBXXYvdxK6rUGKrbIdGZo/vmKDVVNbWo4oEhbE71VJGBipHldOjDP5bi
         u3EUj8MPrfMSJ7rwXQQdYjVPtSR5uCAyhhYigbh5qCRdaylkTtpMjRgLRrG0KsMdmNTj
         fvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=HA+IoySHM18+Ji1+GkkEUhRTYU4tOUsxV8f7iuUjK5g=;
        b=W2xLy5uwX8O+ntbCjV7TdZb5fzQ8y3pph3R7MKVFsdVNzZ4++FK91eOC2wxsPkzT+V
         lcDW69tw9j9W+16zzhRGyze2sly0CCpekO9eW02oYGh57tN4XrZRe31qdmyTVZROvBHQ
         Qgt2020iS3YdhF86xUnExEtCdbXctHoACGVWzLItAwysonWzFAzTFgNjkk3ZrGnjE7Ow
         Gmmr+9h/ZBWGrPQNZZicEEiTopOAt5AP0vHv1yG89ACrKQkNa27P6axqtekUmS1zc7qO
         pi1EVnJYGnPFkOdsxKTYSH8Ua6P1yeGAqb/pezgnx4WxftDuFbLq259R+tzdLKdo4rA3
         pmSQ==
X-Gm-Message-State: AOAM5328RNGEnv8UCtekGcWVEsOfvtzzAgZvrSIu9RxzaKmOUeb5fUYa
        FYA6TZNjVOHrztui8aBu1fE=
X-Google-Smtp-Source: ABdhPJxwjGu4tstbhUR2JUxmbqXCQFVMmCX8uCMbium/N3v5e/W/rOAne2C5/v8JsN9ExfIPSaB71A==
X-Received: by 2002:a17:902:e906:: with SMTP id k6mr3929841pld.41.1598276227353;
        Mon, 24 Aug 2020 06:37:07 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e9sm12029721pfh.151.2020.08.24.06.37.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 06:37:06 -0700 (PDT)
Date:   Mon, 24 Aug 2020 06:37:05 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     kjlu@umn.edu, Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: Fix memleak in watchdog_cdev_register
Message-ID: <20200824133705.GB192024@roeck-us.net>
References: <20200824024001.25474-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200824024001.25474-1-dinghao.liu@zju.edu.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Aug 24, 2020 at 10:40:01AM +0800, Dinghao Liu wrote:
> When watchdog_kworker is NULL, we should free wd_data
> before the function returns to prevent memleak.
> 
> Fixes: 664a39236e718 ("watchdog: Introduce hardware maximum heartbeat in watchdog core")
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_dev.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 6798addabd5a..785270ee337c 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -994,8 +994,10 @@ static int watchdog_cdev_register(struct watchdog_device *wdd)
>  	wd_data->wdd = wdd;
>  	wdd->wd_data = wd_data;
>  
> -	if (IS_ERR_OR_NULL(watchdog_kworker))
> +	if (IS_ERR_OR_NULL(watchdog_kworker)) {
> +		kfree(wd_data);
>  		return -ENODEV;
> +	}
>  
>  	device_initialize(&wd_data->dev);
>  	wd_data->dev.devt = MKDEV(MAJOR(watchdog_devt), wdd->id);
> -- 
> 2.17.1
> 

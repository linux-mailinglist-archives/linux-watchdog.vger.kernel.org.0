Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021972A80D2
	for <lists+linux-watchdog@lfdr.de>; Thu,  5 Nov 2020 15:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730960AbgKEO0Z (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 5 Nov 2020 09:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbgKEO0Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 5 Nov 2020 09:26:25 -0500
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16900C0613CF;
        Thu,  5 Nov 2020 06:26:25 -0800 (PST)
Received: by mail-oo1-xc44.google.com with SMTP id l26so461738oop.9;
        Thu, 05 Nov 2020 06:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fnUc98TZMoYnFy4oELrU7aOcqJiQ3OcwocODgGvI4RI=;
        b=kbBJSaYORASAn7QfCPa0U1B4KmyJPGfa1aOhqZ0fU4iJAadH1b0KoCtg+NH02B9pCs
         aXqqNv8vONMBiV/lh2yay/lGgDivCDN9ivVeSaBmWXVMWVTf1ncq9sai61XpjQbDUPdZ
         AbCROf5aLi5mdu3BOy5nGvEQ1Ii7YnVZr3A0WXcWhaHNtuIs1q1PZbNzCxHVFloUeB+S
         OOOOycxBMLI4S3Whcq5o0fTIp9GnTW/PTqP2ZogCPHtCdBo2bWZewoNHmS+GoZ8k/2PA
         68iwWDhELxUvunALEGjqkI3kXh0a1jo2FEXzIeZJ3RMhQnRtiz4z746zaqjXGuodUKHs
         QVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=fnUc98TZMoYnFy4oELrU7aOcqJiQ3OcwocODgGvI4RI=;
        b=mFQ9oHL9Rf4h2Q6mI3rCksnWHkqJy89GI3daB1NjrZM5YCWUa1Xx+Yfjx8NhQxXGmB
         WIdXZmTRRmyeskmUbz2QtekDvpu05DAJuBQmnGVPnXhHs9i4m7ge4cJ1TXybuz6fpwe/
         ACQZUnmCxCwcNr5arZKxdPh+3+WNANBAziaEhe+j/KvJyvi/Ko6c7o4XzEzzI5Mg8AJk
         pe0MT7M3D3qBJL7HNehn5kKNbSmKns6oL9OtCwFj1P8c/hf7bmQnUOzdgeIBCb1V9SMO
         YsuUEcncHTeExRxZfsXAGZxbQwrJ9eGk+z0rr9608Pfva+xt+0krihL06l+VuA5so9Qw
         Y7sg==
X-Gm-Message-State: AOAM53316gRLH8RmTPBIZQAwGxst+4b0EeZ/w5WC6+GhSCOnI9EdvjzY
        +vAzD3xKXDJX2Q9uWecL8BE=
X-Google-Smtp-Source: ABdhPJyXZSMqjaoO0cOGxc8x1tuw3aaVlBjZD55WXlo4ngZLKeLRQoPKQWQlQ3dxsPBki6ind9j6SA==
X-Received: by 2002:a4a:b209:: with SMTP id d9mr1952292ooo.70.1604586383027;
        Thu, 05 Nov 2020 06:26:23 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t25sm351860otj.13.2020.11.05.06.26.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 06:26:22 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 5 Nov 2020 06:26:21 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Wensheng <wangwensheng4@huawei.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, rui.xiang@huawei.com,
        guohanjun@huawei.com
Subject: Re: [PATCH -next v3 1/2] watchdog: Fix potential dereferencing of
 null pointer
Message-ID: <20201105142621.GB1389@roeck-us.net>
References: <20201105123848.93735-1-wangwensheng4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105123848.93735-1-wangwensheng4@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 05, 2020 at 12:38:47PM +0000, Wang Wensheng wrote:
> A reboot notifier, which stops the WDT by calling the stop hook without
> any check, would be registered when we set WDOG_STOP_ON_REBOOT flag.
> 
> Howerer we allow the WDT driver to omit the stop hook since commit
> "d0684c8a93549" ("watchdog: Make stop function optional") and provide
> a module parameter for user that controls the WDOG_STOP_ON_REBOOT flag
> in commit 9232c80659e94 ("watchdog: Add stop_on_reboot parameter to
> control reboot policy"). Together that commits make user potential to
> insert a watchdog driver that don't provide a stop hook but with the
> stop_on_reboot parameter set, then dereferencing of null pointer occurs
> on system reboot.
> 
> Check the stop hook before registering the reboot notifier to fix the
> issue.
> 
> Fixes: d0684c8a9354 ("watchdog: Make stop function optional")
> Signed-off-by: Wang Wensheng <wangwensheng4@huawei.com>
> ---
>  drivers/watchdog/watchdog_core.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 423844757812..945ab38b14b8 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -267,8 +267,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  	}
>  
>  	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> +		if (!wdd->ops->stop) {
> +			pr_err("watchdog%d: Cannot support stop_on_reboot\n",
> +				wdd->id);
> +			watchdog_dev_unregister(wdd);
> +			ida_simple_remove(&watchdog_ida, id);
> +			return -EINVAL;
> +		}

The problem with this is that setting the "stop_on_reboot" module parameter
would now prevent the watchdog from being loaded, which isn't really
desirable and might go unnoticed. I think the initial check should be
above, with the "Mandatory operations" check, and
	if (stop_on_reboot != -1) {
should be extended to
	if (stop_on_reboot != -1 && wdd->ops->stop) {

or possibly more fancy:

	if (stop_on_reboot != -1) {
		if (stop_on_reboot) {
			if (!wdd->ops->stop)
				pr_warn("watchdog%d: stop_on_reboot not supported\n", wdd->id);
			else
				set_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
		} else {
			clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);
		}
	}

Thanks,
Guenter

>  
> +		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
>  		ret = register_reboot_notifier(&wdd->reboot_nb);
>  		if (ret) {
>  			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> -- 
> 2.25.0
> 

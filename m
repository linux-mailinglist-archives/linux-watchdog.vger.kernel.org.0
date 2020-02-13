Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63EEF15CAFA
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Feb 2020 20:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727913AbgBMTMe (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Feb 2020 14:12:34 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33143 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727652AbgBMTMd (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 13 Feb 2020 14:12:33 -0500
Received: by mail-pf1-f193.google.com with SMTP id n7so3549772pfn.0;
        Thu, 13 Feb 2020 11:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1yzD2nIJu9iDj+p19SPYjqCO9YDBUBldaHl5pgvZIkA=;
        b=aR+wadMQloZsuakKRGdXqCS5O/mnk2txXZviNhUOAdiS6sB0IeCQbc3wOGVs/r5Hgn
         0S5xiWgDt70dH1rIlZK4zZbWbl09aNR2owPR/vLCxcz56ZNOmtZb6M9Va7Om+9H0yQfz
         STwgqvoT2XokTQVT9/iJQd67NYIF135MjvKixSxl+GzkMxeaQq5hsUNPjDQ1Bd8aL1Dw
         /404HwN1BywbApKQZ/WPXAmJbtsCGeBruBtriG1whqCAb1ZDSDSv9dekd1KNLAOeNfVu
         rnGpP14U9WN2gDP9HzcGt9AmvTwVVZ2Q+8mG7SFoysTucdDRP6gmNZhimy+evvsb8tH3
         oyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1yzD2nIJu9iDj+p19SPYjqCO9YDBUBldaHl5pgvZIkA=;
        b=DlYwr4fanCoX5mIDJOXHWnDNuKPscEmc+hgBT4ArsLPUTJpuAw3UV0NtBwd1jg5OXx
         3SrqBKOUm62So+Q2caNWF/htSMHpj/VM9qGmLUxSOQXlvdlhCPyYMDzfJFnXJm1nowmj
         1or+YaFWjKQkNugWzNV5K8yKMy6EZ7KmhctBOmZ7B83O2B7Sox8hB90IJGmeC/ltGfZ7
         QM7nbDxIDmBhUVI2MyHp2PGlHHf8VBSY1TjgDZklMVnzTeU8s+Bl1qoqKCXUvQFSvSwk
         BYUTAmaIFTaIGuzw5DLtbCCrDJJD3s+FPCuw10quGGpQFEkg2/Q0HzL4gtx2uHYwPZGn
         /stg==
X-Gm-Message-State: APjAAAU222I8ARhyQ9NM0d2xdUFhj/xsFL95Bz55DXhHz/oSZTvD2aYc
        3+SZmA8HVO27ts9X8bhHHpc=
X-Google-Smtp-Source: APXvYqw39zG2TOqVnTodCGBX5UdXeAZwww9nEINmKr1buhV9EIw/P2mvX/jEE5sMFWQv6g+KKOWUdw==
X-Received: by 2002:a63:aa0d:: with SMTP id e13mr6982145pgf.75.1581621152860;
        Thu, 13 Feb 2020 11:12:32 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c26sm4148476pfj.8.2020.02.13.11.12.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 11:12:31 -0800 (PST)
Date:   Thu, 13 Feb 2020 11:12:30 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Dmitry Safonov <dima@arista.com>
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Safonov <0x7f454c46@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: Check WDOG_STOP_ON_REBOOT in reboot
 notifier
Message-ID: <20200213191230.GA17448@roeck-us.net>
References: <20200213175958.105914-1-dima@arista.com>
 <20200213175958.105914-2-dima@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200213175958.105914-2-dima@arista.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 13, 2020 at 05:59:57PM +0000, Dmitry Safonov wrote:
> Many watchdog drivers use watchdog_stop_on_reboot() helper in order
> to stop the watchdog on system reboot. Unfortunately, this logic is
> coded in driver's probe function and doesn't allows user to decide what
> to do during shutdown/reboot.
> 
> On the other side, Xen and Qemu watchdog drivers (xen_wdt and i6300esb)
> may be configured to either send NMI or turn off/reboot VM as
> the watchdog action. As the kernel may stuck at any state, sending NMIs
> can't reliably reboot the VM.
> 
> At Arista, we benefited from the following set-up: the emulated watchdogs
> trigger VM reset and softdog is set to catch less severe conditions to
> generate vmcore. Just before reboot watchdog's timeout is increased
> to some good-enough value (3 mins). That keeps watchdog always running
> and guarantees that VM doesn't stuck.
> 
> As a preparation to move the watchdog's decision to stop on reboot or
> not in userspace, allow WDOG_STOP_ON_REBOOT to be set during runtime,
> not only on driver's probing. Always register reboot notifier and check
> WDOG_STOP_ON_REBOOT inside it (on actual reboot).
> 

Does that really have to be decided at runtime, by the user ?
How about doing it with a module parameter ?

Also, I am not sure if an ioctl is the best means to do this, if it indeed
makes sense to decide it at runtime. ioctl implies an open watchdog device,
which interferes with the watchdog daemon. This means that the watchdog
daemon would have to be modified to support this, making this a quite expensive
change. It also implies that the action would have to be known when the
watchdog daemon is started, suggesting that a module parameter should be
sufficient.

Guenter

> Signed-off-by: Dmitry Safonov <dima@arista.com>
> ---
>  drivers/watchdog/watchdog_core.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 861daf4f37b2..ebf80ff3e8ce 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -153,6 +153,10 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
>  	struct watchdog_device *wdd;
>  
>  	wdd = container_of(nb, struct watchdog_device, reboot_nb);
> +
> +	if (!test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
> +		return NOTIFY_DONE;
> +
>  	if (code == SYS_DOWN || code == SYS_HALT) {
>  		if (watchdog_active(wdd)) {
>  			int ret;
> @@ -254,17 +258,14 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
>  		}
>  	}
>  
> -	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {
> -		wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> -
> -		ret = register_reboot_notifier(&wdd->reboot_nb);
> -		if (ret) {
> -			pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> -			       wdd->id, ret);
> -			watchdog_dev_unregister(wdd);
> -			ida_simple_remove(&watchdog_ida, id);
> -			return ret;
> -		}
> +	wdd->reboot_nb.notifier_call = watchdog_reboot_notifier;
> +	ret = register_reboot_notifier(&wdd->reboot_nb);
> +	if (ret) {
> +		pr_err("watchdog%d: Cannot register reboot notifier (%d)\n",
> +				wdd->id, ret);
> +		watchdog_dev_unregister(wdd);
> +		ida_simple_remove(&watchdog_ida, id);
> +		return ret;
>  	}
>  
>  	if (wdd->ops->restart) {
> @@ -321,9 +322,7 @@ static void __watchdog_unregister_device(struct watchdog_device *wdd)
>  	if (wdd->ops->restart)
>  		unregister_restart_handler(&wdd->restart_nb);
>  
> -	if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status))
> -		unregister_reboot_notifier(&wdd->reboot_nb);
> -
> +	unregister_reboot_notifier(&wdd->reboot_nb);
>  	watchdog_dev_unregister(wdd);
>  	ida_simple_remove(&watchdog_ida, wdd->id);
>  }
> -- 
> 2.25.0
> 

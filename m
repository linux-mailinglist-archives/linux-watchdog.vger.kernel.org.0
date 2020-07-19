Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA4E9225232
	for <lists+linux-watchdog@lfdr.de>; Sun, 19 Jul 2020 16:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgGSOZo (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 19 Jul 2020 10:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726038AbgGSOZn (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 19 Jul 2020 10:25:43 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7008AC0619D2
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Jul 2020 07:25:43 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id u185so7788585pfu.1
        for <linux-watchdog@vger.kernel.org>; Sun, 19 Jul 2020 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6mcWbHjFY3/Gvc/lmgo5JpfmiJVAARzIxccyNENiA+U=;
        b=jvqROPYlsFvBfTMHZYkikGtUJhnlX9eNkLXQukDF+RF+cwVlXvYJK5eI/MpX5eFqfH
         87jTtWgsBmoxZdPLKAg0Tt6xtKbtSQeTYEXNxVkvbNMandHtNo0aCud+VfYpuoquFME3
         humPuGJhwOUm6gHs2g6fo+AaG34vafSfXrI99Ds3dvnDYr2mpVbVot2kn5KT958t+Ucj
         d0bZYilVBXd9WEvHHyXixY6RdSthk9zLsuWycnRV9qMLd94XUnU7M0jiTIjkBTGNcrr2
         H15fzXG35DcaNe6VmFpHSMCCAg55s3KaCq5+7MncYvAEK1a9Ddr7fXsXSmFm+uMR+oTx
         QJDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=6mcWbHjFY3/Gvc/lmgo5JpfmiJVAARzIxccyNENiA+U=;
        b=Yy0vVoikJLfH6VPC5+gASfn9YRq5f/2tRNebYQSM+xTKw3+zJBV1GHqPdYIjnE3S57
         EtvdPm7Fb0x74sOTkQKaESNWlqNcskYk3X0i5xe1nKTKX/2NLotRZKIMjfhS3JnTVRDc
         mQQEiyM6sQouNVLGYmpbEhLgev91gZmMB92jVuzIvMh3j+7X1L1Qxrg5QSlg7dCZlQ3g
         TI3EdjvOpLJN5JNOtx6j6zHQDOFDSLen62dsKLQ2vfLsmEohJIVRPbfyqwD97e3dZvr1
         vVM/gm/pa+p+TuIpWkLVnbPR8gvlrdEjCy6PGyrQCoOdW61NVr39Lz5xv1mvzrTOZnqK
         8g0A==
X-Gm-Message-State: AOAM533wNRKwwhzG0NM3ZwZA8qTH53DLnY6yonf5H13QUZbcp8ormZyO
        n3KAPZRDpIvLoiWAQHO7Ifs=
X-Google-Smtp-Source: ABdhPJzDQGJuQEsUrP87F8y69YZLua5BL6eU57uG/fn6l9WYtrPiIdl3R1olrF8XXEI2vAYFFL/bfQ==
X-Received: by 2002:a63:cc18:: with SMTP id x24mr15032008pgf.86.1595168742801;
        Sun, 19 Jul 2020 07:25:42 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r204sm14041536pfc.134.2020.07.19.07.25.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Jul 2020 07:25:42 -0700 (PDT)
Date:   Sun, 19 Jul 2020 07:25:40 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     minyard@acm.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 08/10] watchdog: Add a way to extend the timeout on a
 reboot
Message-ID: <20200719142540.GA39395@roeck-us.net>
References: <20200620174907.20229-1-minyard@acm.org>
 <20200620174907.20229-9-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620174907.20229-9-minyard@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 20, 2020 at 12:49:05PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> If reboot_timeout is set in the watchdog device struct, set the timeout
> to that value on a reboot.  This way more time can be given for a reboot
> to complete.
> 
I think this should be aligned with watchdog_set_open_deadline(),
ie use a function to set the reboot timeout instead of adding it
to struct watchdog_device.

> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  drivers/watchdog/watchdog_core.c | 2 ++
>  include/linux/watchdog.h         | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
> index 03943a34e9fb..5792f9bca645 100644
> --- a/drivers/watchdog/watchdog_core.c
> +++ b/drivers/watchdog/watchdog_core.c
> @@ -165,6 +165,8 @@ static int watchdog_reboot_notifier(struct notifier_block *nb,
>  			if (ret)
>  				return NOTIFY_BAD;
>  		}
> +	} else if (wdd->reboot_timeout) {
> +		watchdog_set_timeout(wdd, wdd->reboot_timeout);

This has no practical impact; the code above checks for SYS_DOWN,
and for whatever reason SYS_DOWN has the same value as SYS_RESTART.
So the only value is for SYS_POWER_OFF, and that should arguably
be included in the first check (meaning we should probably remove
that check entirely, if anything).

Also, the reboot notifier is only called if WDOG_STOP_ON_REBOOT
is set, which contradicts the idea behind this change.

Guenter

>  	}
>  
>  	return NOTIFY_DONE;
> diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
> index 1eefae61215d..0fb57f29346c 100644
> --- a/include/linux/watchdog.h
> +++ b/include/linux/watchdog.h
> @@ -92,6 +92,9 @@ struct watchdog_ops {
>   * @status:	Field that contains the devices internal status bits.
>   * @deferred:	Entry in wtd_deferred_reg_list which is used to
>   *		register early initialized watchdogs.
> + * @reboot_timeout:
> + *		If non-zero, the timeout will be set to this value
> + *		on a reboot.  This lets a reboot be given more time.
>   *
>   * The watchdog_device structure contains all information about a
>   * watchdog timer device.
> @@ -125,6 +128,7 @@ struct watchdog_device {
>  #define WDOG_HW_RUNNING		3	/* True if HW watchdog running */
>  #define WDOG_STOP_ON_UNREGISTER	4	/* Should be stopped on unregister */
>  	struct list_head deferred;
> +	unsigned int reboot_timeout;
>  };
>  
>  #define WATCHDOG_NOWAYOUT		IS_BUILTIN(CONFIG_WATCHDOG_NOWAYOUT)

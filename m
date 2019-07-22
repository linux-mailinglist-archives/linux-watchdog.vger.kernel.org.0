Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CD4670590
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 18:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727731AbfGVQi6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 12:38:58 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43756 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbfGVQi6 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 12:38:58 -0400
Received: by mail-pf1-f194.google.com with SMTP id i189so17636533pfg.10;
        Mon, 22 Jul 2019 09:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=JzfzPeDph4qqgixAYVJT/cMLJgMdOxbPG42KknZGVMg=;
        b=E+ntaqVUo88r0En10R+B55/3qUi/7XGpeeEKVIpJLPKBwC5P2Q9rW5e1r1hzK7FaTN
         IjG1eQAtnTUl9CticKMQ9bk6Db1Dr2YvMsdxoLzZvq3EKVEsTQeg0hmiQuIdig4+TcHY
         XsRXx42A2LgKWYMI9KdXbMV+6x+83NjMgLGSsAcrPOPGHHO4vjDfbP6A6S9Zt9zG8vXi
         /SGz7xqsf8Gal8EliJ8Fw6/rAdSQqOx+1/bJvZpSX2POvLsnxIIyCyiAtH02OykJQ7SJ
         SPG01rRS6Kh5rc4tzIdkULOEOz5qA/bthyU7lo6/RSGX5dDht4kHrWqaEZNc5+fbqjoB
         dubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=JzfzPeDph4qqgixAYVJT/cMLJgMdOxbPG42KknZGVMg=;
        b=h69e0mAwqzC0Enyd4470JqoLA/p24nsaex1qPI/aWtjodqJBsoJnYCCrQHJ5z5Z4T2
         wySW72YThzA5vO5M+tdq3e+f00BLOw9U6Sv4ksQWt4uLeHzrAAqadGWuMRg+p/SKztOg
         2OmXCzmO5l50/zB42Mcyo+m7gZHPQRpfaw7annPOI8t6Xl7XOL+SNex8jdWUDqWuX7tV
         4D1LuGwcYd49LVAQmjwKUthCmzNBdpUOGtR5o5XjTZ/VMOYmS/+ErU4ryUATYaTt8oll
         Q34B8RQPySDEL/dKpMX7Y8GBvDiVyT3Dza2fwzwJPt5P7fvKhw7E6iHywnkbwTRktGZy
         xOTQ==
X-Gm-Message-State: APjAAAWC8nhf1eDHvXyJGgmKdbg4VN+Bj5BdX87KAZgRasg2x4h7c/ed
        GnBakMGjxPAV+7P6RG62aSM=
X-Google-Smtp-Source: APXvYqwBB4mlhHnWcI1tkh0GMA3Xsk8ITL+dNsm5ua9sG36kgrNFQzjiS/5veUUgCxv0j+BiY5UDoQ==
X-Received: by 2002:aa7:843c:: with SMTP id q28mr1152268pfn.152.1563813537369;
        Mon, 22 Jul 2019 09:38:57 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w16sm48106866pfj.85.2019.07.22.09.38.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 09:38:56 -0700 (PDT)
Date:   Mon, 22 Jul 2019 09:38:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     Pavel Andrianov <andrianov@ispras.ru>, wim@linux-watchdog.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog:alim1535_wdt: Fix data race in ali_settimer()
 concerning ali_timeout_bits variable.
Message-ID: <20190722163855.GC8122@roeck-us.net>
References: <CACV1r+a4bz+5L_AkYJ0NXkhwarx30=W3MQ20ur1A4Z-zEOE=FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACV1r+a4bz+5L_AkYJ0NXkhwarx30=W3MQ20ur1A4Z-zEOE=FA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 07:35:03AM -0700, Mark Balantzyan wrote:
> Hello all,
> 
> I had previously submitted 2 patches attempting to fix the data race
> condition in alim1535_wdt.c as part of my work with individuals on the
> Linux Driver Verification project. I am including the original patch
> description I provided, below, along with revised patch. Thank you.
> 
> (PATCH DESCRIPTION AND PATCH BELOW)
> 
This is not how the description is supposed to look like; the above would
end up in the commit log. Please check the kernel documentation on how
to write subject lines and patch descriptions.

> In drivers/watchdog/ailm1535_wdt.c, there is the potential for a data race
> due to parallel call stacks as follows: Thread 1 calls a file operation
> callback, denoted *ali_fops* in the .c file, which in turn results in calls
> to ali_write() followed by ali_start(), which has the line
> 
> val |= (1 << 25) | ali_timeout_bits;
> 
> surrounded by a spin_lock and spin_unlock. This is crucial because Thread 2

The "surrounded by spinlock" does not refer to the line above, but to
pci_read_config_dword() followed by pci_write_config_dword(), which
needs to be protected. The described race condition around ali_timeout_bits
[ali_start() vs. ali_settimer()] does not exist.

The only race condition in the driver is 'ali_timeout_bits' vs. 'timeout'.
It is theoretically possible that those two get out of sync, ie that
ali_timeout_bits does not reflect the value of timeout. This can happen
if one of the threads is interrupted after setting 'ali_timeout_bits' but
before updating 'timeout'.

> can access "ali_timeout_bits" then when it calls ali_ioctl(), which calls
> ali_settimer() having the lines (else if (t < 60) ali_timeout_bits = t|(1
>  << 6);, lines 112-113, etc.)
> 
There is no need to be that detailed. It is sufficient to explain that
there is a race condition when updating 'ali_timeout_bits' and 'timeout'
(or maybe use my explanation above).

> (Revised) patch adds spinlocking around "ali_timeout_bits" in
> ali_settimer() should "ali_ioctl()" be called in a concurrent thread (at
> any time).
> ---
>  drivers/watchdog/alim1535_wdt.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/alim1535_wdt.c
> b/drivers/watchdog/alim1535_wdt.c
> index 60f0c2e..1260e9e 100644
> --- a/drivers/watchdog/alim1535_wdt.c
> +++ b/drivers/watchdog/alim1535_wdt.c
> @@ -106,19 +106,23 @@ static void ali_keepalive(void)
>   */
> 
>  static int ali_settimer(int t)
> -{
> - if (t < 0)
> +{ spin_lock(&ali_lock);
> + if (t < 0) {
> + spin_unlock(&ali_unlock);
>   return -EINVAL;
> + }
>   else if (t < 60)
>   ali_timeout_bits = t|(1 << 6);
>   else if (t < 3600)
>   ali_timeout_bits = (t / 60)|(1 << 7);
>   else if (t < 18000)
>   ali_timeout_bits = (t / 300)|(1 << 6)|(1 << 7);
> - else
> + else {
> + spin_unlock(&ali_lock);
>   return -EINVAL;

Please use goto for error exits, as suggested in the coding style document.

> -
> + }
>   timeout = t;
> + spin_unlock(&ali_lock);
>   return 0;
>  }

Formatting is completely messed up.

> 
> -- 
> 2.15.1
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>

Wrong location for Signed-off-by:.

Guenter

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E889210235
	for <lists+linux-watchdog@lfdr.de>; Wed,  1 Jul 2020 04:49:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726430AbgGACtp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 22:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgGACtp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 22:49:45 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B948C061755
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jun 2020 19:49:45 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u5so10328290pfn.7
        for <linux-watchdog@vger.kernel.org>; Tue, 30 Jun 2020 19:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YovxSutyVC3vPfc30qLKb6C4cR4BTtXDoCbOH8uIRNw=;
        b=DwawwzSNZXUs/ul8j3UxdEhWDK6LG6Yq49fb3zaJboYENd/zzF9tlrelO4cFOdjPHZ
         EskL/hJuWRcBYReu+b2rtQa7621SBGyBshfCyPT15pEWZ/gy+8TBC8mGEVjmqlrKFoHt
         PEIJrRGK8rrl1ItpNJJmyTvQ4OxV4xc9Cc/36M2Lv2cvT0hs1HriGzfxsS069MwRoteM
         cj44A5sN377kcZI5o6awi4nwWKfhtoy3feZcQP/rIgKBHoHDP8wUd5ZZomHEwpbQQf4Y
         2QL/rFbxwUjIWaO2QNl1NJ6/c9QDWS7tFAp12n3mljo8M5zoA5a42MYEO86n09HA0mfb
         3XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YovxSutyVC3vPfc30qLKb6C4cR4BTtXDoCbOH8uIRNw=;
        b=QCwkVPnKJOC1qHuTYiMUIQTXdjcsB0X9JhcnrtlaZsS+oaRxbY8SGa7s4QGz5MoLpX
         Ag0OwC26UmoqA+TtYoe2EYdu1FhMeJeF9GE07qepSysPIEHZzjK2YGrapp3OSXCChTNV
         DM80kX9q9iKiwqLWmPLvXzYydeh23JN/HecN57xpognZMj34hDTlKYb9Kro1wKEvruSu
         TgFgBF2ct3/B2MgBBXsBjp7mBbeMThIwHEcVrrAl3fJtyTq/2QQfr1LtjItlNN1awa4k
         Wra2Hc49AGsDeNqb/tmgckXnF7FNZtmKs5M2s8s4Q86U0TFgXhCtVDqR5JG+7przrs/1
         GqVQ==
X-Gm-Message-State: AOAM530m9m9Q3K7ROS5UiIEJtGmeEG0ZCEWHdWSqleXFOd/R94BYxXE0
        PLKiTOLgjYGOAFqKUZlH2Js=
X-Google-Smtp-Source: ABdhPJz/9gfFC0rESSGA+bceqb6orLMDOUrxt6uGXsbWN9aLp2JU1s0ppHhSUvHUAVBMqgblW0CfWg==
X-Received: by 2002:a63:e214:: with SMTP id q20mr10616640pgh.402.1593571784913;
        Tue, 30 Jun 2020 19:49:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m7sm3973871pgg.69.2020.06.30.19.49.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 19:49:44 -0700 (PDT)
Date:   Tue, 30 Jun 2020 19:49:43 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     minyard@acm.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: Re: [PATCH 03/10] watchdog: Add documentation for read capability
Message-ID: <20200701024943.GC84420@roeck-us.net>
References: <20200620174907.20229-1-minyard@acm.org>
 <20200620174907.20229-4-minyard@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200620174907.20229-4-minyard@acm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sat, Jun 20, 2020 at 12:49:00PM -0500, minyard@acm.org wrote:
> From: Corey Minyard <cminyard@mvista.com>
> 
> Document the read, poll, and async operations.
> 
> Signed-off-by: Corey Minyard <cminyard@mvista.com>
> ---
>  Documentation/watchdog/watchdog-kernel-api.rst | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/watchdog/watchdog-kernel-api.rst b/Documentation/watchdog/watchdog-kernel-api.rst
> index 068a55ee0d4a..aa15a2d35397 100644
> --- a/Documentation/watchdog/watchdog-kernel-api.rst
> +++ b/Documentation/watchdog/watchdog-kernel-api.rst
> @@ -132,6 +132,10 @@ The list of watchdog operations is defined as::
>  	unsigned int (*get_timeleft)(struct watchdog_device *);
>  	int (*restart)(struct watchdog_device *);
>  	long (*ioctl)(struct watchdog_device *, unsigned int, unsigned long);
> +	ssize_t (*read)(struct watchdog_device *, struct file *, char __user *,
> +			size_t, loff_t *);
> +	__poll_t (*poll)(struct watchdog_device *, struct file *, poll_table *);
> +	int (*fasync)(struct watchdog_device *, int, struct file *, int);
>    };
>  
>  It is important that you first define the module owner of the watchdog timer
> @@ -235,6 +239,14 @@ they are supported. These optional routines/operations are:
>    our own internal ioctl call handling. This routine should return -ENOIOCTLCMD
>    if a command is not supported. The parameters that are passed to the ioctl
>    call are: watchdog_device, cmd and arg.
> +* read: If a read call comes in on the watchdog device, call this function.
> +  This allows a watchdog to provide data to the user.

I don't think this makes any sense. To be accepted, this would need to be
standardized. We can't have userspace read from a watchdog device without
knowing what is going to be returned.

Guenter

> +* poll: If a poll call comes in on the watchdog device, call this.  This
> +  allows the user to do select/poll waiting on the device to have read data
> +  ready.
> +* fasync: If a fasync call comes in on the watchdog, call this.  This
> +  allows the user to do async operations waiting for read data from
> +  the device.
>  
>  The status bits should (preferably) be set with the set_bit and clear_bit alike
>  bit-operations. The status bits that are defined are:
> -- 
> 2.17.1
> 

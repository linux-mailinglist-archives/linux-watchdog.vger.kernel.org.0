Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6174F173E14
	for <lists+linux-watchdog@lfdr.de>; Fri, 28 Feb 2020 18:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbgB1RNR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 28 Feb 2020 12:13:17 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38715 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgB1RNQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 28 Feb 2020 12:13:16 -0500
Received: by mail-pg1-f196.google.com with SMTP id d6so1833976pgn.5;
        Fri, 28 Feb 2020 09:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xJi6vZcYcttW+MZfr9/rRJo0DF++IJ1/RUDtbKhU1AY=;
        b=uEOAohEGBRoCSThVEmWLtAKPOqOCFMCaUcBA+F58HYQJ4WlwP99B0kkn5pagoVx9ia
         ciyWMsE+sn335hZ75HM6QJ1hCDukb9Suie1cGGMW2CGkSeudg/JIePTCYGESVNsyzVvx
         2yCpjoSiVB7B58PbXo5dzIdwKsB7nXSsB4qu/5qixVM9wJDBDP8LorAMIphl8QEyUu4w
         tx7Ljaicm2ngq5StYDxBLLfcaHDE9bo08CT29iQoLWRs9BnkembEXNKAuMFTbN1kZnc+
         rMUXNfZRE9iQg6Pvk4U20jO1SK28BuxQMZVUdpXosWbGA1asQrgJqXSeTclTNd72OGDS
         4akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xJi6vZcYcttW+MZfr9/rRJo0DF++IJ1/RUDtbKhU1AY=;
        b=hoH0F2fupTBp2Ul+dYtwWyTm5hqo9KQbuVYZAv3ddJZAE35xFfW1p9j50Zls5QYlZ1
         QgEdblzqPojmIfeC/qXsoQiZ3IXoTMBzP1b9GioVUbyNXk4X5zo1sQUa8iQqzreW9stL
         wp0YS4Hrfy0J1jnGABhyDJpg224asygP0KmeJ4xOQnndzzGPtNyWqGPvfaIct2o1CUjL
         xHzMKWlU/OxlocEijIO5uzcJh0sYNwo5Q6SKdBNTa3cMNy+O3HC/rnS5bFesYPMzkThZ
         GZ+fuFphse9REpHumog9VTMOfQhQz/RtwKtNS1LfZJvCG7eicGbJcb9nq8exCar6xRK5
         FKxQ==
X-Gm-Message-State: APjAAAUSe5bLd6ffKCGMhpn/5Lb5YEimgMgKPoD2SqRwAjLhM7nzQ1ms
        XXSgqXE+AE91qP7hkwKNE3M=
X-Google-Smtp-Source: APXvYqwRnGkDeSmzVIq5t1dNZsR0afEyiIO9TeGMrlGYsOPCoVbGkguOPHdpxhLdA+JLiDLGB3FEAw==
X-Received: by 2002:a63:1d22:: with SMTP id d34mr5495224pgd.21.1582909995462;
        Fri, 28 Feb 2020 09:13:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q13sm11203198pgh.30.2020.02.28.09.13.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 09:13:14 -0800 (PST)
Date:   Fri, 28 Feb 2020 09:13:14 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] watchdog: add support for resetting keepalive timers
 at start
Message-ID: <20200228171314.GA14594@roeck-us.net>
References: <20200228142331.13716-1-t-kristo@ti.com>
 <20200228142331.13716-3-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200228142331.13716-3-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 28, 2020 at 04:23:29PM +0200, Tero Kristo wrote:
> Current watchdog core pets the timer always after the initial keepalive
> time has expired from boot-up. This is incorrect for certain timers that
> don't like to be petted immediately when they are started, if they have
> not been running over the boot.
> 
> To allow drivers to reset their keepalive timers during startup, add
> a new watchdog flag to the api, WDOG_RESET_KEEPALIVE.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  drivers/watchdog/watchdog_dev.c | 2 ++
>  include/linux/watchdog.h        | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 8b5c742f24e8..131e40c21703 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -283,6 +283,8 @@ static int watchdog_start(struct watchdog_device *wdd)
>  		set_bit(WDOG_ACTIVE, &wdd->status);
>  		wd_data->last_keepalive = started_at;
>  		watchdog_update_worker(wdd);
> +		if (test_bit(WDOG_RESET_KEEPALIVE, &wdd->status))
> +			wd_data->last_hw_keepalive = started_at;

I don't think the additional flag is needed. The code should just set
last_hw_keepalive. After all, it already sets last_keepalive, which
determines when the next internal keepalive will be sent. It makes sense
to also set last_hw_keepalive to prevent the next keepalive from being
sent too early.

Guenter

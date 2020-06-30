Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD06220FDBF
	for <lists+linux-watchdog@lfdr.de>; Tue, 30 Jun 2020 22:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbgF3Ugi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 30 Jun 2020 16:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgF3Ugi (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 30 Jun 2020 16:36:38 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F56C061755;
        Tue, 30 Jun 2020 13:36:37 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id s14so8945849plq.6;
        Tue, 30 Jun 2020 13:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1JdJb/nPVAT5gkfGcCX+Fs5CyEjoe06QaSekf6Stnh8=;
        b=d7ZZOgU2yNglOX/gwwDdMEMpRKngen5f3Xht5ti/J2AnhUkz2mZFmxUJf9mPqaUfhg
         NTEu3vL5APw55cgTD82Z+6eX4EloHuqjnTO4UxuBLkxdL4eFu++4DDtwo6wYCZ6ktJpU
         LabSdjrB6EyX9qB/wxFhqht9ZHj0jEDOG/5rf+ntwJDr8rRDqL3kjhTqgoCw6l7cG0+H
         xG0inm/xX6f0d/4+aopYs8A4ubnKiZBzMAfwdmB2xH7m/oI03/Pyn8XeeVvJuiZJAEFl
         i96jsx5trjNl5PH5GEgfZB9K3xVXQZUNJ73RedaEKE7wcgWTxzRcmiUjzmN1cuha4TYw
         bL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=1JdJb/nPVAT5gkfGcCX+Fs5CyEjoe06QaSekf6Stnh8=;
        b=NFKeOrYwMwndevnL2Ea7rx+tQDWhFpOcsarERQZNiGAtgxA+MIuJG4Cnrb9qWLZvS7
         DUNco94E2AIM/y2OyK1CeSeKPQ1fZnPcHonWHRAbByVq9IeeP01cy4nYB9e0GRq+ZumQ
         nkYLJiMyQhllYV2fx97KiQ8frp2uKaLuI/7PrQnygx7RyUSwFLHbcdEPdoESy5q0l254
         TLzHt+1j/zRISHsHJkJFMaNNoCJd3LfrulolBxiTG5Dusliot9M0s8NEcuCgVOsPvYV9
         ZAwFYOWJA0ZyC8IS4SoU8lUv6u5k7aBgM6MmF++wAvAFDBz3Snh5JZgJvzzs1ipJwgnK
         oK8g==
X-Gm-Message-State: AOAM5324Mwz/rP2UUJreIM4yz+9SBIEiasAy2lOaC9hOCzm5QHZtRDu8
        P4rr4Jv1R3Mk4emx0LWneOk=
X-Google-Smtp-Source: ABdhPJymtH7xcMvVH/kgjgDOiZvw/Qgu0o7ylLg9VDhbkJIM4SHD/nGfLFAeDemh4omr59n3AiuKAA==
X-Received: by 2002:a17:90a:67c7:: with SMTP id g7mr22748358pjm.165.1593549397427;
        Tue, 30 Jun 2020 13:36:37 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m4sm3012520pjs.29.2020.06.30.13.36.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 13:36:36 -0700 (PDT)
Date:   Tue, 30 Jun 2020 13:36:36 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, jan.kiszka@siemens.com
Subject: Re: [PATCH 1/2] watchdog: use __watchdog_ping in startup
Message-ID: <20200630203636.GA20146@roeck-us.net>
References: <20200624114534.1362-1-t-kristo@ti.com>
 <20200624114534.1362-2-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624114534.1362-2-t-kristo@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jun 24, 2020 at 02:45:33PM +0300, Tero Kristo wrote:
> Current watchdog startup functionality does not respect the minimum hw
> heartbeat setup and the last watchdog ping timeframe when watchdog is
> already running and userspace process attaches to it. Fix this by using
> the __watchdog_ping from the startup also. For this code path, we can
> also let the __watchdog_ping handle the bookkeeping for the worker and
> last keepalive times.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/watchdog_dev.c | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_dev.c
> index 7e4cd34a8c20..bc1cfa288553 100644
> --- a/drivers/watchdog/watchdog_dev.c
> +++ b/drivers/watchdog/watchdog_dev.c
> @@ -275,15 +275,18 @@ static int watchdog_start(struct watchdog_device *wdd)
>  	set_bit(_WDOG_KEEPALIVE, &wd_data->status);
>  
>  	started_at = ktime_get();
> -	if (watchdog_hw_running(wdd) && wdd->ops->ping)
> -		err = wdd->ops->ping(wdd);
> -	else
> +	if (watchdog_hw_running(wdd) && wdd->ops->ping) {
> +		err = __watchdog_ping(wdd);
> +		if (err == 0)
> +			set_bit(WDOG_ACTIVE, &wdd->status);
> +	} else {
>  		err = wdd->ops->start(wdd);
> -	if (err == 0) {
> -		set_bit(WDOG_ACTIVE, &wdd->status);
> -		wd_data->last_keepalive = started_at;
> -		wd_data->last_hw_keepalive = started_at;
> -		watchdog_update_worker(wdd);
> +		if (err == 0) {
> +			set_bit(WDOG_ACTIVE, &wdd->status);
> +			wd_data->last_keepalive = started_at;
> +			wd_data->last_hw_keepalive = started_at;
> +			watchdog_update_worker(wdd);
> +		}
>  	}
>  
>  	return err;

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEC552FF87F
	for <lists+linux-watchdog@lfdr.de>; Fri, 22 Jan 2021 00:14:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbhAUXMT (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 21 Jan 2021 18:12:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbhAUXIo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 21 Jan 2021 18:08:44 -0500
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A38F7C06174A;
        Thu, 21 Jan 2021 15:08:03 -0800 (PST)
Received: by mail-oo1-xc30.google.com with SMTP id y72so452461ooa.5;
        Thu, 21 Jan 2021 15:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=LWjZgdo97IW93hy4Usf24J0zQ4uGQOVb4b9yo0/e594=;
        b=eIRT85xpOmLi71n2IImPgBt7CKzRdgj5W+h00sZGlqcxCuw2ozByIKjCc9Ob6YSo5A
         21DyFtFFE1wXXBvdbKLFywvdI0Zujk6MQxSyimxvX+K7hge/Ujv5yxBMt3TqKqY2RDOi
         DTrqrCKvES/SNn5/yzMjKbbBnwIAY94iPwVwb/kinrA2F7GisdPrO5fmxllAwcAxZ38Z
         GpAPJBetlGeWtVQUw/gQhHSCmU9C36phcIQ7qd2db4YLFlu2ejucvbaxyg8DWafPcDt+
         +L0rG0VQeOuDx5Dz4jXXymVBwUo5wARu+HTHAaJAX88XXT5wGULTmuYRx0pm5OyrRpKs
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=LWjZgdo97IW93hy4Usf24J0zQ4uGQOVb4b9yo0/e594=;
        b=e9iqECGPxZxlxJ1sWSXBYEik2dzjSYKHkBjzECj8KraXgm/rlGwj6ypPPrNtDPWlLx
         hTaJDN9j0MXus7SFyiF0t0E50CZ5KPDdpdnpr6X/6bKokGpL4eHDdLFr3Leo9Wl+7+GP
         wC2laBuSYq20p+YCZWKIJ7i1z6ZsNF7aAq22JWCQdzNfEE6i/212uxGgG6WnZJkhm4Mj
         ANDqINZIK79SXMTlP05ezHQESXhmLSn+uu3uVKmz17NoCz/yO9S5uTGB2o8vYgWWx+Uu
         My1PPm4pmPNkMKc9OkGD4/t5/LeT9ti/mVD2fb1oSSu9K3ACNOGVtzpN5GTxXCBADc+e
         hdsA==
X-Gm-Message-State: AOAM532+5VoHaPZL9Qz7bJS3uZi3rUVTiZ3i4shTqEx6CKD6Vj2YOtns
        dnBS0BZx71DfmOQRfM9Mt0gCYXArlBY=
X-Google-Smtp-Source: ABdhPJy8TqARNlQR+IXrZabLeg7vmPZahAddmHTJQjLh7retVvWvngf8Mt5GbP7QGzuj8BGD0gfZJw==
X-Received: by 2002:a4a:e1b5:: with SMTP id 21mr1651726ooy.64.1611270483115;
        Thu, 21 Jan 2021 15:08:03 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r14sm1352138ote.28.2021.01.21.15.08.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Jan 2021 15:08:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Thu, 21 Jan 2021 15:08:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] watchdog: pcwd: drop always-false if from remove
 callback
Message-ID: <20210121230800.GA37574@roeck-us.net>
References: <20210121204812.402589-1-uwe@kleine-koenig.org>
 <20210121204812.402589-2-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210121204812.402589-2-uwe@kleine-koenig.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Jan 21, 2021 at 09:48:11PM +0100, Uwe Kleine-König wrote:
> If pcwd_isa_probe() succeeded pcwd_private.io_addr cannot be NULL. (And
> if pcwd_isa_probe() failed, pcwd_isa_remove() isn't called.)
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/pcwd.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
> index e86fa7f8351d..b95cd38f3ceb 100644
> --- a/drivers/watchdog/pcwd.c
> +++ b/drivers/watchdog/pcwd.c
> @@ -956,9 +956,6 @@ static int pcwd_isa_remove(struct device *dev, unsigned int id)
>  	if (debug >= DEBUG)
>  		pr_debug("pcwd_isa_remove id=%d\n", id);
>  
> -	if (!pcwd_private.io_addr)
> -		return 1;
> -
>  	/*  Disable the board  */
>  	if (!nowayout)
>  		pcwd_stop();
> -- 
> 2.29.2
> 

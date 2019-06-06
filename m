Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37C337F61
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 23:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbfFFVR7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 Jun 2019 17:17:59 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33731 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727187AbfFFVR7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 Jun 2019 17:17:59 -0400
Received: by mail-pl1-f193.google.com with SMTP id g21so1425152plq.0;
        Thu, 06 Jun 2019 14:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mP7r3Ph0TJUeY2QgBywLa5kKt0/iqIMTXJw+IqZdG5c=;
        b=QQAZ7N8H8c+5Ltu+ZGIdxyDkMMoKCiVPm/qiYn/zzSn25b2uU7hCOD6mZNfokt2ms8
         YPclSKzjHC4oTggIKEBy7liIzJ04zM7X6ylCESyJWmj6kvjTetXr0izfzYGs9T3OdGuG
         5/r0CZuH/W6Na2nPhB0DgbFu3RKGQYdtrzrevm6dBW2/B9RDKldxsPDT4+/uNnWQM5c9
         T/hYcfAxmIGyGWtoGYpE+gzQyQmZ11Bxzpe6wKvXrby9WYbLcRM52p0fbB29e42EC2jO
         2fc/xkACsf/zHoKWsbrpkH7JL5oQgyvTDJoZYUx+gZaHfljmNquU5eIBL5+FSjfx2pca
         hGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=mP7r3Ph0TJUeY2QgBywLa5kKt0/iqIMTXJw+IqZdG5c=;
        b=cWZDXvfEyiNXr4BcSkb40Buh0QFCnzhuuSvishqJC3H5yeMHUN9LWlOK8GxMjtaa+w
         +JOyN4R2vO1AkdIu4gP7u9FPe4K8N9/qxvauruIifsoFvfZ6ynkhfNsYBRIODxlljGco
         eoGMo+48A9zSqPbp3jsPcuE2fEf1J6z17gjheDMslnwVlo2r4IjeRWgmexSJUPmh2c2e
         k2iTjCr2C3+hfGPAoa4Bw7ZSJex5+7pW0ToR234awn10RT5CiIIsxspsAx1B/U3w7uqS
         ld5WKmM2PjKc7iuoneRqGYcwaOEBbpmyFgfJZ7sWro3/WZPPSgnEwScuLaNufmp57nb9
         IJbA==
X-Gm-Message-State: APjAAAXlKRG7JIFggIspXexge8i7u186yRmQGTCsjlp5U0OBmHI2x/Pk
        k3DHp6T0EwR+GSWAHzkfqTKZQmxw
X-Google-Smtp-Source: APXvYqwlJWejDjPLp4Du0ku4Rl3EB2/0dNED2aE2CibduvXmMGSH6zDuhXMYSg0oMeJbJgkKe1ZfCg==
X-Received: by 2002:a17:902:b18f:: with SMTP id s15mr53750306plr.44.1559855878548;
        Thu, 06 Jun 2019 14:17:58 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id v23sm61897pff.185.2019.06.06.14.17.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 14:17:58 -0700 (PDT)
Date:   Thu, 6 Jun 2019 14:17:57 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk
Subject: Re: [PATCH 2/6] watchdog/hpwdt: Advertize max_hw_heartbeat_ms
Message-ID: <20190606211757.GA1299@roeck-us.net>
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
 <1558126783-4877-3-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558126783-4877-3-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 17, 2019 at 02:59:39PM -0600, Jerry Hoemann wrote:
> Set max_hw_heartbeat_ms instead of max_timeout so that user client can
> set timeout range in excess of what the underlying hardware supports.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index 8c49f13..9f7a370 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -62,9 +62,9 @@
>  static int hpwdt_start(struct watchdog_device *wdd)
>  {
>  	int control = 0x81 | (pretimeout ? 0x4 : 0);
> -	int reload = SECS_TO_TICKS(wdd->timeout);
> +	int reload = SECS_TO_TICKS(min(wdd->timeout, wdd->max_hw_heartbeat_ms/1000));
>  
> -	dev_dbg(wdd->parent, "start watchdog 0x%08x:0x%02x\n", reload, control);
> +	dev_dbg(wdd->parent, "start watchdog 0x%08x:0x%08x:0x%02x\n", wdd->timeout, reload, control);
>  	iowrite16(reload, hpwdt_timer_reg);
>  	iowrite8(control, hpwdt_timer_con);
>  
> @@ -91,9 +91,9 @@ static int hpwdt_stop_core(struct watchdog_device *wdd)
>  
>  static int hpwdt_ping(struct watchdog_device *wdd)
>  {
> -	int reload = SECS_TO_TICKS(wdd->timeout);
> +	int reload = SECS_TO_TICKS(min(wdd->timeout, wdd->max_hw_heartbeat_ms/1000));
>  
> -	dev_dbg(wdd->parent, "ping  watchdog 0x%08x\n", reload);
> +	dev_dbg(wdd->parent, "ping  watchdog 0x%08x:0x%08x\n", wdd->timeout, reload);
>  	iowrite16(reload, hpwdt_timer_reg);
>  
>  	return 0;
> @@ -208,9 +208,9 @@ static int hpwdt_pretimeout(unsigned int ulReason, struct pt_regs *regs)
>  	.info		= &ident,
>  	.ops		= &hpwdt_ops,
>  	.min_timeout	= 1,
> -	.max_timeout	= HPWDT_MAX_TIMER,
>  	.timeout	= DEFAULT_MARGIN,
>  	.pretimeout	= PRETIMEOUT_SEC,
> +	.max_hw_heartbeat_ms	= HPWDT_MAX_TIMER * 1000,
>  };
>  
>  

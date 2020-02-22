Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5E4169017
	for <lists+linux-watchdog@lfdr.de>; Sat, 22 Feb 2020 16:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727681AbgBVP7P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 22 Feb 2020 10:59:15 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46705 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbgBVP7P (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 22 Feb 2020 10:59:15 -0500
Received: by mail-pf1-f193.google.com with SMTP id k29so2913682pfp.13;
        Sat, 22 Feb 2020 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=MzYWJC/9BXD1WcJiZNbRJwvggXBjntBidP31oxmGeNg=;
        b=PaHUwJq4K+HFLDXfO1Z5bZEh6kWOpxogv6v8ULD2S1gYcatBK4xjBjfhgxRW+lWmqM
         xIu9zYryFs3MJn1ZLGXsL4yEp+Dkc/FrgW7rNHm7w4OodydaijO7nCbiFVMk3ZpXUesK
         65xbP2OsaiKj0EwwAVahvaiAEodZWw/a3bufhxv8AUko8rozxIMvUfPDQd1FoR/X7o59
         q/teE6He2C8m10p1jizA87XD2wL2OTiSH6eYCDpGJTSsBroq6tK/H7wCgmLpC837TwM1
         4PDFzjjBbbANNlg+8aixTwKVp/CnvDsehTmfQpQMeC8Ro6FNAaXdX+bMuUDQye0phbfw
         0qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=MzYWJC/9BXD1WcJiZNbRJwvggXBjntBidP31oxmGeNg=;
        b=nvfwiu4wGP0fJIZqQAL1gi8W5Yn7nRiv5L/QU2LjoGaCrptngq+oHIHluP8ZcB0uu0
         uXxeJOEgi2A2clU/Fx89onUYE/cUGRpwfrNcsWrisBgt3VbphPJvebO2EhxtgFyf6fPr
         OZvV7k0Xcd5D6O2EEsSgT1tBJcmLauLeYbzO1XHtUfvhywJNTwgKGXfDb5UEYz1JDur3
         kuWawQRv4GPirdawL3YwNZh2jCp8BbITu4yUO5EAxC8ONAFngBrXtia8CYIb/ASyLJHg
         9TfTqRFhBVW3Z47A4xSDB4Fv4tl9dcBDj4wN0ZEW1zIP8AVAuw+3MO3lp3jb+5P3IMGd
         Xhdg==
X-Gm-Message-State: APjAAAV7KVDNy9jjoRZeTioChHxoivGOUmJhmO5nN/S5poy+x5PLRCEZ
        S5mO3Om4o475fszkCGuPaaM=
X-Google-Smtp-Source: APXvYqyEz+GN8PLo+6IySOzOQPgQjSYLrs/jV2UQ9LMFOVV5+CRwabU8szMuA3LDBxz7UTR79PczgQ==
X-Received: by 2002:aa7:979a:: with SMTP id o26mr43663603pfp.257.1582387155023;
        Sat, 22 Feb 2020 07:59:15 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z16sm6747504pff.125.2020.02.22.07.59.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 Feb 2020 07:59:14 -0800 (PST)
Date:   Sat, 22 Feb 2020 07:59:13 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH 2/3] watchdog: imx7ulp: Remove unused include of init.h
Message-ID: <20200222155913.GA12613@roeck-us.net>
References: <1582250430-8872-1-git-send-email-Anson.Huang@nxp.com>
 <1582250430-8872-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582250430-8872-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Feb 21, 2020 at 10:00:29AM +0800, Anson Huang wrote:
> There is nothing in use from init.h, remove it.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/imx7ulp_wdt.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index 11b9e7c..7993c8c 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -4,7 +4,6 @@
>   */
>  
>  #include <linux/clk.h>
> -#include <linux/init.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>

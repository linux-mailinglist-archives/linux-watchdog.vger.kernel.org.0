Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6999244BA7
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Aug 2020 17:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgHNPJz (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 14 Aug 2020 11:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726662AbgHNPJy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 14 Aug 2020 11:09:54 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90452C061384;
        Fri, 14 Aug 2020 08:09:54 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j21so4665224pgi.9;
        Fri, 14 Aug 2020 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Uhn8rDolUXc/b+P4jvyzxSJHahMbxzWeLBKizRiNrH8=;
        b=XjzSVCnn2S5kLbHmrJ5bmCSb2RfMpJHeHRs0KWLQOHbAIC9EbMLpKGgToydVMkGtcj
         0vMadhhCvMLdSBZXzCvjtB91kUclTeeLRprqcobkvyiClellHa7n+TCFqwy8X2nq7faV
         ciS0H3UMX3GWavp+e5ntZ/8cWH2r1qMgne7WkQ5JhKKHVAVx5wLObBdL3Z7WfcpZHQ+J
         TqkRcUZBO6dmSYsEYEQe5C+FkYmVuNd0SN43JSBDzutBgOiaBER7BS2K4tKQlN+r4/WB
         1jrbvIPiBi2wgOuJRnaOFSJTuynB99H+hxGxu46BbHdRg7Q9XqSaMgK5XEkURKeXfXZi
         8ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Uhn8rDolUXc/b+P4jvyzxSJHahMbxzWeLBKizRiNrH8=;
        b=cnO/QgNZlBTc8psMJ8jUtsK2+Ttx0zWyw8rWJbQmR1hWBTzaDQZhSNiOqB8zJlX4GQ
         7G9XQnZamRHRHKiJSGGx95feBpqEgfxqfoaPIRIF0toaEsG/lPFI8knTa5N5UEjJEaYa
         wsbUjIwG7WqZcq1anr678B3nD9SsZ0iixNsiSDat3QuOiHLgIrbtg1dP1LaKCx8kM0qM
         FKoaypH6/SCxDqCf2qK1SwU8PPxTGa013SHFKOpecyWKcq5J1Rnw0MF1diU578iAnnDK
         cfVRvuiCoKBPdEPqjnZbEOeul4X9OiHU5lHdNbHn5LmweROA5LGqj6UiVnRF8Fd4S0P1
         nPUg==
X-Gm-Message-State: AOAM533Bo5ESpV/ohDSAE0XrjGpSctnHDt1qiTMQnL+xAAjOL5CO9Gc6
        GNdanc3qMRBIv8hoWET4rU0=
X-Google-Smtp-Source: ABdhPJxBvvVtWu6GU74rLpebcSYHakcr7CFIAn0TfFVv1WtXbgr9IHMR4EbZrYmPjpEFEjs889Pdqg==
X-Received: by 2002:a62:8105:: with SMTP id t5mr2222840pfd.94.1597417794175;
        Fri, 14 Aug 2020 08:09:54 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e22sm8206451pgi.62.2020.08.14.08.09.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Aug 2020 08:09:53 -0700 (PDT)
Date:   Fri, 14 Aug 2020 08:09:52 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH V4 2/2] watchdog: imx7ulp: Watchdog should continue
 running for wait/stop mode
Message-ID: <20200814150952.GA255906@roeck-us.net>
References: <1596150213-31638-1-git-send-email-Anson.Huang@nxp.com>
 <1596150213-31638-2-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596150213-31638-2-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jul 31, 2020 at 07:03:33AM +0800, Anson Huang wrote:
> When kernel idle, system will enter wait/stop mode, wdog should continue
> running in this scenario, and the refresh thread can wake up system from
> wait/stop mode.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> no change.
> ---
>  drivers/watchdog/imx7ulp_wdt.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
> index badfc0b..922b603 100644
> --- a/drivers/watchdog/imx7ulp_wdt.c
> +++ b/drivers/watchdog/imx7ulp_wdt.c
> @@ -22,6 +22,8 @@
>  #define WDOG_CS_CLK		(LPO_CLK << LPO_CLK_SHIFT)
>  #define WDOG_CS_EN		BIT(7)
>  #define WDOG_CS_UPDATE		BIT(5)
> +#define WDOG_CS_WAIT		BIT(1)
> +#define WDOG_CS_STOP		BIT(0)
>  
>  #define WDOG_CNT	0x4
>  #define WDOG_TOVAL	0x8
> @@ -187,7 +189,8 @@ static int imx7ulp_wdt_init(void __iomem *base, unsigned int timeout)
>  	/* set an initial timeout value in TOVAL */
>  	writel(timeout, base + WDOG_TOVAL);
>  	/* enable 32bit command sequence and reconfigure */
> -	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE;
> +	val = WDOG_CS_CMD32EN | WDOG_CS_CLK | WDOG_CS_UPDATE |
> +	      WDOG_CS_WAIT | WDOG_CS_STOP;
>  	writel(val, base + WDOG_CS);
>  	imx7ulp_wdt_wait(base, WDOG_CS_RCS);
>  

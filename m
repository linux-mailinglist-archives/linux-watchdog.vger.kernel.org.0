Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15EC52C90CF
	for <lists+linux-watchdog@lfdr.de>; Mon, 30 Nov 2020 23:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728280AbgK3WSU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 30 Nov 2020 17:18:20 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:38021 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728235AbgK3WSU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 30 Nov 2020 17:18:20 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id 8A1D6215CA6
        for <linux-watchdog@vger.kernel.org>; Mon, 30 Nov 2020 15:17:39 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id jrUJkErxfh41ljrUJkHvhB; Mon, 30 Nov 2020 15:17:39 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=GNom7NFK c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=ZTmiYS-oAAAA:8
 a=ZqF6K3V0EXUI7utCa_YA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=Bgfdu2smNuKfk3vLOmSO:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=n2NGqzpn5T98prdITtAyDWGfEkFFfDD2qmxAVnlQiZQ=; b=1ofXAPCOBzDgvNqmCXsabfyRLg
        I+nTxkhhGRj8C6IYUeB0gkCBd9yxFmHvHk0MED1hGEBSaMGYQ6pJ8M2aR+FUJE0H9Uf/8rmf1ReG7
        BFdonBq2LkGs/F8JekCG+rWiw10x9kVn8A8uhk0hSMCxPwXj8R5t7FUYA12aXu6wYSvJo22bwdszo
        41V0as4NI4OR7eoS2RwoU9jUsu3rV9CNKRHwcLh2dv0gaWaUG+PORiM7Nk/+oPNsen3T+hsbYcfuq
        jF7I8EgVe6n/CeFXMB7JwDgdDmftpO2ZDN5snaDJdOuH4cDqvvMnA6WJUrmlxVQFWFaoJZDGaQiyI
        bJoKKXvQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:56812 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kjrUI-001hvu-Lh; Mon, 30 Nov 2020 22:17:38 +0000
Date:   Mon, 30 Nov 2020 14:17:38 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 3/3] watchdog: iTCO_wdt: use pm_ptr()
Message-ID: <20201130221738.GA43094@roeck-us.net>
References: <20201117152214.32244-1-info@metux.net>
 <20201117152214.32244-3-info@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117152214.32244-3-info@metux.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kjrUI-001hvu-Lh
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:56812
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 19
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Nov 17, 2020 at 04:22:14PM +0100, Enrico Weigelt, metux IT consult wrote:
> Reduce a little bit of boilerplate by using pm_ptr().
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/watchdog/iTCO_wdt.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
> index edc588a06ae6..660fc262fbc0 100644
> --- a/drivers/watchdog/iTCO_wdt.c
> +++ b/drivers/watchdog/iTCO_wdt.c
> @@ -636,16 +636,13 @@ static const struct dev_pm_ops iTCO_wdt_pm = {
>  	.resume_noirq = iTCO_wdt_resume_noirq,
>  };
>  
> -#define ITCO_WDT_PM_OPS	(&iTCO_wdt_pm)
> -#else
> -#define ITCO_WDT_PM_OPS	NULL
>  #endif /* CONFIG_PM_SLEEP */
>  
>  static struct platform_driver iTCO_wdt_driver = {
>  	.probe          = iTCO_wdt_probe,
>  	.driver         = {
>  		.name   = DRV_NAME,
> -		.pm     = ITCO_WDT_PM_OPS,
> +		.pm     = pm_ptr(&iTCO_wdt_pm),

Not sure if this works. The ifdef is for CONFIG_PM_SLEEP,
but pm_ptr depends on CONFIG_PM. While PM_SLEEP selects PM,
PM is also selected by other means. Other drivers using pm_ptr
also use SIMPLE_DEV_PM_OPS() and __maybe_unused for the function
declarations. This is not the case here. With this in mind,
I'd rather not make this change without changing the rest
of the code as well to ensure consistency.

Thanks,
Guenter

>  	},
>  };
>  

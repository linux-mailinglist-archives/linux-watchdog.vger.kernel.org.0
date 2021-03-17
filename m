Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C527A33E8E3
	for <lists+linux-watchdog@lfdr.de>; Wed, 17 Mar 2021 06:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbhCQFT6 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 17 Mar 2021 01:19:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhCQFT2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 17 Mar 2021 01:19:28 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22921C06174A;
        Tue, 16 Mar 2021 22:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=OfxmYWdwCN6dEvh6vg93WBLT1NDXVJ0+kR+uHN7sblE=; b=iiKecBM3nQKWRu+EsSJug6SLES
        Wt9BydjaQK6dCFmGKaOWssf1m9emmiwOd7YPCH4RkGZlminXe0CCm+ZOCHqmwGTJYmMjU1g+knB/6
        p5lsSwlx4+n0zdA9EjdjgpLltllqO6+/qOYoQSxk1F0rgNj1KL7TWy6vF7pXUxEs5heEeK8phBxes
        LIoVIRa0OYMu8KGUApWoTcL6O0yZC/5Oo4+L7azCHe6rPOziXG2zKV2c1q1qEQ+pEKcrS/grVMwvp
        AmkaPtF+7lB6u/ymEIxJMfthFM/4cd76M9QmfQMLh3A4GEDwPQAFFhV6syQzpncSBjVXR9fUwm9kf
        8tGibQSg==;
Received: from [2601:1c0:6280:3f0::9757]
        by merlin.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMOab-001bW3-RC; Wed, 17 Mar 2021 05:19:26 +0000
Subject: Re: [PATCH] watchdog: Fix a typo in the file orion_wdt.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210317051734.97314-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4e8fc18e-ce38-e118-6044-372f9beab372@infradead.org>
Date:   Tue, 16 Mar 2021 22:19:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210317051734.97314-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/16/21 10:17 PM, Bhaskar Chowdhury wrote:
> 
> s/freqency/frequency/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  drivers/watchdog/orion_wdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/orion_wdt.c b/drivers/watchdog/orion_wdt.c
> index 4ddb4ea2e4a3..127eefc9161d 100644
> --- a/drivers/watchdog/orion_wdt.c
> +++ b/drivers/watchdog/orion_wdt.c
> @@ -174,7 +174,7 @@ static int armadaxp_wdt_clock_init(struct platform_device *pdev,
>  		return ret;
>  	}
> 
> -	/* Fix the wdt and timer1 clock freqency to 25MHz */
> +	/* Fix the wdt and timer1 clock frequency to 25MHz */
>  	val = WDT_AXP_FIXED_ENABLE_BIT | TIMER1_FIXED_ENABLE_BIT;
>  	atomic_io_modify(dev->reg + TIMER_CTRL, val, val);
> 
> --


-- 
~Randy


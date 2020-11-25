Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9052C41F4
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 15:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729743AbgKYOPL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 09:15:11 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:58222 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729835AbgKYOPL (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 09:15:11 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id BC332215C2A
        for <linux-watchdog@vger.kernel.org>; Wed, 25 Nov 2020 07:15:10 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id hvZekbjTgh41lhvZekfZQe; Wed, 25 Nov 2020 07:15:10 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=QrRwI26d c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=i0EeH86SAAAA:8
 a=_jlGtV7tAAAA:8 a=tHJDN6xf61NvxRtj2RIA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=+zfiL+SHoRx7dUGKJXzI9/IgkVKG3oeBTxUJh9WVFBE=; b=NaJUADPocc6J53s+eRaCLCxd8C
        SqzYSqHWJTMLtTMIx+KOFEtEKJC5FnPa+bxhKwHJYhuBnzeR7DSgYwTM/Ni8RvpXKVs8vhtQ7dBoK
        oF6/bHGl1wTfbYdYogBphyfI1jJtvI0WCZ9W2XV5Hft0MaoFi2/qRxGTS3rFztg20ibVUOEMfZQS/
        3JBbcdx9oSjKd4eft4ka5Z60emEbt4MmpuBHk9c9CMqSXbKM7bt+zaAnfPdmXQrrb7iSqSl8gEpQP
        I3MI3gahrnLul1PHYUoLnt2eDYzz+J3nb7cGP125UuIfplqo+Lz8l8gVqd2W/GSlA7ory/BCp6K5G
        x2ktTC1w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34400 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1khvZd-002IM6-S4; Wed, 25 Nov 2020 14:15:09 +0000
Date:   Wed, 25 Nov 2020 06:15:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Wang Li <wangli74@huawei.com>
Cc:     wim@linux-watchdog.org, krzk@kernel.org,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2] watchdog: rti-wdt: disable runtime pm in case of
 failure
Message-ID: <20201125141509.GA97010@roeck-us.net>
References: <20201125082956.3325066-1-wangli74@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201125082956.3325066-1-wangli74@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1khvZd-002IM6-S4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:34400
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 25
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Nov 25, 2020 at 04:29:56PM +0800, Wang Li wrote:
> In case of runtime pm failed, should disable runtime pm.
> 
> Fixes: 2d63908bdbfb ("watchdog: Add K3 RTI watchdog support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Li <wangli74@huawei.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Changelog:
> v2
> - Change the fix tag.
> ---
>  drivers/watchdog/rti_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
> index 836319cbaca9..8885841eef4f 100644
> --- a/drivers/watchdog/rti_wdt.c
> +++ b/drivers/watchdog/rti_wdt.c
> @@ -227,8 +227,10 @@ static int rti_wdt_probe(struct platform_device *pdev)
>  
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
> -	if (ret)
> -		return dev_err_probe(dev, ret, "runtime pm failed\n");
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "runtime pm failed\n");
> +		goto err_iomap;
> +	}
>  
>  	platform_set_drvdata(pdev, wdt);
>  
> -- 
> 2.25.4
> 

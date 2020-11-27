Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC7A2C692E
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Nov 2020 17:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730758AbgK0QMp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Nov 2020 11:12:45 -0500
Received: from gproxy5-pub.mail.unifiedlayer.com ([67.222.38.55]:59365 "EHLO
        gproxy5-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730603AbgK0QMo (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Nov 2020 11:12:44 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy5.mail.unifiedlayer.com (Postfix) with ESMTP id 14355140578
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Nov 2020 09:11:29 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id igLIkPkIYDlydigLIkE8TN; Fri, 27 Nov 2020 09:11:29 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=Kev8TzQD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=8AirrxEcAAAA:8
 a=_jlGtV7tAAAA:8 a=Nro7NMO--0V-uImYhzwA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=ST-jHhOKWsTCqRlWije3:22 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZILWuv1B2NBF1OR+RDhAcaumS1bJpcOjKqsC4w8N18I=; b=ibHAtFvGjF0GyUwyTIBC97cZ/z
        u0DAf0ocdOHwcIjDJ6A/qlE8Mvd/LokIEZeEUvJ9onMTuOTASpp/tgKc7R1OnbWVvuUefIoaWwhRQ
        XlH2lda5ZCeQ5UGLox/26QWtih/ifMudUxiqD6VDqINw8fWTDM++utDOyli5Q7rG7vhHLz7UWMbJ6
        W3LkhSfoUit/W0xqVnczEF9Nzytp8Qktzcadu3YvhqqypIp/sc4I2bNwHn/SexPXDUPW2KHiL1/s+
        tk8hutZP2VidBiq2UKxCUuDsZTWHiTI/Sb5cFzObUhvRil8FrFS8/eWU01cMAJvuWGACbRd/2Dpgr
        Y1f1ViTA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43464 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kigLI-002mw7-17; Fri, 27 Nov 2020 16:11:28 +0000
Date:   Fri, 27 Nov 2020 08:11:27 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wdt: sp805: add watchdog_stop on reboot
Message-ID: <20201127161127.GB9881@roeck-us.net>
References: <20201127075217.31312-1-qiang.zhao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201127075217.31312-1-qiang.zhao@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kigLI-002mw7-17
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:43464
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Nov 27, 2020 at 03:52:17PM +0800, Qiang Zhao wrote:
> From: Zhao Qiang <qiang.zhao@nxp.com>
> 
> Call watchdog_stop_on_reboot in probe func
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/sp805_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/sp805_wdt.c b/drivers/watchdog/sp805_wdt.c
> index 190d26e..958dc32 100644
> --- a/drivers/watchdog/sp805_wdt.c
> +++ b/drivers/watchdog/sp805_wdt.c
> @@ -291,6 +291,7 @@ sp805_wdt_probe(struct amba_device *adev, const struct amba_id *id)
>  		set_bit(WDOG_HW_RUNNING, &wdt->wdd.status);
>  	}
>  
> +	watchdog_stop_on_reboot(&wdt->wdd);
>  	ret = watchdog_register_device(&wdt->wdd);
>  	if (ret)
>  		goto err;
> -- 
> 2.7.4
> 

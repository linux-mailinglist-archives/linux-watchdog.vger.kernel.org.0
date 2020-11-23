Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 809AE2BFE3D
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 03:45:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgKWCn3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 Nov 2020 21:43:29 -0500
Received: from gproxy2-pub.mail.unifiedlayer.com ([69.89.18.3]:33812 "EHLO
        gproxy2-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726407AbgKWCn2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 Nov 2020 21:43:28 -0500
X-Greylist: delayed 1358 seconds by postgrey-1.27 at vger.kernel.org; Sun, 22 Nov 2020 21:43:28 EST
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy2.mail.unifiedlayer.com (Postfix) with ESMTP id 86FD41E0CBC
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Nov 2020 19:20:49 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id h1TEkoinCDlydh1TFke2mb; Sun, 22 Nov 2020 19:20:49 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=CLQEoyjD c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=MvuuwTCpAAAA:8
 a=_jlGtV7tAAAA:8 a=LyoT_XtgLsg-adAtZukA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=dVHiktpip_riXrfdqayU:22 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BvSzjs4xlJ5tCmp/VxvD3/YjWeL5lRnFbVGlvecpFgw=; b=NvlJ9VfIPTXAgH+wuraWhO07J5
        XD0A5ZW622FAoqiGc6b2lS9DB0HOM/Daj0ctPrFfImSzJXkZHsUnVcZVPUW7u8pBR5vpC9+kSrv1U
        0Zm9LHkd+A5/OTlNwBT1tZxlkXUksfSKrjxB4YmDc6fblY+AfrSt8gkerJDkd0fxIlJ6JiCNLlN18
        +AgkjYq9B3dM5+/wG0zgoyXb4SWiU8lKJHWcEVN7DTJrC4gcDsSwGwH/5FqI43EacR+0s39Q9K/8X
        d4YhEktQejmb9Pf33qQpw8mJhIrG02rdN6UuHRGxxJUIm5iXWYmgf1whUKmy2tnRmqWWb5a2CL9tt
        IwlRdteA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47314 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kh1TE-003HYr-GJ; Mon, 23 Nov 2020 02:20:48 +0000
Date:   Sun, 22 Nov 2020 18:20:47 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, kasong@redhat.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 2/2] watchdog/hpwdt: Reflect changes
Message-ID: <20201123022047.GB78205@roeck-us.net>
References: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
 <1606097320-56762-3-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606097320-56762-3-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kh1TE-003HYr-GJ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:47314
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 8
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 22, 2020 at 07:08:40PM -0700, Jerry Hoemann wrote:
> Bump driver number to reflect recent changes.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index eeb4df2..cbd1498 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -23,7 +23,7 @@
>  #include <asm/nmi.h>
>  #include <linux/crash_dump.h>
>  
> -#define HPWDT_VERSION			"2.0.3"
> +#define HPWDT_VERSION			"2.0.4"
>  #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
>  #define TICKS_TO_SECS(ticks)		((ticks) * 128 / 1000)
>  #define HPWDT_MAX_TICKS			65535
> -- 
> 1.8.3.1
> 

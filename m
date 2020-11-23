Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5462BFE21
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Nov 2020 03:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgKWCUh (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 22 Nov 2020 21:20:37 -0500
Received: from gproxy7-pub.mail.unifiedlayer.com ([70.40.196.235]:53138 "EHLO
        gproxy7-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726885AbgKWCUh (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 22 Nov 2020 21:20:37 -0500
Received: from cmgw15.unifiedlayer.com (unknown [10.9.0.15])
        by gproxy7.mail.unifiedlayer.com (Postfix) with ESMTP id B1FF0215C7E
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Nov 2020 19:20:35 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id h1T1kI0eTh41lh1T1kMCwN; Sun, 22 Nov 2020 19:20:35 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=FoUrAVjq c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=MvuuwTCpAAAA:8
 a=_jlGtV7tAAAA:8 a=13p2I4FaCHjCyMFJ0qEA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=dVHiktpip_riXrfdqayU:22 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=FWhjNLIgIiv8au8+91/1yKaBEY8a2rsoplxxrAGJb/8=; b=tfPa7JLXwxNMwf+7cUJYFPJdmP
        Gwh9j+azPUQEJQHoW+JXZBBd46Zn62OwABAoV/grpYPlAp9AM1xqBbgsmH7nwBpTQaul6p36Drwei
        MidZSP+P73bey6t+9l2dIeVzO72jauvjvdg3MsBMsj2cAQIUbXEPkLYOxO3sc2hOUipRnN6cil0b8
        u3DHrYwg3Mvzd+MgRkurV33vYNrWKaTMA262jx/PqoamcknnEJ5vNbOwbfORRjDLAN6wTMvq0rN6e
        3aXkUENTX+6zLBKMXtoH1JHM4RDDsQ/lfkgCJjgsxhFEK2MMYeqYQFSJvGtyzjcqz5gNX1Mh+6qH5
        NYem99Bw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:47310 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kh1T0-003HUm-P1; Mon, 23 Nov 2020 02:20:34 +0000
Date:   Sun, 22 Nov 2020 18:20:34 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Jerry Hoemann <jerry.hoemann@hpe.com>
Cc:     wim@linux-watchdog.org, kasong@redhat.com,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog/hpwdt: Disable NMI in Crash Kernel
Message-ID: <20201123022034.GA78205@roeck-us.net>
References: <1606097320-56762-1-git-send-email-jerry.hoemann@hpe.com>
 <1606097320-56762-2-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606097320-56762-2-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kh1T0-003HUm-P1
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:47310
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 4
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Nov 22, 2020 at 07:08:39PM -0700, Jerry Hoemann wrote:
> NMIs received during the crash path are problematic as hpwdt_pretimeout
> handling of the NMI would cause a reentry into kdump.
> 
> The situation is complicated in that I/O errors can be signaled as NMI
> circumventing hpwdt_pretimeout's attempt to not claim NMI not associated
> with either the WDT or the iLO NMI switch.  These NMI can additionally
> cause a secondary NMI which cause the system to hang.
> 
> By disabling pretimeout and hpwdtimeout in crash path we both reduce
> the risk of receiving an NMI and simuletaneously leave the WDT running
> (if it was already in use) to allow the WDT to break the system out of
> hangs by the WDT reset.
> 
> Signed-off-by: Jerry Hoemann <jerry.hoemann@hpe.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/hpwdt.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/watchdog/hpwdt.c b/drivers/watchdog/hpwdt.c
> index 7d34bcf..eeb4df2 100644
> --- a/drivers/watchdog/hpwdt.c
> +++ b/drivers/watchdog/hpwdt.c
> @@ -21,6 +21,7 @@
>  #include <linux/types.h>
>  #include <linux/watchdog.h>
>  #include <asm/nmi.h>
> +#include <linux/crash_dump.h>
>  
>  #define HPWDT_VERSION			"2.0.3"
>  #define SECS_TO_TICKS(secs)		((secs) * 1000 / 128)
> @@ -334,6 +335,11 @@ static int hpwdt_init_one(struct pci_dev *dev,
>  	watchdog_set_nowayout(&hpwdt_dev, nowayout);
>  	watchdog_init_timeout(&hpwdt_dev, soft_margin, NULL);
>  
> +	if (is_kdump_kernel()) {
> +		pretimeout = 0;
> +		kdumptimeout = 0;
> +	}
> +
>  	if (pretimeout && hpwdt_dev.timeout <= PRETIMEOUT_SEC) {
>  		dev_warn(&dev->dev, "timeout <= pretimeout. Setting pretimeout to zero\n");
>  		pretimeout = 0;
> -- 
> 1.8.3.1
> 

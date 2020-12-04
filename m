Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9F362CE54A
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Dec 2020 02:45:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbgLDBn7 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Dec 2020 20:43:59 -0500
Received: from gproxy3-pub.mail.unifiedlayer.com ([69.89.30.42]:49889 "EHLO
        gproxy3-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725849AbgLDBn7 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Dec 2020 20:43:59 -0500
Received: from cmgw10.unifiedlayer.com (unknown [10.9.0.10])
        by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id 6D87C4013B
        for <linux-watchdog@vger.kernel.org>; Thu,  3 Dec 2020 18:41:55 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id l06ckAUD0Dlydl06dkxaaf; Thu, 03 Dec 2020 18:41:55 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=PajReBpd c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=zTNgK-yGK50A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=_jlGtV7tAAAA:8
 a=EO5IJpH2gAH_pC5_PvMA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=nlm17XC03S6CtCLSeiRr:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=RKrDXpnvOKnYa9s4QNbszpbo311dk42G28a9T0DPdbM=; b=M/TkRbHe1PeaAusvc0N27xOQLK
        Iq1pgKLf1prUkTFsTESrmBdT2IlYxmqd4ev5uE8ViHDjxoVGaPN03FS3eBg7zMg9SI+cLYQa+8aCx
        TKKl3SM5EGLUAF+3PHOqEILCNOV+YIrRDEtYags2EKbS0bBAeoNZHIvmORIsWnADqM3boPJrBX4sO
        064ar/rWIZaFHY5d/cNtBjdFZgGbsej/WktIt5WC/LrPPc1RoxxUj4FEa4hq8gzZI+jLVpG+AC+O9
        CSo/yDCqrVsjFsGGhwoQMzuzPd/0+vaFxCCsfVUWeMR7wEksQnQS6xNSL0cP83n+Om18pTwWRsa6Y
        VT3Squbw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:44140 helo=localhost)
        by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kl06c-003z4m-BG; Fri, 04 Dec 2020 01:41:54 +0000
Date:   Thu, 3 Dec 2020 17:41:53 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] watchdog: coh901327: add COMMON_CLK dependency
Message-ID: <20201204014153.GA109274@roeck-us.net>
References: <20201203223358.1269372-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203223358.1269372-1-arnd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kl06c-003z4m-BG
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:44140
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 3
X-Org:  HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Dec 03, 2020 at 11:33:42PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang produces a build failure in configurations without COMMON_CLK
> when a timeout calculation goes wrong:
> 
> arm-linux-gnueabi-ld: drivers/watchdog/coh901327_wdt.o: in function `coh901327_enable':
> coh901327_wdt.c:(.text+0x50): undefined reference to `__bad_udelay'
> 
> Add a Kconfig dependency to only do build testing when COMMON_CLK
> is enabled.
> 
> Fixes: da2a68b3eb47 ("watchdog: Enable COMPILE_TEST where possible")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 8bdbd125821b..32fa6de7b820 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -631,7 +631,7 @@ config SUNXI_WATCHDOG
>  
>  config COH901327_WATCHDOG
>  	bool "ST-Ericsson COH 901 327 watchdog"
> -	depends on ARCH_U300 || (ARM && COMPILE_TEST)
> +	depends on ARCH_U300 || (ARM && COMMON_CLK && COMPILE_TEST)
>  	default y if MACH_U300
>  	select WATCHDOG_CORE
>  	help
> -- 
> 2.27.0
> 

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BEC390938
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 May 2021 20:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhEYSva (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 25 May 2021 14:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbhEYSv3 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 25 May 2021 14:51:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05A8BC061574;
        Tue, 25 May 2021 11:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=NQ4epcrwJLnOn+Z5Q+JRgBByAlxt8NqaS+qzYMfwous=; b=0+HeAohaTk3nEUm+5ikX4z2xXZ
        pa6BBSNrXg/D5oWNrR7H0eNcBmJ15laH9jpkcRa/eSa/hVmR6+ScJJX4188g5DyY+GGkfUPRskWSg
        Z//pXv63+3UihPJKDOC+rMdn1JC89WXVoWeTeSButOCPLLxto6v34QdPCB5J8/emxxucbXr7tqOz2
        swx6abJ1xdthzoXwZHXDQIXN5xEyJ4uBag220nRUYG1BmGaBM9TQY4KeG2MwmcqjGVljjaBCX5UjF
        pbNasIRHzeoMOyuBo3/W5Yr+rWX2Rzr74Onqg8cBrgrCbAJCrzmTxeAt0+pcedO8+Mbpm9+/HGMFr
        IH4H8ybA==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1llc7m-007QcW-VP; Tue, 25 May 2021 18:49:55 +0000
Subject: Re: [PATCH 2/3] watchdog: Add Mstar MSC313e WDT driver
To:     Romain Perier <romain.perier@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210525184449.57703-1-romain.perier@gmail.com>
 <20210525184449.57703-3-romain.perier@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <dfb1173d-7564-9386-10bf-5151ef284635@infradead.org>
Date:   Tue, 25 May 2021 11:49:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525184449.57703-3-romain.perier@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi,

On 5/25/21 11:44 AM, Romain Perier wrote:
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 355100dad60a..f53634ea0de6 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -980,6 +980,19 @@ config VISCONTI_WATCHDOG
>  	  Say Y here to include support for the watchdog timer in Toshiba
>  	  Visconti SoCs.
>  
> +config MSC313E_WATCHDOG
> +	tristate "MStar MSC313e watchdog"
> +	depends on ARCH_MSTARV7 || COMPILE_TEST
> +	depends on OF
> +	select WATCHDOG_CORE
> +	help
> +	  Say Y here to include support for the Watchdog timer embedded
> +	  into MStar MSC313e chips. This will reboot your system when the
> +	  timeout is reached.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called msc313e_wdt.

AFAIK, you don't need the "depends on OF" line since
the of*.h headers provide stubs for the cases of CONFIG_OF
and/or CONFIG_OF_ADDRESS not set/enabled.

Not having that line would also make COMPILE_TEST more effective.

Can Rob or anyone else comment on this?

thanks.
-- 
~Randy


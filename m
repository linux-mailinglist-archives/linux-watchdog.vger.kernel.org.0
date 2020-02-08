Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 814F615649D
	for <lists+linux-watchdog@lfdr.de>; Sat,  8 Feb 2020 14:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgBHN4o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 8 Feb 2020 08:56:44 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:48215 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727220AbgBHN4n (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 8 Feb 2020 08:56:43 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j0QbC-0001o5-BH; Sat, 08 Feb 2020 14:56:42 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <mfe@pengutronix.de>)
        id 1j0QbB-0003gB-2h; Sat, 08 Feb 2020 14:56:41 +0100
Date:   Sat, 8 Feb 2020 14:56:41 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
        Stefan Lengfeld <contact@stefanchrist.eu>
Subject: Re: [PATCH] watchdog: da9062: Add dependency on I2C
Message-ID: <20200208135641.r552bfcy7jhvmd6v@pengutronix.de>
References: <20200208130803.23387-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200208130803.23387-1-linux@roeck-us.net>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:55:36 up 85 days,  5:14, 88 users,  load average: 0.30, 0.09,
 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-watchdog@vger.kernel.org
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

thanks for fixing that.

On 20-02-08 05:08, Guenter Roeck wrote:
> Since commit 057b52b4b3d58 ("watchdog: da9062: make restart handler atomic
> safe"), the driver calls i2c functions directly. It now therefore depends
> on I2C. This is a hard dependency which overrides COMPILE_TEST.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Fixes: 057b52b4b3d58 ("watchdog: da9062: make restart handler atomic safe")
> Cc: Marco Felsch <m.felsch@pengutronix.de>
> Cc: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
> Cc: Stefan Lengfeld <contact@stefanchrist.eu>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de> 

> ---
>  drivers/watchdog/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index c3c8e0786a99..9ea2b43d4b01 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -207,6 +207,7 @@ config DA9063_WATCHDOG
>  config DA9062_WATCHDOG
>  	tristate "Dialog DA9062/61 Watchdog"
>  	depends on MFD_DA9062 || COMPILE_TEST
> +	depends on I2C
>  	select WATCHDOG_CORE
>  	help
>  	  Support for the watchdog in the DA9062 and DA9061 PMICs.
> -- 
> 2.17.1

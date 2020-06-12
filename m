Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6125E1F733C
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jun 2020 06:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbgFLE5v (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 12 Jun 2020 00:57:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:35371 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgFLE5v (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 12 Jun 2020 00:57:51 -0400
IronPort-SDR: yY9qTUk9I7dv2FyZmPQKXRsTsDbhw+pJrRA2mhMwqqYwd/NWe3ioKlYdczmc37woBz4yvI1NBI
 Mu29UAgjY2iw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 21:57:51 -0700
IronPort-SDR: TVAOPOCmSU5HUuOXXiG2CyzlC6NPXkd8H84dQXR3DyQfwZrnRpalFqiat+jxNFcVDqhzh8jw21
 TdWDnbch88Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,501,1583222400"; 
   d="scan'208";a="474076399"
Received: from lkp-server01.sh.intel.com (HELO b6eec31c25be) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Jun 2020 21:57:49 -0700
Received: from kbuild by b6eec31c25be with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jjblE-0000Vu-EN; Fri, 12 Jun 2020 04:57:48 +0000
Date:   Fri, 12 Jun 2020 12:57:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     kbuild-all@lists.01.org, linux-watchdog@vger.kernel.org,
        kernel@pengutronix.de, Ahmad Fatoum <a.fatoum@pengutronix.de>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] watchdog: f71808e_wdt: fintek_variants[] can be static
Message-ID: <20200612045721.GA41703@e3d72cc7cdb3>
References: <20200611191750.28096-9-a.fatoum@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611191750.28096-9-a.fatoum@pengutronix.de>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


Signed-off-by: kernel test robot <lkp@intel.com>
---
 f71808e_wdt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/f71808e_wdt.c b/drivers/watchdog/f71808e_wdt.c
index c866d05e8788b..849620041c0ef 100644
--- a/drivers/watchdog/f71808e_wdt.c
+++ b/drivers/watchdog/f71808e_wdt.c
@@ -484,7 +484,7 @@ static void f81866_pinconf(struct fintek_wdog_data *wd)
 	superio_clear_bit(wd->sioaddr, SIO_F81866_REG_GPIO1, 5);
 }
 
-struct fintek_variant fintek_variants[] = {
+static struct fintek_variant fintek_variants[] = {
 	{ SIO_F71808_ID,  "f71808fg", f71808fg_pinconf },
 	{ SIO_F71862_ID,  "f71862fg", f71862fg_pinconf },
 	{ SIO_F71868_ID,  "f71868",   f71868_pinconf },

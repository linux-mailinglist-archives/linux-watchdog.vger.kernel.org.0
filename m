Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E34F25FA00
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Sep 2020 13:58:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729179AbgIGL6P (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Sep 2020 07:58:15 -0400
Received: from goliath.siemens.de ([192.35.17.28]:48447 "EHLO
        goliath.siemens.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729004AbgIGL51 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Sep 2020 07:57:27 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
        by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 087BL5vl002697
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 7 Sep 2020 13:21:05 +0200
Received: from [167.87.17.27] ([167.87.17.27])
        by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087BKxrG020843;
        Mon, 7 Sep 2020 13:21:02 +0200
To:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org,
        "Awan, Arsalan" <Arsalan_Awan@mentor.com>,
        "Hombourger, Cedric" <Cedric_Hombourger@mentor.com>,
        "Farnsworth, Wade" <wade_farnsworth@mentor.com>
From:   Jan Kiszka <jan.kiszka@siemens.com>
Subject: watchdog: sp5100_tco support for AMD V/R/E series
Message-ID: <15c8913e-9026-2649-9911-71d6f1c79519@siemens.com>
Date:   Mon, 7 Sep 2020 13:20:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi all,

Arsalan reported that the upstream driver for sp5100_tco does not work
for embedded Ryzen. Meanwhile, I was able to confirm that on an R1505G:

[   11.607251] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[   11.607337] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO address
[   11.607344] sp5100-tco sp5100-tco: Watchdog hardware is disabled

..and fix it:

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index 85e9664318c9..5482154fde42 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -193,7 +193,8 @@ static void tco_timer_enable(struct sp5100_tco *tco)
 		/* Set the Watchdog timer resolution to 1 sec and enable */
 		sp5100_tco_update_pm_reg8(EFCH_PM_DECODEEN3,
 					  ~EFCH_PM_WATCHDOG_DISABLE,
-					  EFCH_PM_DECODEEN_SECOND_RES);
+					  EFCH_PM_DECODEEN_SECOND_RES |
+					  EFCH_PM_DECODEEN_WDT_TMREN);
 		break;
 	}
 }

Does anyone have an idea if such unconditional setting could be 
problematic on older/different efch? We probe for that bit in
sp5100_tco_setupdevice but we never set it so far.

I'm missing specs...

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

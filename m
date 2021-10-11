Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFEC8429537
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Oct 2021 19:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbhJKRIm (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 11 Oct 2021 13:08:42 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:52501 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232477AbhJKRIl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 11 Oct 2021 13:08:41 -0400
Received: from [77.244.183.192] (port=63592 helo=melee.dev.aim)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mZxfP-00DXft-0P; Mon, 11 Oct 2021 17:56:43 +0200
From:   Luca Ceresoli <luca@lucaceresoli.net>
To:     linux-kernel@vger.kernel.org
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 4/8] rtc: max77686: remove useless variable
Date:   Mon, 11 Oct 2021 17:56:11 +0200
Message-Id: <20211011155615.257529-5-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011155615.257529-1-luca@lucaceresoli.net>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

rtc_24hr_mode is set to 1 in max77686_rtc_probe()->max77686_rtc_init_reg()
before being read and is never set back to 0 again. As such, it is de facto
a constant.

Remove the variable and the unreachable code.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 drivers/rtc/rtc-max77686.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 7e765207f28e..9901c596998a 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -99,7 +99,6 @@ struct max77686_rtc_info {
 
 	int rtc_irq;
 	int virq;
-	int rtc_24hr_mode;
 };
 
 enum MAX77686_RTC_OP {
@@ -278,13 +277,7 @@ static void max77686_rtc_data_to_tm(u8 *data, struct rtc_time *tm,
 
 	tm->tm_sec = data[RTC_SEC] & mask;
 	tm->tm_min = data[RTC_MIN] & mask;
-	if (info->rtc_24hr_mode) {
-		tm->tm_hour = data[RTC_HOUR] & 0x1f;
-	} else {
-		tm->tm_hour = data[RTC_HOUR] & 0x0f;
-		if (data[RTC_HOUR] & HOUR_PM_MASK)
-			tm->tm_hour += 12;
-	}
+	tm->tm_hour = data[RTC_HOUR] & 0x1f;
 
 	/* Only a single bit is set in data[], so fls() would be equivalent */
 	tm->tm_wday = ffs(data[RTC_WEEKDAY] & mask) - 1;
@@ -662,8 +655,6 @@ static int max77686_rtc_init_reg(struct max77686_rtc_info *info)
 	data[0] = (1 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
 	data[1] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
 
-	info->rtc_24hr_mode = 1;
-
 	ret = regmap_bulk_write(info->rtc_regmap,
 				info->drv_data->map[REG_RTC_CONTROLM],
 				data, ARRAY_SIZE(data));
-- 
2.25.1


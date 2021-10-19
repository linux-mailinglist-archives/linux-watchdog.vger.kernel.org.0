Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 202C543396A
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Oct 2021 16:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231758AbhJSPBv (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 19 Oct 2021 11:01:51 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:57038 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231296AbhJSPBu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 19 Oct 2021 11:01:50 -0400
Received: from [77.244.183.192] (port=62116 helo=melee.fritz.box)
        by hostingweb31.netsons.net with esmtpa (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1mcqaW-00D5qd-H3; Tue, 19 Oct 2021 16:59:36 +0200
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
        Laxman Dewangan <ldewangan@nvidia.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/9] mfd: max77686: Correct tab-based alignment of register addresses
Date:   Tue, 19 Oct 2021 16:59:11 +0200
Message-Id: <20211019145919.7327-2-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019145919.7327-1-luca@lucaceresoli.net>
References: <20211019145919.7327-1-luca@lucaceresoli.net>
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

Some lines have an extra tab, remove them for proper visual alignment as
present on the rest of this file.

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes in v2: none
---
 include/linux/mfd/max77686-private.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/include/linux/mfd/max77686-private.h b/include/linux/mfd/max77686-private.h
index 833e578e051e..b1482b3cf353 100644
--- a/include/linux/mfd/max77686-private.h
+++ b/include/linux/mfd/max77686-private.h
@@ -133,35 +133,35 @@ enum max77686_pmic_reg {
 	/* Reserved: 0x7A-0x7D */
 
 	MAX77686_REG_BBAT_CHG		= 0x7E,
-	MAX77686_REG_32KHZ			= 0x7F,
+	MAX77686_REG_32KHZ		= 0x7F,
 
 	MAX77686_REG_PMIC_END		= 0x80,
 };
 
 enum max77686_rtc_reg {
-	MAX77686_RTC_INT			= 0x00,
-	MAX77686_RTC_INTM			= 0x01,
+	MAX77686_RTC_INT		= 0x00,
+	MAX77686_RTC_INTM		= 0x01,
 	MAX77686_RTC_CONTROLM		= 0x02,
 	MAX77686_RTC_CONTROL		= 0x03,
 	MAX77686_RTC_UPDATE0		= 0x04,
 	/* Reserved: 0x5 */
 	MAX77686_WTSR_SMPL_CNTL		= 0x06,
-	MAX77686_RTC_SEC			= 0x07,
-	MAX77686_RTC_MIN			= 0x08,
-	MAX77686_RTC_HOUR			= 0x09,
+	MAX77686_RTC_SEC		= 0x07,
+	MAX77686_RTC_MIN		= 0x08,
+	MAX77686_RTC_HOUR		= 0x09,
 	MAX77686_RTC_WEEKDAY		= 0x0A,
-	MAX77686_RTC_MONTH			= 0x0B,
-	MAX77686_RTC_YEAR			= 0x0C,
-	MAX77686_RTC_DATE			= 0x0D,
-	MAX77686_ALARM1_SEC			= 0x0E,
-	MAX77686_ALARM1_MIN			= 0x0F,
+	MAX77686_RTC_MONTH		= 0x0B,
+	MAX77686_RTC_YEAR		= 0x0C,
+	MAX77686_RTC_DATE		= 0x0D,
+	MAX77686_ALARM1_SEC		= 0x0E,
+	MAX77686_ALARM1_MIN		= 0x0F,
 	MAX77686_ALARM1_HOUR		= 0x10,
 	MAX77686_ALARM1_WEEKDAY		= 0x11,
 	MAX77686_ALARM1_MONTH		= 0x12,
 	MAX77686_ALARM1_YEAR		= 0x13,
 	MAX77686_ALARM1_DATE		= 0x14,
-	MAX77686_ALARM2_SEC			= 0x15,
-	MAX77686_ALARM2_MIN			= 0x16,
+	MAX77686_ALARM2_SEC		= 0x15,
+	MAX77686_ALARM2_MIN		= 0x16,
 	MAX77686_ALARM2_HOUR		= 0x17,
 	MAX77686_ALARM2_WEEKDAY		= 0x18,
 	MAX77686_ALARM2_MONTH		= 0x19,
-- 
2.25.1


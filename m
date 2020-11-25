Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E38E2C39EE
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 08:21:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgKYHRw (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 02:17:52 -0500
Received: from aclms3.advantech.com.tw ([125.252.70.86]:20993 "EHLO
        ACLMS3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgKYHRw (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 02:17:52 -0500
X-Greylist: delayed 605 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 02:17:51 EST
Received: from taipei08.ADVANTECH.CORP (unverified [172.20.0.235]) by ACLMS3.advantech.com.tw
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te30c5b10dcac1401c8114@ACLMS3.advantech.com.tw>;
 Wed, 25 Nov 2020 15:07:50 +0800
Received: from localhost (124.9.5.81) by taipei08.ADVANTECH.CORP
 (172.20.0.235) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 25 Nov
 2020 15:07:42 +0800
From:   Shihlun Lin <shihlun.lin@advantech.com.tw>
To:     "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        Campion Kang <campion.kang@advantech.com.tw>,
        Shihlun Lin <shihlun.lin@advantech.com.tw>,
        AceLan Kao <chia-lin.kao@canonical.com>
Subject: [RESEND PATCH v4 2/6] mfd: ahc1ec0: Add Advantech EC include file used by dt-bindings
Date:   Wed, 25 Nov 2020 15:07:40 +0800
Message-ID: <20201125070744.4651-2-shihlun.lin@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
References: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.9.5.81]
X-ClientProxiedBy: taipei09.ADVANTECH.CORP (172.20.0.236) To
 taipei08.ADVANTECH.CORP (172.20.0.235)
X-StopIT: No
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This files defines the sud-device types and hwmon profiles support by
Advantech embedded controller.

Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
---
 include/dt-bindings/mfd/ahc1ec0.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/mfd/ahc1ec0.h

diff --git a/include/dt-bindings/mfd/ahc1ec0.h b/include/dt-bindings/mfd/ahc1ec0.h
new file mode 100644
index 000000000000..389a7a7f8f02
--- /dev/null
+++ b/include/dt-bindings/mfd/ahc1ec0.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Device Tree defines for Advantech Embedded Controller (AHC1EC0)
+ */
+
+#ifndef _DT_BINDINGS_MFD_AHC1EC0_H
+#define _DT_BINDINGS_MFD_AHC1EC0_H
+
+/* Sub-device Definitions */
+#define AHC1EC0_SUBDEV_BRIGHTNESS 0x0
+#define AHC1EC0_SUBDEV_EEPROM     0x1
+#define AHC1EC0_SUBDEV_GPIO       0x2
+#define AHC1EC0_SUBDEV_HWMON      0x3
+#define AHC1EC0_SUBDEV_LED        0x4
+#define AHC1EC0_SUBDEV_WDT        0x5
+
+/* HWMON Profile Definitions */
+#define AHC1EC0_HWMON_PRO_TEMPLATE 0x0
+#define AHC1EC0_HWMON_PRO_TPC5XXX  0x1
+#define AHC1EC0_HWMON_PRO_PRVR4    0x2
+#define AHC1EC0_HWMON_PRO_UNO2271G 0x3
+#define AHC1EC0_HWMON_PRO_UNO1172A 0x4
+#define AHC1EC0_HWMON_PRO_UNO1372G 0x5
+
+#endif /* _DT_BINDINGS_MFD_AHC1EC0_H */
-- 
2.17.1


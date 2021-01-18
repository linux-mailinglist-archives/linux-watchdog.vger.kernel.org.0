Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 260252FA002
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 13:40:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404107AbhARMiy (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 07:38:54 -0500
Received: from aclms3.advantech.com.tw ([125.252.70.86]:57631 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404100AbhARMiv (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 07:38:51 -0500
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te423a06fb1ac1401c812dc@ACLMS4.ADVANTECH.CORP>;
 Mon, 18 Jan 2021 20:37:40 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 20:37:56 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v6 2/6] mfd: ahc1ec0: Add Advantech EC include file used by dt-bindings
Date:   Mon, 18 Jan 2021 20:37:45 +0800
Message-ID: <20210118123749.4769-2-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210118123749.4769-1-campion.kang@advantech.com.tw>
References: <20210118123749.4769-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 73C7DFBFE117426ED13E45A7EDC55497CF2A7F30645A3214E07EF9C3460BB1E32000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This files defines the sud-device types and hwmon profiles support by
Advantech embedded controller.

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 include/dt-bindings/mfd/ahc1ec0-dt.h | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 include/dt-bindings/mfd/ahc1ec0-dt.h

diff --git a/include/dt-bindings/mfd/ahc1ec0-dt.h b/include/dt-bindings/mfd/ahc1ec0-dt.h
new file mode 100644
index 000000000000..389a7a7f8f02
--- /dev/null
+++ b/include/dt-bindings/mfd/ahc1ec0-dt.h
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


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF4D3750B8
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233796AbhEFI1m (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:27:42 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233763AbhEFI1m (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:27:42 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee00956ac14110e2c04@ACLMS4.ADVANTECH.CORP>;
 Thu, 6 May 2021 16:16:23 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 16:16:23 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v7 2/7] mfd: ahc1ec0: Add Advantech EC include file used by dt-bindings
Date:   Thu, 6 May 2021 16:16:14 +0800
Message-ID: <20210506081619.2443-2-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506081619.2443-1-campion.kang@advantech.com.tw>
References: <20210506081619.2443-1-campion.kang@advantech.com.tw>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: D415A5548D11113D29A030314B78193205ABD8E3E9C1E2AABAF080DA70672BE72000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This files defines general used and HWMON profiles support by Advantech
embedded controller AHC1EC0.

Changed in v7:
	- remove unnecessary Sub-device definitions

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 include/dt-bindings/mfd/ahc1ec0-dt.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/mfd/ahc1ec0-dt.h

diff --git a/include/dt-bindings/mfd/ahc1ec0-dt.h b/include/dt-bindings/mfd/ahc1ec0-dt.h
new file mode 100644
index 000000000000..a35ecd5ce9d2
--- /dev/null
+++ b/include/dt-bindings/mfd/ahc1ec0-dt.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Device Tree defines for Advantech Embedded Controller (AHC1EC0)
+ */
+
+#ifndef _DT_BINDINGS_MFD_AHC1EC0_H
+#define _DT_BINDINGS_MFD_AHC1EC0_H
+
+/* HWMON Profile Definitions */
+#define AHC1EC0_HWMON_PRO_TEMPLATE	0x0
+#define AHC1EC0_HWMON_PRO_TPC5XXX	0x1
+#define AHC1EC0_HWMON_PRO_PRVR4		0x2
+#define AHC1EC0_HWMON_PRO_UNO2271G	0x3
+#define AHC1EC0_HWMON_PRO_UNO1172A	0x4
+#define AHC1EC0_HWMON_PRO_UNO1372G	0x5
+
+#endif /* _DT_BINDINGS_MFD_AHC1EC0_H */
-- 
2.17.1


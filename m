Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC953750B1
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 May 2021 10:26:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233772AbhEFI1j (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 6 May 2021 04:27:39 -0400
Received: from aclms3.advantech.com.tw ([125.252.70.86]:61945 "EHLO
        aclms3.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233767AbhEFI1i (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 6 May 2021 04:27:38 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Thu, 06 May 2021 04:27:37 EDT
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS4.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te64ee006b6ac14110e2c04@ACLMS4.ADVANTECH.CORP>;
 Thu, 6 May 2021 16:16:22 +0800
Received: from localhost (172.16.13.205) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 6 May
 2021 16:16:21 +0800
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
Subject: [PATCH v7 1/7] MAINTAINERS: Add Advantech AHC1EC0 embedded controller entry
Date:   Thu, 6 May 2021 16:16:13 +0800
Message-ID: <20210506081619.2443-1-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [172.16.13.205]
X-ClientProxiedBy: aclcas3.ADVANTECH.CORP (172.20.1.12) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 7876205C7FEC843B581A29769A73260EFC38050E181FB3FE9EB1A7062F0750B12000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Changed in V7:
	1. According to the reviewer's comment, add two files:
	   Documentation/hwmon/ahc1ec0-hwmon.rst and
	   drivers/platform/x86/ahc1ec0-core.c

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 83c2b1867586..984795eb6b5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -572,6 +572,19 @@ S:	Maintained
 F:	Documentation/scsi/advansys.rst
 F:	drivers/scsi/advansys.c
 
+ADVANTECH AHC1EC0 EMBEDDED CONTROLLER DRIVER
+M:	Campion Kang <campion.kang@advantech.com.tw>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
+F:	Documentation/hwmon/ahc1ec0-hwmon.rst
+F:	drivers/hwmon/ahc1ec0-hwmon.c
+F:	drivers/mfd/ahc1ec0.c
+F:	drivers/platform/x86/ahc1ec0-core.c
+F:	drivers/watchdog/ahc1ec0-wdt.c
+F:	include/dt-bindings/mfd/ahc1ec0-dt.h
+F:	include/linux/platform_data/ahc1ec0.h
+
 ADVANTECH SWBTN DRIVER
 M:	Andrea Ho <Andrea.Ho@advantech.com.tw>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.17.1


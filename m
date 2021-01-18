Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A9A2FA004
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Jan 2021 13:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404111AbhARMjB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 18 Jan 2021 07:39:01 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:55411 "EHLO
        aclms1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391421AbhARMiy (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 18 Jan 2021 07:38:54 -0500
Received: from taipei09.ADVANTECH.CORP (unverified [172.20.0.236]) by ACLMS2.ADVANTECH.CORP
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te423a0aba9ac14014b1cbc@ACLMS2.ADVANTECH.CORP>;
 Mon, 18 Jan 2021 20:37:55 +0800
Received: from localhost (172.16.12.146) by taipei09.ADVANTECH.CORP
 (172.20.0.236) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 18 Jan
 2021 20:37:52 +0800
From:   Campion Kang <campion.kang@advantech.com.tw>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-hwmon@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
        AceLan Kao <chia-lin.kao@canonical.com>,
        Campion Kang <campion.kang@advantech.com.tw>
Subject: [PATCH v6 1/6] MAINTAINERS: Add Advantech AHC1EC0 embedded controller entry
Date:   Mon, 18 Jan 2021 20:37:44 +0800
Message-ID: <20210118123749.4769-1-campion.kang@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.12.146]
X-ClientProxiedBy: ACLCAS4.ADVANTECH.CORP (172.20.2.20) To
 taipei09.ADVANTECH.CORP (172.20.0.236)
X-TM-SNTS-SMTP: 825B17EF239580278BAEB5586553E13416AA873D536EA6557C1679AE1DA87FA42000:8
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add Advantech AHC1EC0 embedded controller entry

Changed since V5:
	- add include/linux/mfd/ahc1ec0.h

Signed-off-by: Campion Kang <campion.kang@advantech.com.tw>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00836f6452f0..e1ccdaadb5ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -562,6 +562,17 @@ S:	Maintained
 F:	Documentation/scsi/advansys.rst
 F:	drivers/scsi/advansys.c
 
+ADVANTECH AHC1EC0 EMBEDDED CONTROLLER DRIVER
+M:	Campion Kang <campion.kang@advantech.com.tw>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
+F:	drivers/hwmon/ahc1ec0-hwmon.c
+F:	drivers/mfd/ahc1ec0.c
+F:	drivers/watchdog/ahc1ec0-wdt.c
+F:	include/dt-bindings/mfd/ahc1ec0-dt.h
+F:	include/linux/mfd/ahc1ec0.h
+
 ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
 M:	Michael Hennerich <michael.hennerich@analog.com>
 S:	Supported
-- 
2.17.1


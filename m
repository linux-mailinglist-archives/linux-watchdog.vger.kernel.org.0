Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D4D2C3ABB
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Nov 2020 09:16:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgKYIQX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 25 Nov 2020 03:16:23 -0500
Received: from aclms1.advantech.com.tw ([61.58.41.199]:53917 "EHLO
        ACLMS1.advantech.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgKYIQX (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 25 Nov 2020 03:16:23 -0500
X-Greylist: delayed 1488 seconds by postgrey-1.27 at vger.kernel.org; Wed, 25 Nov 2020 03:16:22 EST
Received: from taipei08.ADVANTECH.CORP (unverified [172.20.0.235]) by ACLMS1.advantech.com.tw
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te30c5af484ac14014b1470@ACLMS1.advantech.com.tw>;
 Wed, 25 Nov 2020 15:07:43 +0800
Received: from localhost (124.9.5.81) by taipei08.ADVANTECH.CORP
 (172.20.0.235) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Wed, 25 Nov
 2020 15:07:41 +0800
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
Subject: [RESEND PATCH v4 1/6] MAINTAINERS: Add Advantech embedded controller entry
Date:   Wed, 25 Nov 2020 15:07:39 +0800
Message-ID: <20201125070744.4651-1-shihlun.lin@advantech.com.tw>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [124.9.5.81]
X-ClientProxiedBy: taipei09.ADVANTECH.CORP (172.20.0.236) To
 taipei08.ADVANTECH.CORP (172.20.0.235)
X-StopIT: No
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add Advantech embedded controller entry

Signed-off-by: Shihlun Lin <shihlun.lin@advantech.com.tw>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94ac10a153c7..c1fe5233b469 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -562,6 +562,17 @@ S:	Maintained
 F:	Documentation/scsi/advansys.rst
 F:	drivers/scsi/advansys.c
 
+ADVANTECH EMBEDDED CONTROLLER DRIVER
+M:	Shihlun Lin <shihlun.lin@advantech.com.tw>
+M:	Campion Kang <campion.kang@advantech.com.tw>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/ahc1ec0.yaml
+F:	drivers/mfd/ahc1ec0-hwmon.c
+F:	drivers/mfd/ahc1ec0-wdt.c
+F:	drivers/mfd/ahc1ec0.c
+F:	include/dt-bindings/mfd/ahc1ec0.h
+
 ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
 M:	Michael Hennerich <michael.hennerich@analog.com>
 S:	Supported

base-commit: 3d5e28bff7ad55aea081c1af516cc1c94a5eca7d
-- 
2.17.1


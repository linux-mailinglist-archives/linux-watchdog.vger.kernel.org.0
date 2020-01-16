Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB1C13DBB8
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Jan 2020 14:27:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgAPN1p (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Jan 2020 08:27:45 -0500
Received: from mail-dm6nam11on2051.outbound.protection.outlook.com ([40.107.223.51]:32096
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729005AbgAPN1o (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Jan 2020 08:27:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Slzr86z6jmf8GeVCVPUkWCLMviP9k/VDOtDn9JqaCiOmRUo+f6J2KNxrsAAqirug2W6KEf+2kL94oIW0hkXTMjNDNwMSmEdqudHYRa2vqtt0YLH7iegqKkaxx6a9C8uuWEMWY50xaFZRYwbSvb8H5dR2ajOY/aK50L44YBH3YfThdNlfAQjuiXP3pdRSq+vq8EzWG9gm5XPes246R3S54eqO702fYrD6eYtsk7214dq4a0D5xzhKLzZKBI8EM6/q4688T4IpAAjp2L45yWny2WvxoyOvnNFZ2PA0dH8Cbc/qSJbRevCjAaunuZK7vTt3e7MIO+vBULImq+Bsloa+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrM3hFaA94ZGR0dieQwlPgTi+iGbq0J/YGjqs8/a0Zc=;
 b=QAXo1ENKpCNMWJMYRpLwQUL9ofyUrxzWwNDM8qDNG6NCS/WIBzm6qGMOztDiI5zDolBsRs+vkX3FiD47zakC2NI+GPGI6iGAdC2RpbPmbvfOjA9xOmax6E5GqYYmDrm+XrzrLlIcIzfYA2bhqR5q72Qb+Ch64FrExB+4d16nro6knMNkpLy7gLSLnM7+3lsyzUkltVwmY3Ybrswms6z1IQ0zXwHtZp60stfuH+iX4KHKWKR3yuhc5zbXVWSzAFSR/iL+55NJQiVwuIiBD0Umez8POh8lZNBFYMd3ztUlgOvLwCCGFHVGsVsqbj/yCsBMnTc4MK2B3pygVteKhvNprw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrM3hFaA94ZGR0dieQwlPgTi+iGbq0J/YGjqs8/a0Zc=;
 b=ign8iS51m+hIIkMlEcTvlMSMo6fW+cpm7GQUG++0ATM2Jge0OeQLP2kgYE5cGHJj7S4E0RNwtq38izntDXaK7Fl845yJ0SJIb1l0HnQWNLUazt/wknr7d1kmrrACS5vVhTcGjnCMuvmbbV5TWOl40/Qxzi/HKpNl+2duGhP2NOQ=
Received: from BYAPR02CA0058.namprd02.prod.outlook.com (2603:10b6:a03:54::35)
 by BN7PR02MB4179.namprd02.prod.outlook.com (2603:10b6:406:f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.10; Thu, 16 Jan
 2020 13:27:40 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::201) by BYAPR02CA0058.outlook.office365.com
 (2603:10b6:a03:54::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.15 via Frontend
 Transport; Thu, 16 Jan 2020 13:27:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2644.19
 via Frontend Transport; Thu, 16 Jan 2020 13:27:39 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BT-0005wN-07; Thu, 16 Jan 2020 05:27:39 -0800
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BN-0001FY-SJ; Thu, 16 Jan 2020 05:27:33 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 00GDRKRR016392;
        Thu, 16 Jan 2020 05:27:21 -0800
Received: from [10.140.6.6] (helo=xhdappanad40.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1is5BA-00018J-Bu; Thu, 16 Jan 2020 05:27:20 -0800
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     linux@roeck-us.net, michal.simek@xilinx.com,
        shubhrajyoti.datta@xilinx.com, sgoud@xilinx.com
Cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
Subject: [PATCH 7/9] watchdog: of_xilinx_wdt: Add Versal support
Date:   Thu, 16 Jan 2020 18:56:55 +0530
Message-Id: <1579181217-31127-8-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
References: <1579181217-31127-1-git-send-email-srinivas.neeli@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83;IPV:;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(136003)(376002)(396003)(39860400002)(346002)(189003)(199004)(81156014)(44832011)(6666004)(8676002)(356004)(5660300002)(4326008)(336012)(478600001)(70206006)(2906002)(107886003)(9786002)(36756003)(6636002)(316002)(70586007)(186003)(426003)(26005)(8936002)(81166006)(2616005)(7696005);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR02MB4179;H:xsj-pvapsmtpgw01;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-83.xilinx.com;MX:1;A:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9b2b73de-f8f3-4092-edc3-08d79a87dbd0
X-MS-TrafficTypeDiagnostic: BN7PR02MB4179:
X-Microsoft-Antispam-PRVS: <BN7PR02MB417938FB81F6CE39ED95152BAF360@BN7PR02MB4179.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 02843AA9E0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XLjpS9YlsIgO3o2Kw4R1CQZXUADZ/zTy03vdAgu2vkQqOgLcopQSg4mQuPMVGjYuyzNSkVwhVtft1eJTFbX32zGSqzy1evz2/Lvvh2xFovx+tC39MTgVxgKsT41W8p8LgYt+CjDXkICBF/tfrhkqXGVirJs3//F//uVyPDZkLp6RwKJOLD4zVuhCPGicoJFdlOMRCYUg3GMVxli3jqtEOfzBriwLiRhsSSm2HJqZVg3+U7dtP0mcuDV3vKZKrQEvosaAJhMz4kFdgT/0uy9sWYFdvVmUdhpgyXV891OEU5UT1CT+ulgKxPcCBuKDG5CkKLWwDUf8vccS/wjWYIrzoaI+xET83Z2Kk0CE7UuK9mnNq+3rNbD4Gqr8PpCt+TuG3yvlC+SaKYoJo7UWO82fAg6LwH1mQTQlPWK3yX80I3t/9EkONMgCdMS4oJhHLJc3
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2020 13:27:39.3898
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b2b73de-f8f3-4092-edc3-08d79a87dbd0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4179
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

From: Srinivas Goud <srinivas.goud@xilinx.com>

Versal watchdog driver uses generic watchdog mode.
Generic watchdog contains closed and open window of equal timeout.
Generic watchdog will generate reset signal if it is not explicitly
refreshed in second window.

Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 drivers/watchdog/of_xilinx_wdt.c | 150 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 149 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 3b93b60f1a00..d2c389d9eaa7 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -2,7 +2,7 @@
 /*
  * Watchdog Device Driver for Xilinx axi/xps_timebase_wdt
  *
- * (C) Copyright 2013 - 2014 Xilinx, Inc.
+ * (C) Copyright 2013 - 2020 Xilinx, Inc.
  * (C) Copyright 2011 (Alejandro Cabrera <aldaya@gmail.com>)
  */
 
@@ -18,10 +18,19 @@
 #include <linux/of_device.h>
 #include <linux/of_address.h>
 
+#define XWT_WWDT_MIN_TIMEOUT		1
+#define XWT_WWDT_MAX_TIMEOUT		80
+
 /* Register offsets for the Wdt device */
 #define XWT_TWCSR0_OFFSET   0x0 /* Control/Status Register0 */
 #define XWT_TWCSR1_OFFSET   0x4 /* Control/Status Register1 */
 #define XWT_TBR_OFFSET      0x8 /* Timebase Register Offset */
+#define XWT_WWREF_OFFSET	0x1000 /* Refresh Register */
+#define XWT_WWCSR_OFFSET	0x2000 /* Control/Status Register */
+#define XWT_WWOFF_OFFSET	0x2008 /* Offset Register */
+#define XWT_WWCMP0_OFFSET	0x2010 /* Compare Value Register0 */
+#define XWT_WWCMP1_OFFSET	0x2014 /* Compare Value Register1 */
+#define XWT_WWWRST_OFFSET	0x2FD0 /* Warm Reset Register */
 
 /* Control/Status Register Masks  */
 #define XWT_CSR0_WRS_MASK	BIT(3) /* Reset status */
@@ -31,6 +40,15 @@
 /* Control/Status Register 0/1 bits  */
 #define XWT_CSRX_EWDT2_MASK	BIT(0) /* Enable bit 2 */
 
+/* Refresh Register Masks */
+#define XWT_WWREF_GWRR_MASK	BIT(0) /* Refresh and start new period */
+
+/* Generic Control/Status Register Masks  */
+#define XWT_WWCSR_GWEN_MASK	BIT(0) /* Enable Bit */
+
+/* Warm Reset Register Masks */
+#define XWT_WWRST_GWWRR_MASK	BIT(0) /* Warm Reset Register */
+
 /* SelfTest constants */
 #define XWT_MAX_SELFTEST_LOOP_COUNT 0x00010000
 #define XWT_TIMER_FAILED            0xFFFFFFFF
@@ -41,9 +59,11 @@
  * enum xwdt_ip_type - WDT IP type.
  *
  * @XWDT_WDT: Soft wdt ip.
+ * @XWDT_WWDT: Window wdt ip.
  */
 enum xwdt_ip_type {
 	XWDT_WDT = 0,
+	XWDT_WWDT,
 };
 
 struct xwdt_devtype_data {
@@ -145,6 +165,126 @@ static const struct watchdog_ops xilinx_wdt_ops = {
 	.ping = xilinx_wdt_keepalive,
 };
 
+static int xilinx_wwdt_start(struct watchdog_device *wdd)
+{
+	int ret;
+	u32 control_status_reg;
+	u64 count;
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	unsigned long clock_f = clk_get_rate(xdev->clk);
+
+	/* Calculate timeout count */
+	count = wdd->timeout * clock_f;
+	ret  = clk_enable(xdev->clk);
+	if (ret) {
+		dev_err(wdd->parent, "Failed to enable clock\n");
+		return ret;
+	}
+
+	spin_lock(&xdev->spinlock);
+
+	/*
+	 * Timeout count is half as there are two windows
+	 * first window overflow is ignored (interrupt),
+	 * reset is only generated at second window overflow
+	 */
+	count = count >> 1;
+
+	/* Disable the generic watchdog timer */
+	control_status_reg = ioread32(xdev->base + XWT_WWCSR_OFFSET);
+	control_status_reg &= ~(XWT_WWCSR_GWEN_MASK);
+	iowrite32(control_status_reg, xdev->base + XWT_WWCSR_OFFSET);
+
+	/* Set compare and offset registers for generic watchdog timeout */
+	iowrite32((u32)count, xdev->base + XWT_WWCMP0_OFFSET);
+	iowrite32((u32)0, xdev->base + XWT_WWCMP1_OFFSET);
+	iowrite32((u32)count, xdev->base + XWT_WWOFF_OFFSET);
+
+	/* Enable the generic watchdog timer */
+	control_status_reg = ioread32(xdev->base + XWT_WWCSR_OFFSET);
+	control_status_reg |= (XWT_WWCSR_GWEN_MASK);
+	iowrite32(control_status_reg, xdev->base + XWT_WWCSR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Started!\n");
+
+	return 0;
+}
+
+static int xilinx_wwdt_stop(struct watchdog_device *wdd)
+{
+	u32 control_status_reg;
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	spin_lock(&xdev->spinlock);
+
+	/* Disable the generic watchdog timer */
+	control_status_reg = ioread32(xdev->base + XWT_WWCSR_OFFSET);
+	control_status_reg &= ~(XWT_WWCSR_GWEN_MASK);
+	iowrite32(control_status_reg, xdev->base + XWT_WWCSR_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	clk_disable(xdev->clk);
+
+	dev_dbg(xilinx_wdt_wdd->parent, "Watchdog Stopped!\n");
+
+	return 0;
+}
+
+static int xilinx_wwdt_keepalive(struct watchdog_device *wdd)
+{
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+
+	spin_lock(&xdev->spinlock);
+
+	iowrite32(XWT_WWREF_GWRR_MASK, xdev->base + XWT_WWREF_OFFSET);
+
+	spin_unlock(&xdev->spinlock);
+
+	return 0;
+}
+
+static int xilinx_wwdt_set_timeout(struct watchdog_device *wdd,
+				   unsigned int new_time)
+{
+	struct xwdt_device *xdev = watchdog_get_drvdata(wdd);
+	struct watchdog_device *xilinx_wdt_wdd = &xdev->xilinx_wdt_wdd;
+
+	if (new_time < XWT_WWDT_MIN_TIMEOUT ||
+	    new_time > XWT_WWDT_MAX_TIMEOUT) {
+		dev_warn(xilinx_wdt_wdd->parent,
+			 "timeout value must be %d<=x<=%d, using %d\n",
+				XWT_WWDT_MIN_TIMEOUT,
+				XWT_WWDT_MAX_TIMEOUT, new_time);
+		return -EINVAL;
+	}
+
+	wdd->timeout = new_time;
+
+	return xilinx_wwdt_start(wdd);
+}
+
+static const struct watchdog_info xilinx_wwdt_ident = {
+	.options =  WDIOF_MAGICCLOSE |
+		WDIOF_KEEPALIVEPING |
+		WDIOF_SETTIMEOUT,
+	.firmware_version =	1,
+	.identity = "xlnx_wwdt watchdog",
+};
+
+static const struct watchdog_ops xilinx_wwdt_ops = {
+	.owner = THIS_MODULE,
+	.start = xilinx_wwdt_start,
+	.stop = xilinx_wwdt_stop,
+	.ping = xilinx_wwdt_keepalive,
+	.set_timeout = xilinx_wwdt_set_timeout,
+};
+
 static u32 xwdt_selftest(struct xwdt_device *xdev)
 {
 	int i;
@@ -181,11 +321,19 @@ static const struct xwdt_devtype_data xwdt_wdt_data = {
 	.xwdt_ops = &xilinx_wdt_ops,
 };
 
+static const struct xwdt_devtype_data xwdt_wwdt_data = {
+	.wdttype = XWDT_WWDT,
+	.xwdt_info = &xilinx_wwdt_ident,
+	.xwdt_ops = &xilinx_wwdt_ops,
+};
+
 static const struct of_device_id xwdt_of_match[] = {
 	{ .compatible = "xlnx,xps-timebase-wdt-1.00.a",
 		.data = &xwdt_wdt_data },
 	{ .compatible = "xlnx,xps-timebase-wdt-1.01.a",
 		.data = &xwdt_wdt_data },
+	{ .compatible = "xlnx,versal-wwdt-1.0",
+		.data = &xwdt_wwdt_data },
 	{},
 };
 MODULE_DEVICE_TABLE(of, xwdt_of_match);
-- 
2.7.4


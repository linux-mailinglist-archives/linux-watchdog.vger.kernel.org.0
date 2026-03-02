Return-Path: <linux-watchdog+bounces-5042-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAXUAHzSpWk0HAAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5042-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 19:10:04 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F341DE476
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 19:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71395303B978
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 18:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4C831716B;
	Mon,  2 Mar 2026 18:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XiC2oH6t"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8010B3126D7;
	Mon,  2 Mar 2026 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772474941; cv=fail; b=djvBp21aySx+1b2KI0k/EjLBOKnZd6pPrIIzcttpwuRRaHwuMLY1LtnOX08yeMHUE+UpTxh6cPM0VFLFwzqsoEVxyGFw/hKJGK7L/hdB3Vz7nTIi5p4FuFQyivWWAb2ZZs7+XDeUwU3lYxI1Yj/H4YKDColjv8r3YiWo/AnMiqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772474941; c=relaxed/simple;
	bh=ugKFih3C2o7pYcjYY7yy48bvMTs5ys8pwex8NHOuN5g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ew084aGRpaCjSQ3viGyYN5OfyKn5oDk1FrgHmB/52WTVGqSimTxqMq3ltVdTHdGLEvDL0iub48hnK5fLpoLhLRSo7zm6rHwL/0/dnHZQ6IAtzvv6s0UJm8iWDz51J+QwQFUhHWNzEnNzLb6jEUYcpCcBZeSu/05x6fbAnpQbrhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XiC2oH6t; arc=fail smtp.client-ip=52.101.62.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkLfG+HdQIokC3Wdnx2iQ7iUoSX3ilpx8LcHqJ+Fz8L8YqFr5cBr/VyRzY0iR3yHmhqN6YWlEhRJy0ngglcDp/23aVqKHyzIqdB7MZZgjXbrEhbvOBUf6qPD8pUouK1+RJ8YkbmwXqHqo4x5NUibWr6VWRmfulJmnu1ZQ+haUsK/a0uBk3H1EawiJZpOIQiw5/1IM/nCb26LCjwujEbueSsjMG0ck/rqPpjlZJgqQfJ0u6nhxTd4fAtiXN/YJ8G4gF4VyfuX33RV2QB0cIVYynSx0ddxCYO2M9ad9B0XHRlzI7g7H74EutNqyBpdh5Qqp2Fr+NWt8uDpOdeCCLv1/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVnT2YQYu3lgfxyCcAmKNLTFJvqdFe6+LJ4vDHPhHVc=;
 b=ufXzoa7Y2BgLOelXLIVvA5kTjop5QQ9vUyQAtz5Hyo56Urmeq684//BVJRKfIaH9kLSX4yY8j2/xFe8pZkBeqpEvGT02sONpFwep/yN1zBKBpShO0DJqNqi+t5argYRK1xXe8TIzXuuiLz0HD40aC6y8u8qzuvEkjUNLT9IDhqe++RXuBXnHb47CvHrZFsu6iaUXvqkZBveMdmVuTjy4/9Hvz0ieiyW92zdaDDsmkacb1IChj4K164MtI6AeKgQuBdsAKo67kJWmBPSvHM4/qctjQS3GLCTjzOCxUFODcseluLecnTaVG/XqdhiqvZ6fODUbqdPphuAd7qal3Z8j5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVnT2YQYu3lgfxyCcAmKNLTFJvqdFe6+LJ4vDHPhHVc=;
 b=XiC2oH6t9pFcd2SBx4R4GbQ041a23BJzBkQvzfJYryCvzuE0f07sB7zmUwxWtss64/E0i5Xs/SBxDvQoQhsTxAeWzftzqYE9piKqrV3+vGCTbkFiKHCN0g5r0HS1ut961N4fglKhe7hJlJokXaQwjqCplfuPiC0z89TBcA1cus4=
Received: from BY5PR13CA0031.namprd13.prod.outlook.com (2603:10b6:a03:180::44)
 by SA1PR10MB5885.namprd10.prod.outlook.com (2603:10b6:806:234::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 18:08:57 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::a0) by BY5PR13CA0031.outlook.office365.com
 (2603:10b6:a03:180::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.19 via Frontend Transport; Mon,
 2 Mar 2026 18:08:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 18:08:56 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:08:56 -0600
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 12:08:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Mar 2026 12:08:55 -0600
Received: from lelvem-mr06.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 622I8tvk729521;
	Mon, 2 Mar 2026 12:08:55 -0600
From: Andrew Davis <afd@ti.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Florian Fainelli <florian.fainelli@broadcom.com>, "Ray
 Jui" <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
CC: <linux-watchdog@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH] watchdog: bcm2835_wdt: Switch to new sys-off handler API
Date: Mon, 2 Mar 2026 12:08:53 -0600
Message-ID: <20260302180853.224112-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SA1PR10MB5885:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e9743c6-0a65-43f0-4733-08de7886c582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info:
	r/Tg9Ve2jTXWrJQeqN8+G0dvk7Fbdb6QTSTGW8RA5Y6TlIWFtTad9RZbFA5141A90DJGYbdwLFaSpmWUXqqfrpT1R2BUW1IKz+zE9jtfeEzHSZe/POdoN9UW+AAczRhvCwBYt3/ct/jxO0T+1f1l1bdWWX0c8kUorFZuT3W5bEPG+7nM0zBKCf6CZO2Dcxa9wwrIOapb6+5zm2tLCLwOfKMuqx3m0q9ySlQ4uWYKORYLh+gGqF250GrjAnlgybdBWO3FDty0fmEcCKzdkeO11JwdUyxd2FNuzOdUnV/ZQIZnC2Tr1HOA1Sz/VSHQCpt9wEdQjd1ki5irko5AHafN11Mx0HJ02ihEPAm7ApLxLEkFELQUcU+PrWha2YNhYrMvX2He3jpWShjIGTvw+chJ+mYKl07Zfa4VTxRJAVm3ldGpB/rXw4XyJPS1qDKiXf5WJn0aHojPsEwVMXsuLfboZoUO3VcuxuZoW8CHxEurkOuMxlYrlPNNZhiJiinayXU9sTcEEDnZZY1dHC7XRgtCkEnnt9ur3Us0gEixdKoa6I34+kJftaFsrql2AxIcGNPJc9HaJlpqaxc3dpxW5be9a3JpxR+YfkoauNY9DgpsblBJ20RpETBx5Pr0bAJbDzgctctCCDgQqS4SIN0OlkX2H4hK5putsBI6nWvgCfwd5d1kdv42l4PYDUyZPcVPZxI3IZtJN2ulcWarH0AIxETb29uVt2xOXD21rEwCrDFh8hdrYELFuKocwMkmCDW/I3DceVN5TpWW0xZWTewAibALLf//m1o8bFbAxI/VjFwHgNDuQmhhLEqORvwBzS70LA1a1le8gDiPdjOYoD6MJDYeHg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	94zPDnfwRqqIHp+IhmuBeM4GCYjExOi8SPkfjjKvy2bmVJFUi9MFhiMIxQDbVimfhkRn5m1FR52Z7Y9BDx+T5yNrcmcL11MnvRaiRmGajdzOI81SHfk3J6QwjTBM53ThqrxzLuzQJO89Xk0s+fH0MbR0NDLU5Q8tZQjxbBwhLdLXpsX+3KkAAVxp1XEsmWx0fTy9FWFsgPz2lfvEv08XFlmKHgA+ZqRdN89mFzjka6CUSk7XOl9fRtz7pcUR6yqFhpU+nDYOBZ7MYEcVpJgd8spF2V1FbM0PKGEpeVh4KOMpJze2D8zMlAXwO3MXfNl7ZiBwTsJ/2iO8cQPYJ4WE4shw7M2QFkl0Re9z04quPRS9BpROZCV3zsnGZzSp8kbULO9dCWltCTAKlw8iUjE6oQT99SZJSeuW/OT4sXJFlIXTtMEEaVzf5hCpJohWgC0h
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 18:08:56.6484
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9743c6-0a65-43f0-4733-08de7886c582
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5885
X-Rspamd-Queue-Id: 71F341DE476
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5042-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[afd@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Kernel now supports chained power-off handlers. Use
devm_register_sys_off_handler() that registers a power-off handler. Legacy
pm_power_off() will be removed once all drivers and archs are converted to
the new sys-off API.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/watchdog/bcm2835_wdt.c | 28 +++++++++-------------------
 1 file changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
index 9fcfee63905b9..6fd8b1b8e386a 100644
--- a/drivers/watchdog/bcm2835_wdt.c
+++ b/drivers/watchdog/bcm2835_wdt.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
+#include <linux/reboot.h>
 
 #define PM_RSTC				0x1c
 #define PM_RSTS				0x20
@@ -49,8 +50,6 @@ struct bcm2835_wdt {
 	spinlock_t		lock;
 };
 
-static struct bcm2835_wdt *bcm2835_power_off_wdt;
-
 static unsigned int heartbeat;
 static bool nowayout = WATCHDOG_NOWAYOUT;
 
@@ -150,9 +149,9 @@ static struct watchdog_device bcm2835_wdt_wdd = {
  * indicate to bootcode.bin not to reboot, then most of the chip will be
  * powered off.
  */
-static void bcm2835_power_off(void)
+static int bcm2835_power_off(struct sys_off_data *data)
 {
-	struct bcm2835_wdt *wdt = bcm2835_power_off_wdt;
+	struct bcm2835_wdt *wdt = data->cb_data;
 	u32 val;
 
 	/*
@@ -166,6 +165,8 @@ static void bcm2835_power_off(void)
 
 	/* Continue with normal reset mechanism */
 	__bcm2835_restart(wdt);
+
+	return NOTIFY_DONE;
 }
 
 static int bcm2835_wdt_probe(struct platform_device *pdev)
@@ -206,28 +207,17 @@ static int bcm2835_wdt_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
-	if (of_device_is_system_power_controller(pdev->dev.parent->of_node)) {
-		if (!pm_power_off) {
-			pm_power_off = bcm2835_power_off;
-			bcm2835_power_off_wdt = wdt;
-		} else {
-			dev_info(dev, "Poweroff handler already present!\n");
-		}
-	}
+	if (of_device_is_system_power_controller(pdev->dev.parent->of_node))
+		devm_register_sys_off_handler(dev, SYS_OFF_MODE_POWER_OFF,
+					      SYS_OFF_PRIO_DEFAULT,
+					      bcm2835_power_off, wdt);
 
 	dev_info(dev, "Broadcom BCM2835 watchdog timer");
 	return 0;
 }
 
-static void bcm2835_wdt_remove(struct platform_device *pdev)
-{
-	if (pm_power_off == bcm2835_power_off)
-		pm_power_off = NULL;
-}
-
 static struct platform_driver bcm2835_wdt_driver = {
 	.probe		= bcm2835_wdt_probe,
-	.remove		= bcm2835_wdt_remove,
 	.driver = {
 		.name =		"bcm2835-wdt",
 	},
-- 
2.39.2



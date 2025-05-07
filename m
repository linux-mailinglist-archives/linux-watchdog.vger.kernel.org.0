Return-Path: <linux-watchdog+bounces-3443-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79511AAD491
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 06:44:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1793B972F
	for <lists+linux-watchdog@lfdr.de>; Wed,  7 May 2025 04:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DF1DE2CF;
	Wed,  7 May 2025 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ICOKOapb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BD01DD88F;
	Wed,  7 May 2025 04:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746593037; cv=fail; b=ZgMK/CAEgPdsN29+KiGghq4Y2CqMX92+GRkWuxScen5lcrUuHYqiHkOIGPlOosgNnwASNZdiOlH91mhXh7lbFPVPkqDA0fMX1BwTGJZ1nt4edq/YbglOKlKxCLL+WpILKi4x/3Yur1qbYtpGOzHxg8Ov+mKGP6RxMwZrD57fz1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746593037; c=relaxed/simple;
	bh=paeVbPZyqIELFXAK7pg0JPi2Rvq+pMotd6EZFPnXNR8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M2Q5Hb3CWSz0PKxCxhGTtlorC9H6uEVl5FQdatCzBrdMHTUXeKFRXPvpliBKSll68N0KopJZLCq/+ZiTCG8AvLFl/Qlp29tQmE8hpujVIojWk5mq4MQraWpW0QPhAR1eGYfs+9Jz9JBpLPpLJ9XRIS4BboZERmm2gMjfurNzmtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ICOKOapb; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvqdkdwcja+saBHoh7iVR/tC5sN3wGuEmxVfzscvckqu3o76CePn/nF1mSkEvvezBlqGmmEYi4w34bYXLnRYaA5eNKE/DA9rpEL5B9g9uiMKIweQsNHknul3RQPgahImDsMgwd/FR/W5rHur15pCr6Lla7owlgJ+s1bznJS2vtYoTx9G3T+KP9CDi66dGAvADeavZmEHilwGY2pO2M7sI38ohotH2mqSFSrIfiBqxenGcRb35Oep0BIVdb/zXeO2xBLjSWcO3tIH6HajjwYkdMb3aNxHu5hLxJAzaOTdphu7SjNG6NJ445JQp5b2lXKd6wghdGaMdsc5gsp8NE3jpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZh1DUE5NrKLHSB3w/MacbpoonnbZG3UzdDYpkCt4dw=;
 b=M+jnAljmtj87DiHV3SpT/9IIin9Vi97NVBCy44o6aoYLbSLqtL1jidjfKFnhtDsLSJqBy5sH8snijrTWIvKWmvWJ3n3hQUx//Ff2kUBXIlfN+MO34mVYbGp83Rb5WgQKbbluqlyJsdfiYVX7uKyI+8XvSPsaEO9Bdb9yBepMpTQUVjNq1QVummDFCAqCSBS5zN9ZOX7F5WE9sfFeTwJnFnlYqO9RQ4KpmMGcIIOgQguTBVgRb5AMP1bOgS72A7feZKGoekY/Tl42WBMT9lahz5FVkPJX0TvGVEGC6ncqf44xiF5R7x1S0z0RDEJ0IXsn206yJbQNuFcrWPMUqkWjRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZh1DUE5NrKLHSB3w/MacbpoonnbZG3UzdDYpkCt4dw=;
 b=ICOKOapbI+DaQaTPpRXQ45+zKkDyIJJ88TX/F0zykCdfk5AYrflk6F3ePHhBsvxn58IriRaTaHUahkJMZ+l84osvlCEgJzJF655tYZuCMwlr2xl/i762ZqntXLTBFKs5MOCroCXwLMxBB25QQuxuD4HIHWTzU7KIW4uJXlgsF4mPoZ7YG1HwKc03cwytRk8pFUqEysum6q9uq7JxEAdMhha+T/WRoYgCHRZ2D+s1Li7vUyWs5VeRIBvhKb+fCIAAmheHZcOhp8DS3VpVNfI4gA5e0L6uvq7ND1UTZTEEhEwinqNpHlaxUPMzSmNaBBaAt2M34V+7Q2pPJmhW5xa7oA==
Received: from DM6PR10CA0007.namprd10.prod.outlook.com (2603:10b6:5:60::20) by
 CH3PR12MB8725.namprd12.prod.outlook.com (2603:10b6:610:170::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.35; Wed, 7 May
 2025 04:43:48 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::34) by DM6PR10CA0007.outlook.office365.com
 (2603:10b6:5:60::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Wed,
 7 May 2025 04:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Wed, 7 May 2025 04:43:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 6 May 2025
 21:43:44 -0700
Received: from robelin-Precision-3660.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 21:43:33 -0700
From: Robert Lin <robelin@nvidia.com>
To: <thierry.reding@gmail.com>, <daniel.lezcano@linaro.org>,
	<jonathanh@nvidia.com>, <tglx@linutronix.de>, <pohsuns@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<sumitg@nvidia.com>, <linux-watchdog@vger.kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>, Robert Lin
	<robelin@nvidia.com>
Subject: [PATCH v8 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
Date: Wed, 7 May 2025 12:43:09 +0800
Message-ID: <20250507044311.3751033-2-robelin@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507044311.3751033-1-robelin@nvidia.com>
References: <20250507044311.3751033-1-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|CH3PR12MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8c7036-92d8-4ceb-bc60-08dd8d21c1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lMGS/pkJzGKJHZ8HdAonCm1nvRHcwiPkGHmKWPmIvyox0WG4xxWZbpUEWIZV?=
 =?us-ascii?Q?xhFMtlPeqcV1chB+Nu0xR+W/d+NlWIQpbhsw6bVxr+wkYaUlmxLp2SonIJms?=
 =?us-ascii?Q?X5KfcFL2HhjlQYvpiAKpjWCTkKfAmHKAwATFICLQ1afJ6qM1H2XIJUAVGT7E?=
 =?us-ascii?Q?j4pA3OJ4XZIq/1w13JFhm+D0spzaEmAqBZ6D0rx/90muwhUcbFxcIWhnHjA7?=
 =?us-ascii?Q?+iqstiLV2QYGV/DF5krArqrIb8NEBxTz6YGgyW93LI4E0OMdrf5Q50yS1bcV?=
 =?us-ascii?Q?GyIpbius5rg3qqfvRXGmgxY7x1tts+LVyqTmlHbhcae+Fl6f5gbivZDvM4aF?=
 =?us-ascii?Q?8U0llft9/nEV/ZoWUNAc/eaDB31n1tM3dQoQyIR+IIeilyqH3AA5rzqF/fmv?=
 =?us-ascii?Q?JfagffF+WRoViRjFN6mLKDBJhx4oXCtZ7CkpHEBmhuNfpF+Xqd7k2jVgqruZ?=
 =?us-ascii?Q?Fq0vCJx55/JXsfxBkpIVx+rbEdPIqBu1qQq4f+uqLC+/8jakxCB9O+eMWMfl?=
 =?us-ascii?Q?0iis/37LYes5ZYJbnHeR7z/i1uYri7qPe/9kaUIG8cFQJMsdX9QbzcBhRI3j?=
 =?us-ascii?Q?yxs8lou0/zj/BSns6/oPzO5vnGztoQUKebi2F3zyEd5N0dCGI8c/9J60qFSo?=
 =?us-ascii?Q?5xZFeoqP+JyO2knuZOdL6FV5z4t9VQoyTfGGqMGa9Cn9SD/HmR2E8chI4rXW?=
 =?us-ascii?Q?hBOcrSMl0tMBmr2ackgJlBBbsxT6QRV0V0fIPXDu0/RyPHXGJCZeAt59wD76?=
 =?us-ascii?Q?RMI+TivUw1NWiBq0g+g4Dh3F3ALos81hKfnrsBsqKcxF52HqmodDpbA9FZr+?=
 =?us-ascii?Q?Fin8LxIQkXyIFMAyXKoD55PXCoSpT5fznq43CVHCmcMG5i7xWSYCefGMzJCY?=
 =?us-ascii?Q?aomJ8braFDJHw7MwbOTleKzxWJhoGQsKhN+P3XHJD+icBnB7IxeQLCdy6JE4?=
 =?us-ascii?Q?oAMDkh2VfYid5W1RfQmQ8HogTvLQbGD7Wvh31QloZyZSHxGKKZlS5G/sfTW6?=
 =?us-ascii?Q?QlMXKsIbLysa8RrV8f18cleslCb0V+lBGIvyONn270SQLZH/v81fF0H02ud/?=
 =?us-ascii?Q?hhIc2y/fOa1DBVeRXqrTflqycOgedPkJUylkOUpSPeatI3hlz0b6TlP8FEwO?=
 =?us-ascii?Q?NEUxr50bPnNoxIUdI4btCMQ9JrXu2X+9jutzO68QDvQSbX33lQYkCHgvYH/K?=
 =?us-ascii?Q?hW9QiWP9ycmt2rE0JpKSyArvKYzTTfV/UC0yd1zs3/BC9g2+8iFtxD37mf0t?=
 =?us-ascii?Q?fl6mw4xCgJDQ8xOmMLyuAWAjQZ3++oCyc2qb2b6QGTWxAax7eTP8PVYFp5c4?=
 =?us-ascii?Q?j9n8z9SQJHETHXctbXdWW0EZ+K1EEefxbi1dGe/lYYNVyshm8w5j+dqWCsuA?=
 =?us-ascii?Q?uTNO42iSb3t2SeebRQHP7q05+DDGrLujLg/6P9BQza2bY3rMYwDCSo1Pqyq2?=
 =?us-ascii?Q?8Veiq/kOJJCw+loa07WczhqK7wr1R7p001LCs8uP6xbGTszutS04Cf2AiTzb?=
 =?us-ascii?Q?78czIpGCKVm0jrszHdjdkFtNK2pyRgU1+stV?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 04:43:47.8302
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8c7036-92d8-4ceb-bc60-08dd8d21c1b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8725

From: Pohsun Su <pohsuns@nvidia.com>

This change adds support for WDIOC_GETTIMELEFT so userspace
programs can get the number of seconds before system reset by
the watchdog timer via ioctl.

Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
Signed-off-by: Robert Lin <robelin@nvidia.com>
---
 drivers/clocksource/timer-tegra186.c | 64 +++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index ea742889ee06..e3ea6110e6f5 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2019-2020 NVIDIA Corporation. All rights reserved.
+ * Copyright (c) 2019-2025 NVIDIA Corporation. All rights reserved.
  */
 
+#include <linux/bitfield.h>
 #include <linux/clocksource.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
@@ -30,6 +31,7 @@
 
 #define TMRSR 0x004
 #define  TMRSR_INTR_CLR BIT(30)
+#define  TMRSR_PCV GENMASK(28, 0)
 
 #define TMRCSSR 0x008
 #define  TMRCSSR_SRC_USEC (0 << 0)
@@ -46,6 +48,9 @@
 #define  WDTCR_TIMER_SOURCE_MASK 0xf
 #define  WDTCR_TIMER_SOURCE(x) ((x) & 0xf)
 
+#define WDTSR 0x004
+#define  WDTSR_CURRENT_EXPIRATION_COUNT GENMASK(14, 12)
+
 #define WDTCMDR 0x008
 #define  WDTCMDR_DISABLE_COUNTER BIT(1)
 #define  WDTCMDR_START_COUNTER BIT(0)
@@ -235,12 +240,69 @@ static int tegra186_wdt_set_timeout(struct watchdog_device *wdd,
 	return 0;
 }
 
+static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
+{
+	struct tegra186_wdt *wdt = to_tegra186_wdt(wdd);
+	u32 expiration, val;
+	u64 timeleft;
+
+	if (!watchdog_active(&wdt->base)) {
+		/* return zero if the watchdog timer is not activated. */
+		return 0;
+	}
+
+	/*
+	 * Reset occurs on the fifth expiration of the
+	 * watchdog timer and so when the watchdog timer is configured,
+	 * the actual value programmed into the counter is 1/5 of the
+	 * timeout value. Once the counter reaches 0, expiration count
+	 * will be increased by 1 and the down counter restarts.
+	 * Hence to get the time left before system reset we must
+	 * combine 2 parts:
+	 * 1. value of the current down counter
+	 * 2. (number of counter expirations remaining) * (timeout/5)
+	 */
+
+	/* Get the current number of counter expirations. Should be a
+	 * value between 0 and 4
+	 */
+	val = readl_relaxed(wdt->regs + WDTSR);
+	expiration = FIELD_GET(WDTSR_CURRENT_EXPIRATION_COUNT, val);
+	if (WARN_ON_ONCE(expiration > 4))
+		return 0;
+
+	/* Get the current counter value in microsecond. */
+	val = readl_relaxed(wdt->tmr->regs + TMRSR);
+	timeleft = FIELD_GET(TMRSR_PCV, val);
+
+	/*
+	 * Calculate the time remaining by adding the time for the
+	 * counter value to the time of the counter expirations that
+	 * remain.
+	 */
+	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
+
+	/*
+	 * Convert the current counter value to seconds,
+	 * rounding up to the nearest second. Cast u64 to
+	 * u32 under the assumption that no overflow happens
+	 * when coverting to seconds.
+	 */
+	timeleft = DIV_ROUND_CLOSEST_ULL(timeleft, USEC_PER_SEC);
+
+	if (WARN_ON_ONCE(timeleft > U32_MAX))
+		return U32_MAX;
+
+	return lower_32_bits(timeleft);
+}
+
 static const struct watchdog_ops tegra186_wdt_ops = {
 	.owner = THIS_MODULE,
 	.start = tegra186_wdt_start,
 	.stop = tegra186_wdt_stop,
 	.ping = tegra186_wdt_ping,
 	.set_timeout = tegra186_wdt_set_timeout,
+	.get_timeleft = tegra186_wdt_get_timeleft,
 };
 
 static struct tegra186_wdt *tegra186_wdt_create(struct tegra186_timer *tegra,
-- 
2.34.1



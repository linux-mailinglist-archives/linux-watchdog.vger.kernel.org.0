Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D004445B0
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Nov 2021 17:15:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232850AbhKCQSW (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 3 Nov 2021 12:18:22 -0400
Received: from mail-bn8nam12on2068.outbound.protection.outlook.com ([40.107.237.68]:62561
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232847AbhKCQSV (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 3 Nov 2021 12:18:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJIMQIrKs2qq0yGRX6aHG/jT7dXHBur7/6tisp99NIobUO9kZD5QTFAUbnuEw9pr6qJPtmIIEi3yN4p7BQDW7hwMiABr9IMlps07jdAF1qBq3LJ4nLtvJhftdXXQ3jEXR3YBtafIQ52F9Rmpeg8sQ6Ix9B10YMEvFcrdqnh3aGeGgtTOk+mV+o+2ZqWeTTHmEkNEx/tNFJJT6tLigdXkU9MUR8VbLsEov2g55DSwD1QuYnHKtdGpwofz/Dxl0LLTtJlAdrU8y43GgI6aXHyg6mcyElIKS8kDvggliu4iEgR/u17jjSK+ar4QGz+mSq8lZ3V/mGd7YGkEZqRhYTAryw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhfA+s57zW+JgAMxckxusLSyI7ttYwjj3zsqRQmLEzE=;
 b=izm/zDgzRlHVEqBBc7ro1ERPDeHnilfn3DAR099uhRzlJpRY4lbn/nfBK4YJt7ysh12H0uqEmXLxjwPm3e46QBDiIEjbuoXCBmTwly6GbbVE57/ztnnT5BHRy/X8AHaiVFrGjTlZ/2IoBhrB2wctLyF7FIG9hhz6aGqVv0YSh5CJydAQjFBbvX9zQXpucUKN3uREuTLhvt+9sE8QtGXQaU+pOHbwQX+U10S1j38gdmvjAziwsbBfFrSNXo9ohyIRUnYrZZKhWx6FK3KsZksqTzyGtHGCQL2gZ6mR9D2SgfPgtlKr3BF66y88jZ6j+AHFNgxYtGB2P9AnBoOe+Td+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhfA+s57zW+JgAMxckxusLSyI7ttYwjj3zsqRQmLEzE=;
 b=QTEYqKLJobnGY+L3Ra8rnOOSLdtksbxj6OMWgR+XeechU/HNr1l9almlgZhAPFOj9N409U6uEWgMJQ/rQ2ITGKRAdbklkmxniIG35HPmgT+I9DO0leJUEVtVz4Eox6txujRaqvDKElb/091hn5Vh28y5aVyCrOZUKV10ZyEEI5w=
Received: from MW4PR04CA0188.namprd04.prod.outlook.com (2603:10b6:303:86::13)
 by BN6PR12MB1636.namprd12.prod.outlook.com (2603:10b6:405:6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Wed, 3 Nov
 2021 16:15:42 +0000
Received: from CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::49) by MW4PR04CA0188.outlook.office365.com
 (2603:10b6:303:86::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 16:15:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT037.mail.protection.outlook.com (10.13.174.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4669.10 via Frontend Transport; Wed, 3 Nov 2021 16:15:41 +0000
Received: from ethanolxb27ehost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Wed, 3 Nov
 2021 11:15:40 -0500
From:   Terry Bowman <terry.bowman@amd.com>
To:     <linux-watchdog@vger.kernel.org>
CC:     <terry.bowman@amd.com>, <rrichter@amd.com>,
        <linux-kernel@vger.kernel.org>, <wim@linux-watchdog.org>,
        <linux@roeck-us.net>, <ssg.sos.patches@amd.com>,
        <sudheesh.mavila@amd.com>
Subject: [PATCH v2 1/4] Watchdog: sp5100_tco: Move timer initialization into function
Date:   Wed, 3 Nov 2021 11:15:18 -0500
Message-ID: <20211103161521.43447-2-terry.bowman@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103161521.43447-1-terry.bowman@amd.com>
References: <20211103161521.43447-1-terry.bowman@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aec83cae-0efe-4628-d52d-08d99ee52ed9
X-MS-TrafficTypeDiagnostic: BN6PR12MB1636:
X-Microsoft-Antispam-PRVS: <BN6PR12MB163646426BA945C15FC3F763838C9@BN6PR12MB1636.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fjTptjoy2Zp0S6Db04yHqKDUwqp+eUKj4qV3ilLllt4tqCETz9Xx0wdZUSnylXWgAEujlAjONbCHRPMlEus0GxBcLatEZ62D8hdSR829EItNTHvHfpXrpofPvwNxx2Wcw9X19XSltiOeRrf7F2tCa2pD7foE3lY2CQp0WOJZk1IpvJ/l/o7QLyfj6fCL3ioJMBduW1o9H/yaESKY7P/WGf+WptG/1JiBgnXRnl+nmGvAWuN8WO0SYCtDbybx1C0pWuUnKenI3FjdcBLZDHr33FPdApBe6N47n3Z/KMdnbvJlQYNbnWy4pQOeuVxXSQaePFPQozdYdPdCvAa5gxsq8eQHZTWctMRZsXxWIN3HnRM4lrjZn7Bj15zlb5FgZRhtD73h5PKq4CZMSjb4PmiJ3J6ojJ5Q21XyNva18N0rPQZA486isG6vCR7rjrwIk0gjH0oZnOQk81lU7WxaU6+U4ZOBySnbJuvFvdoLtq3qLUesZjgx45osBx1Nlgw1I5zlGD87JXhuIWRJ77fQe2sAOQByNMVVQ4kUx2eyBVH96rdYrq9VLwWm6wzr/7OtpWYoLE7tQwvWp8LCfYnOtLkZHLXT9+D8NBnnRtwdU0DNIVY/4BBrXmoLN3kJeU4871SOu7RW5C1qpV7O4Uhya8NAgus3RK0OhIP7A/xiOf5NEA2bUCrex1ILVbZOdMBWb/RnxCWZTRFYaZfbUDplM3yfO0pfTUj4R24lqyKiWKmlDNU=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(8676002)(8936002)(26005)(86362001)(1076003)(70206006)(82310400003)(70586007)(83380400001)(186003)(6916009)(7696005)(16526019)(54906003)(6666004)(36756003)(508600001)(356005)(81166007)(4326008)(36860700001)(426003)(336012)(316002)(2906002)(2616005)(47076005)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:15:41.8703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aec83cae-0efe-4628-d52d-08d99ee52ed9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1636
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Refactor watchdog timer initialization by moving into new function.

Co-developed-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Robert Richter <rrichter@amd.com>
Signed-off-by: Terry Bowman <terry.bowman@amd.com>
To: linux-watchdog@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Robert Richter <rrichter@amd.com>
---
 drivers/watchdog/sp5100_tco.c | 71 +++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
index a730ecbf78cd..f5e845c3ecea 100644
--- a/drivers/watchdog/sp5100_tco.c
+++ b/drivers/watchdog/sp5100_tco.c
@@ -215,6 +215,44 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
 	return val;
 }
 
+static int sp5100_tco_timer_init(struct sp5100_tco *tco)
+{
+	struct watchdog_device *wdd = &tco->wdd;
+	struct device *dev = wdd->parent;
+	u32 val;
+
+	/* Setup the watchdog timer */
+	tco_timer_enable(tco);
+
+	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
+	if (val & SP5100_WDT_DISABLED) {
+		dev_err(dev, "Watchdog hardware is disabled\n");
+		return(-ENODEV);
+	}
+
+	/*
+	 * Save WatchDogFired status, because WatchDogFired flag is
+	 * cleared here.
+	 */
+	if (val & SP5100_WDT_FIRED)
+		wdd->bootstatus = WDIOF_CARDRESET;
+
+	/* Set watchdog action to reset the system */
+	val &= ~SP5100_WDT_ACTION_RESET;
+	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
+
+	/* Set a reasonable heartbeat before we stop the timer */
+	tco_timer_set_timeout(wdd, wdd->timeout);
+
+	/*
+	 * Stop the TCO before we change anything so we don't race with
+	 * a zeroed timer.
+	 */
+	tco_timer_stop(wdd);
+
+	return 0;
+}
+
 static int sp5100_tco_setupdevice(struct device *dev,
 				  struct watchdog_device *wdd)
 {
@@ -337,38 +375,7 @@ static int sp5100_tco_setupdevice(struct device *dev,
 
 	dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
 
-	/* Setup the watchdog timer */
-	tco_timer_enable(tco);
-
-	val = readl(SP5100_WDT_CONTROL(tco->tcobase));
-	if (val & SP5100_WDT_DISABLED) {
-		dev_err(dev, "Watchdog hardware is disabled\n");
-		ret = -ENODEV;
-		goto unreg_region;
-	}
-
-	/*
-	 * Save WatchDogFired status, because WatchDogFired flag is
-	 * cleared here.
-	 */
-	if (val & SP5100_WDT_FIRED)
-		wdd->bootstatus = WDIOF_CARDRESET;
-	/* Set watchdog action to reset the system */
-	val &= ~SP5100_WDT_ACTION_RESET;
-	writel(val, SP5100_WDT_CONTROL(tco->tcobase));
-
-	/* Set a reasonable heartbeat before we stop the timer */
-	tco_timer_set_timeout(wdd, wdd->timeout);
-
-	/*
-	 * Stop the TCO before we change anything so we don't race with
-	 * a zeroed timer.
-	 */
-	tco_timer_stop(wdd);
-
-	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
-
-	return 0;
+	ret = sp5100_tco_timer_init(tco);
 
 unreg_region:
 	release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
-- 
2.25.1


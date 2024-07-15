Return-Path: <linux-watchdog+bounces-1379-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9F930DA4
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 07:35:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 408191C208D0
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Jul 2024 05:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363321386C0;
	Mon, 15 Jul 2024 05:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="v0z+Zfuw"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5987953364;
	Mon, 15 Jul 2024 05:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721021753; cv=fail; b=UKnvariCJHlFS2x+kiscJB7/CrQknJtOnpP095g6NF5JSylb4OQ7h/OyZVbMF01QZoRNAy37+ufrU1zUCIwzrb7zB1/huZEvCHibioCoc1cHkJrj0vinmeKFOPHlB0ie7Vwgn1upDpu/gocauK0UvQNQ8qPVyWARiIZ46rrEiIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721021753; c=relaxed/simple;
	bh=ZHbSRmpwTC2dVU7BOst+ycc2kPdvRbOh8fkdwL92lYM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZGDNpZdSXxaUU6HBNQN4f08WpkXwN52HJLq/nU7Airy+iy2xIq2jaWqoMtYgHeH4tFA1szDFyYydro87oPmSHe8lYj03BPBknUFFuPQmg5oeBw4jtRRW7y1q5IzSo2AA/qOl0nDwgZa9Vbr8hDsU5B2D3TsCRPvCdPFwi6kD0GM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=v0z+Zfuw; arc=fail smtp.client-ip=40.107.92.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GzwmaZGtJfyKFvjH2JlsC+pLoJn2lVQfbquwCg1vx3DGfmqHPrEzH9p71ueDrfp9FSLN/49tXSzeON0FgGqoL7RaWN7BD+n+PmOWI52Vob0v5ueyv2LxCXRaxABJmHeCaPRcF65Jwjc7O2Ow4wX4UmuR2DJmzJz7nDg90LVdTQQsYEk5y1HsF0wk0f2fGvc+/Jptn5b1Aia1e8Iz36WgvOQ2kLAeqXE8emO8fri/m3pORGNBKUKn0P1pxR1wKS+NL8kVoYLAm9xgmQxzbeKTNSeGjMM6JWnYodqYVwABH3QbdoIGDNVin4DPF3UZivWnuLLiR8Pty5wPFkTR1PxE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3zhTAPOv7T9oe+ibVrIjEiHXwK9d+5yi8cogtgkDlQ=;
 b=XesyC5hvAp5fP7nXULMUthPoSHocAtK/a5tTuGlZ/e+9MKAl+XfwF6evf5jeTYod0D/y3oUxUn66XKi0zQvc0zlgBFufji+My6Ja/70X6RTdUmbFdiqqWnyiYFn9fKlErg+2xuAUVyJpojw7oQyD2xJZlVbh5u4gZTDWWHP/HLC1ActgNdLnhH4H1sHJz0m2Dtl8Tw6SJiF1uKfNmwkBSUZfiROJm+VslOpKMKMSph5aqsLWTOvByyFlNcmYQfdbXWcFxV6nuI6hDhOkwypyq4dUNibQNYwq9PjMjnNoghl+xGxgaVSDlefXgH3RbdLlg2kOxGs0cLK0fD1Ql7A25g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W3zhTAPOv7T9oe+ibVrIjEiHXwK9d+5yi8cogtgkDlQ=;
 b=v0z+Zfuwom/Pr2Q9pC0J7CsO/2DlpI2L4g8p9bC4R2UG4waspo7Sykb03FLMJs+Gn0aKn1jv9uAcsgnjjZm1OlfimygODejy2oCo0epaXGr7IDP3jFzIGG8HLxGF3Ktqc6uHrar7LF4efXIsOqSjHo04fjfjUd3oJmqUJ9P7AyI=
Received: from BYAPR01CA0005.prod.exchangelabs.com (2603:10b6:a02:80::18) by
 CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.20; Mon, 15 Jul 2024 05:35:47 +0000
Received: from CO1PEPF000044F2.namprd05.prod.outlook.com
 (2603:10b6:a02:80:cafe::ca) by BYAPR01CA0005.outlook.office365.com
 (2603:10b6:a02:80::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Mon, 15 Jul 2024 05:35:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044F2.mail.protection.outlook.com (10.167.241.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Mon, 15 Jul 2024 05:35:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Jul
 2024 00:35:45 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 15 Jul 2024 00:35:43 -0500
From: Harini T <harini.t@amd.com>
To: <linux@roeck-us.net>, <michal.simek@amd.com>, <srinivas.neeli@amd.com>,
	<shubhrajyoti.datta@amd.com>
CC: <srinivas.goud@amd.com>, <wim@linux-watchdog.org>,
	<linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <git@amd.com>, Harini T <harini.t@amd.com>
Subject: [PATCH V2] watchdog: xilinx_wwdt: Calculate max_hw_heartbeat_ms using clock frequency
Date: Mon, 15 Jul 2024 11:05:37 +0530
Message-ID: <20240715053537.290064-1-harini.t@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harini.t@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F2:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: a05da921-a786-475f-54ce-08dca48ffab4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GU+RKNXKlgwc6KRz1urNvwS+UZkfysyX6VwqQjT5LTkjc68tZFabxohwjlte?=
 =?us-ascii?Q?KnTlRQdgw53b0Ne3nvqDKfZLHhXzf/ahvIGE6kK4iXTTbgCflArQ9du6i4fc?=
 =?us-ascii?Q?j0iDUD8kMeN1/UqSf5tT2HotN5GLw83C8/kkcg3Rq1h0oHqa2KsA2Ko8+FXC?=
 =?us-ascii?Q?otYE8HpqfXDsFdhumJW6RGq/OY7clW/SPPv5mByeN272HiFpMhoqjwGOZAh5?=
 =?us-ascii?Q?6esL02U3lOvkcfevRVEIOJ+F7hPJV+Us23xtKPyGZvVMOB09Ea+ILQ9AJidd?=
 =?us-ascii?Q?2LgOJhgu5FI04N9JAKB0S7/pyAIkDu7JDnWdga3pee/w8LdYxc1p+gKyZglD?=
 =?us-ascii?Q?FUhT59fnjllM1wIb8dun2SZ/3K2riHESz7LsKkjnyhSnyXhS32T0HtPT2QNx?=
 =?us-ascii?Q?SlwTJWW/lW2XZMD9DSG6PHPa+P7gzCNvd7faVRhiMJxPD4dW6IUYMllxFf0A?=
 =?us-ascii?Q?s+7dB/PXf808Z5pT34NgYj0wRHLxFdziHVBZ7N6rJYvHqZX0C03sUIIDiHWv?=
 =?us-ascii?Q?6Vm6GOVwORvT2fbH9Cphg3TB77OKUoRXTpLDHyliMRIJPfgbsxATKvIx5r9q?=
 =?us-ascii?Q?bseOs+neVDCoBkFoLN9ylEIrzXdsIxq9NJLmEpI32Tb3yNRFHbTd/BNA0BqA?=
 =?us-ascii?Q?+XyIENBOiOkShc2glTumC10EmgQ0nrzONyDqy6SobiPNCJl/awdoIycM6SKW?=
 =?us-ascii?Q?K4uLKNEH/eD3MnVO7Ete7+kPE3SyslnqgBGgPIr03pgZrIQKlgP17/DnyzFb?=
 =?us-ascii?Q?avqsXgsUlXvaCCDBJyKDM29T3wvmxhPjP89ORdurHBknVrE76ekg5yOG7Max?=
 =?us-ascii?Q?UYANtAInht/ARC7L2+dvsiQX9U0U10V6KasoK9BflMPXIAlfy3ExHF7zSMJd?=
 =?us-ascii?Q?oGyJhQ7XZS2krCM8s5m5A6xqi5U47Auo6PhMAJpNOo7mwzfkuzDRkibbfUyG?=
 =?us-ascii?Q?U2OjLHZDxavnzId5uY5k07c4N/XjRre6O/Rjt5pY+cg+89bz4rr/1MJgIuTw?=
 =?us-ascii?Q?38OH3td19YjCRenEzWlJJr3C65T0OIYDpcWyigJ6Rk8d3UMlZl2cb8YnfzY6?=
 =?us-ascii?Q?UBRC+ZCCD9yRUbVnIbOOm0K7Ag+i2lQQApXB6f9J6fx8Q4aPkndZXG544cTv?=
 =?us-ascii?Q?7lzP9Cuc36yni2b9uOt0KJ+yZPbDq7xdPm6NLJIAUoqG+nXTt0IgfdaTq9qn?=
 =?us-ascii?Q?Wc+LpoPLkQsrWzopWNEXUPt9gWWK/0KjmyqM1DmiBkFBkXIo88RA6BWM2aJm?=
 =?us-ascii?Q?A/S8FICSRerISUoSXHRS8XDMWp78cQmUN62CPjbIgQ8CYh2pM/PLiUpaMuig?=
 =?us-ascii?Q?OL7CR0LQv4IGHSDdSyN+VvVzx0/jCj9dk3875M3YrD13zs9tCnCRop14pEp/?=
 =?us-ascii?Q?qrrptPPL5YXHuy/LwDF1n6ZNMui+bLu93F3tviXK4hFrOSl5dg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2024 05:35:47.1606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a05da921-a786-475f-54ce-08dca48ffab4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434

In the current implementation, the value of max_hw_heartbeat_ms is set
to the timeout period expressed in milliseconds and fails to verify if
the close window percentage exceeds the maximum value that the hardware
supports.

1. Calculate max_hw_heartbeat_ms based on input clock frequency.
2. Limit the close and open window percent to hardware supported value
to avoid truncation.
3. If the user input timeout exceeds the maximum timeout supported,
use only open window and the framework supports the higher timeouts.

Fixes: 12984cea1b8c ("watchdog: xilinx_wwdt: Add Versal window watchdog support")

Signed-off-by: Harini T <harini.t@amd.com>
---

Changes in V2:
- Modify the implementation to make the timeout independent of the
  maximum hardware timeout as the framework supports it.
- Modify the implementation to obtain ticks from milliseconds instead of
  ticks from seconds to avoid the minor time difference between hardware
  and software.
- Limit the close and open window percentage to hardware supported value
  to avoid truncation.
- If the timeout exceeds the maximum timeout supported, use only open
  window and set the min_hw_heartbeat_ms to zero.
- Modify the commit title and description.
- Add Fixes tag in commit description.

V1 link: https://lore.kernel.org/all/20240319111219.21094-1-harini.t@amd.com/

---
 drivers/watchdog/xilinx_wwdt.c | 70 +++++++++++++++++++++++++++++-----
 1 file changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/watchdog/xilinx_wwdt.c b/drivers/watchdog/xilinx_wwdt.c
index d271e2e8d6e2..94a8a0275cd8 100644
--- a/drivers/watchdog/xilinx_wwdt.c
+++ b/drivers/watchdog/xilinx_wwdt.c
@@ -36,6 +36,12 @@
 
 #define XWWDT_CLOSE_WINDOW_PERCENT	50
 
+/* Maximum count value of each 32 bit window */
+#define XWWDT_MAX_COUNT_WINDOW		GENMASK(31, 0)
+
+/* Maximum count value of closed and open window combined */
+#define XWWDT_MAX_COUNT_WINDOW_COMBINED	GENMASK_ULL(32, 1)
+
 static int wwdt_timeout;
 static int closed_window_percent;
 
@@ -54,6 +60,8 @@ MODULE_PARM_DESC(closed_window_percent,
  * @xilinx_wwdt_wdd: watchdog device structure
  * @freq: source clock frequency of WWDT
  * @close_percent: Closed window percent
+ * @closed_timeout: Closed window timeout in ticks
+ * @open_timeout: Open window timeout in ticks
  */
 struct xwwdt_device {
 	void __iomem *base;
@@ -61,27 +69,22 @@ struct xwwdt_device {
 	struct watchdog_device xilinx_wwdt_wdd;
 	unsigned long freq;
 	u32 close_percent;
+	u64 closed_timeout;
+	u64 open_timeout;
 };
 
 static int xilinx_wwdt_start(struct watchdog_device *wdd)
 {
 	struct xwwdt_device *xdev = watchdog_get_drvdata(wdd);
 	struct watchdog_device *xilinx_wwdt_wdd = &xdev->xilinx_wwdt_wdd;
-	u64 time_out, closed_timeout, open_timeout;
 	u32 control_status_reg;
 
-	/* Calculate timeout count */
-	time_out = xdev->freq * wdd->timeout;
-	closed_timeout = div_u64(time_out * xdev->close_percent, 100);
-	open_timeout = time_out - closed_timeout;
-	wdd->min_hw_heartbeat_ms = xdev->close_percent * 10 * wdd->timeout;
-
 	spin_lock(&xdev->spinlock);
 
 	iowrite32(XWWDT_MWR_MASK, xdev->base + XWWDT_MWR_OFFSET);
 	iowrite32(~(u32)XWWDT_ESR_WEN_MASK, xdev->base + XWWDT_ESR_OFFSET);
-	iowrite32((u32)closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
-	iowrite32((u32)open_timeout, xdev->base + XWWDT_SWR_OFFSET);
+	iowrite32((u32)xdev->closed_timeout, xdev->base + XWWDT_FWR_OFFSET);
+	iowrite32((u32)xdev->open_timeout, xdev->base + XWWDT_SWR_OFFSET);
 
 	/* Enable the window watchdog timer */
 	control_status_reg = ioread32(xdev->base + XWWDT_ESR_OFFSET);
@@ -133,7 +136,12 @@ static int xwwdt_probe(struct platform_device *pdev)
 	struct watchdog_device *xilinx_wwdt_wdd;
 	struct device *dev = &pdev->dev;
 	struct xwwdt_device *xdev;
+	u64 max_per_window_ms;
+	u64 min_per_window_ms;
+	u64 timeout_count;
 	struct clk *clk;
+	u64 timeout_ms;
+	u64 ms_count;
 	int ret;
 
 	xdev = devm_kzalloc(dev, sizeof(*xdev), GFP_KERNEL);
@@ -159,7 +167,8 @@ static int xwwdt_probe(struct platform_device *pdev)
 
 	xilinx_wwdt_wdd->min_timeout = XWWDT_MIN_TIMEOUT;
 	xilinx_wwdt_wdd->timeout = XWWDT_DEFAULT_TIMEOUT;
-	xilinx_wwdt_wdd->max_hw_heartbeat_ms = 1000 * xilinx_wwdt_wdd->timeout;
+	xilinx_wwdt_wdd->max_hw_heartbeat_ms =
+		div64_u64(XWWDT_MAX_COUNT_WINDOW_COMBINED, xdev->freq) * 1000;
 
 	if (closed_window_percent == 0 || closed_window_percent >= 100)
 		xdev->close_percent = XWWDT_CLOSE_WINDOW_PERCENT;
@@ -167,6 +176,47 @@ static int xwwdt_probe(struct platform_device *pdev)
 		xdev->close_percent = closed_window_percent;
 
 	watchdog_init_timeout(xilinx_wwdt_wdd, wwdt_timeout, &pdev->dev);
+
+	/* Calculate ticks for 1 milli-second */
+	ms_count = div64_u64(xdev->freq, 1000);
+	timeout_ms = xilinx_wwdt_wdd->timeout * 1000;
+	timeout_count = timeout_ms * ms_count;
+
+	if (timeout_ms > xilinx_wwdt_wdd->max_hw_heartbeat_ms) {
+		/* To avoid ping restrictions until the minimum hardware heartbeat,
+		 * we will solely rely on the open window and
+		 * adjust the minimum hardware heartbeat to 0.
+		 */
+		xdev->closed_timeout = 0;
+		xdev->open_timeout = XWWDT_MAX_COUNT_WINDOW;
+		xilinx_wwdt_wdd->min_hw_heartbeat_ms = 0;
+		xilinx_wwdt_wdd->max_hw_heartbeat_ms = xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2;
+	} else {
+		xdev->closed_timeout  = div64_u64(timeout_count * xdev->close_percent, 100);
+		xilinx_wwdt_wdd->min_hw_heartbeat_ms =
+			div64_u64(timeout_ms * xdev->close_percent, 100);
+
+		if (timeout_ms > xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2) {
+			max_per_window_ms = xilinx_wwdt_wdd->max_hw_heartbeat_ms / 2;
+			min_per_window_ms = timeout_ms - max_per_window_ms;
+
+			if (xilinx_wwdt_wdd->min_hw_heartbeat_ms > max_per_window_ms) {
+				dev_info(xilinx_wwdt_wdd->parent,
+					 "Closed window cannot be set to %d%%. Using maximum supported value.\n",
+					xdev->close_percent);
+				xdev->closed_timeout = max_per_window_ms * ms_count;
+				xilinx_wwdt_wdd->min_hw_heartbeat_ms = max_per_window_ms;
+			} else if (xilinx_wwdt_wdd->min_hw_heartbeat_ms < min_per_window_ms) {
+				dev_info(xilinx_wwdt_wdd->parent,
+					 "Closed window cannot be set to %d%%. Using minimum supported value.\n",
+					xdev->close_percent);
+				xdev->closed_timeout = min_per_window_ms * ms_count;
+				xilinx_wwdt_wdd->min_hw_heartbeat_ms = min_per_window_ms;
+			}
+		}
+		xdev->open_timeout = timeout_count - xdev->closed_timeout;
+	}
+
 	spin_lock_init(&xdev->spinlock);
 	watchdog_set_drvdata(xilinx_wwdt_wdd, xdev);
 	watchdog_set_nowayout(xilinx_wwdt_wdd, 1);
-- 
2.25.1



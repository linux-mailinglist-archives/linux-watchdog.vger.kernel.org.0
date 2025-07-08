Return-Path: <linux-watchdog+bounces-3846-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D998EAFDBE3
	for <lists+linux-watchdog@lfdr.de>; Wed,  9 Jul 2025 01:35:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 218B356704F
	for <lists+linux-watchdog@lfdr.de>; Tue,  8 Jul 2025 23:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4667322D9E6;
	Tue,  8 Jul 2025 23:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="PaChChSl"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AEA721D3E1;
	Tue,  8 Jul 2025 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752017708; cv=fail; b=dJa6t0U5eOA62M4S7b58zXAQhVFtKZiz8TXyA8ssLDLkngD1sgdTLxAA2r7n9Vw/SQFs78C9G8vYFFm/0wOqK/eD5vctpCpU4Pl8aZUraS0R7A7G7yvyuKlGPNh1B0WXe+Az9O9I2IWNiFuHRBgnKgJGZhdS+Gcx70dj7N6GsH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752017708; c=relaxed/simple;
	bh=PuJ/h4Q0sYBXWIJ2cGfzgTCK5gEmhWopr8+4Y87CPu0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=c0f1Sj2S+vKKulLSW/2q80xIR7ctEfNP7SSu3Iv3uF5KWQeU+wBzgRIdZUeR3J51An+vE0bgx0Hmr+NImoUMPuW8FeYYcvjgda1MA8PGNO6JpIriYBbvwB1TErhiEkQKDDg8f6Ud5dTiGD9U+meBrZGh9U1xsnjSGMbkF5It5Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=PaChChSl; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wo4wLs1WETQMxuTI5oqb3Yck9Pf/P5bvFSneyjVr6gjegsVDV+6Oh6jhjr4mts2vvmTE0/kwXhRgIQHTvG8SiBDWc0P78fWzzEUy5X2LUJ7i/41uKijdzcho+EvbTZHjtz4yGh/sscRJ0FLN7p1BvUHt/cUOMqw2kbnTzoVEp1V+bR+/EgKP07uLqPXIOBQVXwHWq+ptLHyH+EN4nWafgx18GZns9LGtpZOFbI9612d2A9HqGNjUWYxgaHZXXMwX+e00KmQmcxSJHnisBSpgjuHMfJli8fCh7ImY0fa1H7ErMRlBHjo2OjvploMU2ROHFuivJtgx1yFx1X9PzajZ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29omWAJBRw+ThXe98QXxew2Aga5gnrYyG8qwg4CXcCQ=;
 b=pCjIn0AHNYKx67t4X4SqzWp8PiyRLgfWr4BPnmLdZ/sJTR2uOrl+LxxwkaZgVGnalTqrPCuPQcg/1JImm3chCKIHf+ZkhkW2/lNMXidB+gwKp+Av+L4WHhXd6DX+pTNNb2NWStVrOzAjN8pJQg93sLXggg8z2VI6JhZAP/ifzk4NFLzkqIXRiMk6oCv/TDbtRe5qMgG/0zOhbUyWsTqvE7O1UYE4yW7erCH+vwSkKmJsX7uytHnTA0nqF+1XRcb+zPfC5Jpn9I/wiw5U2q1qnDUjrlemRiEWoBPFohdMfAXUx1O74mNK/jPexK6XzxMKrF+hqwcNaRZfOgxf0kIbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=linux-watchdog.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29omWAJBRw+ThXe98QXxew2Aga5gnrYyG8qwg4CXcCQ=;
 b=PaChChSlUunCSs0zZvUrFURzE07EU8OTIVB9/BwYmFGmbLnCx6JzphG73eGfgZuZ2pnj4cCn9IHiRM1mxjVfmQoRx2NEGXW8aowj01JejoA3Dp3ygFB3RcYlo30O4PbzH2gPDIUdeeNmTHfvMeOlJbeJBnXUXCZK8/W39b0dnUsIxEbznaaaub2kpVts4IauMHT2gcwjwH5fWuUEXa+yU4SZpwVyo031AmLFLeJC5EtziIhNDURnniSU0orxcyLxUWaa83a4B0PXIjIze+fte1MdYfiW26pVgZFUcyQOy0Nih+BMdJI22WRXJPb6DhxqocZGowWVkPNknPorxzviZg==
Received: from DM6PR03CA0025.namprd03.prod.outlook.com (2603:10b6:5:40::38) by
 SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 23:35:01 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:5:40:cafe::1) by DM6PR03CA0025.outlook.office365.com
 (2603:10b6:5:40::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 23:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 23:35:00 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 8 Jul 2025
 16:34:56 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Jul 2025 16:34:55 -0700
Received: from treble.plattner.fun (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 8 Jul 2025 16:34:55 -0700
From: Aaron Plattner <aplattner@nvidia.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>
CC: Aaron Plattner <aplattner@nvidia.com>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Timur Tabi <ttabi@nvidia.com>
Subject: [PATCH] watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
Date: Tue, 8 Jul 2025 16:33:51 -0700
Message-ID: <20250708233354.1551268-1-aplattner@nvidia.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: 68913076-b465-401f-af27-08ddbe780ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lKyMAxVHBCjkAC9EGC4Uypb7mU9eTrDhuwJrYjsApCZrNpuQdHF45L37gzve?=
 =?us-ascii?Q?MxpP4lnQw9SDGNpmajL9MTVu4OFvBu4YwArbSn6epmqRmPXPVyT3FZYivIYz?=
 =?us-ascii?Q?p3Qi+z3zyCODYO54Pfe2EBmZXIaa0eP0UcAeKOw7MxWFGJp8sMvf6V7GzJ5/?=
 =?us-ascii?Q?mwlgUYaDQFbAPoV3JhJ2RyYhA4h8QkkRMiFkZ4ZCb5hohbmrKOWxmKGAjPs2?=
 =?us-ascii?Q?2+ByOpAqQWJeATnKjC13LrPAq4mcixkHUd+/cgcGURD7IqoeOt9qgDGrQjW0?=
 =?us-ascii?Q?foVPgGXhq3gjmCtK/2Bz7xtqyh3R0yUqiWAWXrWP2wxYLaswwn71nVT530AS?=
 =?us-ascii?Q?Kts8/Qy+xWwCI6X2wLMHfVjRn6wrRAz39RnEBv7CtIvLmZcEYAV0VMSdIYXU?=
 =?us-ascii?Q?rvtxLSrzj2fIejxqosQYvSub4zKmKZ0UpMCXyYAh5nx0H+65WtAUuSk3W6kW?=
 =?us-ascii?Q?0MrgeVz8S7GkC8oWKMcolk5LDXpUcJoGLQ3yyrQNvgPo/uGNY651l27ffinz?=
 =?us-ascii?Q?wYHIarUN46bqmj2rNI92t3imuMTInIsfMINHp5h/hMC3hFW+SxvlmbfQnXpx?=
 =?us-ascii?Q?vrhVDiA/d8bAt1rKyXutrDiCdeFkBLwGEQ54SxLHTfgZEM101gDxkE9db+3E?=
 =?us-ascii?Q?TuOPQXdIzuUSYhJB0XFpj3cHYWR1y6WBPd5zzdFf3UXxpGD4IHHZCSPLdfCA?=
 =?us-ascii?Q?49sLfyuD6Ni6H25hc3zKRtpvXzqZMlw1eONQvc3P/AUNbHFLlYC57nIvbKXe?=
 =?us-ascii?Q?pe9Md6YwQvpzzhh2fTP6iA4Gb/DwLVEk/zfydFLclkhTDo4OeyOgR2m/b66P?=
 =?us-ascii?Q?oOBd/YV8S7ZBAN4V8Laz21CQxZeywk+kc9SFG71/Ei0PJq0eglzBuy4kYUTJ?=
 =?us-ascii?Q?iR9wAme4pIwrHfXeYMZeV1ajmmv+oPhwVK9evjybqEZlwsT2l5my1K5UIHeT?=
 =?us-ascii?Q?S7HVdfikKuv0Sa9eRlgrFYDzFYkot5lQ6xoAnOZADsIeS7fhUJzv7zt7IVT1?=
 =?us-ascii?Q?kK9ozyzCLl0hcFys2KTfJaFI7G1AnowcC94G53TsjTe0qHdkEu/b22IJNd4U?=
 =?us-ascii?Q?3wvwS3bFtOgyuPnu+pBIJb7Wd3WWk/A+pueJIwmQxwwrSCAsFdAJ6BxMuUKV?=
 =?us-ascii?Q?hPXwSOCLQjLNM6mYphcJb77xluRC9/FPSjPWUYHwF9+NV3/A5lYKjuLIhEdt?=
 =?us-ascii?Q?QJs00mlVlK3LSrw9p+LvTBAngmJiZBH/7lNuo/rDn+yJKEIFYkU5mk6mXYpR?=
 =?us-ascii?Q?KGN6bZJFQYPeTyccBQoG0eIwT4TkTE3+SDcDBAZHjoACuEGahmUMr66MldIh?=
 =?us-ascii?Q?y9ydGFVvjqweKV1cECtw/AT2cTeJEB5zRcyxya+sBlqYljKe39K6j6pj0Vvj?=
 =?us-ascii?Q?NiQfCFQDIk7hTXYeMsG/9d2EKa8VjAlnsJ/KBXtdHXkqqSxwkQ3wAIA7m4Rq?=
 =?us-ascii?Q?RncG2Zn6uhZAoO0/8U1HFac6J8PSC5g/Epd7CB0UHwD5hPmRHpBBa6/P4GNA?=
 =?us-ascii?Q?cOIvw9KTpiJQmTJ/goCGHkrRNX4Nyk5XZmB2?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 23:35:00.7661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68913076-b465-401f-af27-08ddbe780ebd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163

The MediaTek implementation of the sbsa_gwdt watchdog has a race
condition where a write to SBSA_GWDT_WRR is ignored if it occurs while
the hardware is processing a timeout refresh that asserts WS0.

Detect this based on the hardware implementer and adjust wdd->timeout to
avoid the race.

Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
Acked-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/watchdog/sbsa_gwdt.c | 52 +++++++++++++++++++++++++++++++++---
 1 file changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 5f23913ce3b4..81012dbe9088 100644
--- a/drivers/watchdog/sbsa_gwdt.c
+++ b/drivers/watchdog/sbsa_gwdt.c
@@ -75,11 +75,17 @@
 #define SBSA_GWDT_VERSION_MASK  0xF
 #define SBSA_GWDT_VERSION_SHIFT 16
 
+#define SBSA_GWDT_IMPL_MASK	0x7FF
+#define SBSA_GWDT_IMPL_SHIFT	0
+#define SBSA_GWDT_IMPL_MEDIATEK	0x426
+
 /**
  * struct sbsa_gwdt - Internal representation of the SBSA GWDT
  * @wdd:		kernel watchdog_device structure
  * @clk:		store the System Counter clock frequency, in Hz.
  * @version:            store the architecture version
+ * @need_ws0_race_workaround:
+ *			indicate whether to adjust wdd->timeout to avoid a race with WS0
  * @refresh_base:	Virtual address of the watchdog refresh frame
  * @control_base:	Virtual address of the watchdog control frame
  */
@@ -87,6 +93,7 @@ struct sbsa_gwdt {
 	struct watchdog_device	wdd;
 	u32			clk;
 	int			version;
+	bool			need_ws0_race_workaround;
 	void __iomem		*refresh_base;
 	void __iomem		*control_base;
 };
@@ -161,6 +168,31 @@ static int sbsa_gwdt_set_timeout(struct watchdog_device *wdd,
 		 */
 		sbsa_gwdt_reg_write(((u64)gwdt->clk / 2) * timeout, gwdt);
 
+	/*
+	 * Some watchdog hardware has a race condition where it will ignore
+	 * sbsa_gwdt_keepalive() if it is called at the exact moment that a
+	 * timeout occurs and WS0 is being asserted. Unfortunately, the default
+	 * behavior of the watchdog core is very likely to trigger this race
+	 * when action=0 because it programs WOR to be half of the desired
+	 * timeout, and watchdog_next_keepalive() chooses the exact same time to
+	 * send keepalive pings.
+	 *
+	 * This triggers a race where sbsa_gwdt_keepalive() can be called right
+	 * as WS0 is being asserted, and affected hardware will ignore that
+	 * write and continue to assert WS0. After another (timeout / 2)
+	 * seconds, the same race happens again. If the driver wins then the
+	 * explicit refresh will reset WS0 to false but if the hardware wins,
+	 * then WS1 is asserted and the system resets.
+	 *
+	 * Avoid the problem by scheduling keepalive heartbeats one second
+	 * earlier than the WOR timeout.
+	 *
+	 * This workaround might not be needed in a future revision of the
+	 * hardware.
+	 */
+	if (gwdt->need_ws0_race_workaround)
+		wdd->timeout -= 2;
+
 	return 0;
 }
 
@@ -202,12 +234,15 @@ static int sbsa_gwdt_keepalive(struct watchdog_device *wdd)
 static void sbsa_gwdt_get_version(struct watchdog_device *wdd)
 {
 	struct sbsa_gwdt *gwdt = watchdog_get_drvdata(wdd);
-	int ver;
+	int iidr, ver, impl;
 
-	ver = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
-	ver = (ver >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
+	iidr = readl(gwdt->control_base + SBSA_GWDT_W_IIDR);
+	ver = (iidr >> SBSA_GWDT_VERSION_SHIFT) & SBSA_GWDT_VERSION_MASK;
+	impl = (iidr >> SBSA_GWDT_IMPL_SHIFT) & SBSA_GWDT_IMPL_MASK;
 
 	gwdt->version = ver;
+	gwdt->need_ws0_race_workaround =
+		!action && (impl == SBSA_GWDT_IMPL_MEDIATEK);
 }
 
 static int sbsa_gwdt_start(struct watchdog_device *wdd)
@@ -299,6 +334,15 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	else
 		wdd->max_hw_heartbeat_ms = GENMASK_ULL(47, 0) / gwdt->clk * 1000;
 
+	if (gwdt->need_ws0_race_workaround) {
+		/*
+		 * A timeout of 3 seconds means that WOR will be set to 1.5
+		 * seconds and the heartbeat will be scheduled every 0.5
+		 * seconds.
+		 */
+		wdd->min_timeout = 3;
+	}
+
 	status = readl(cf_base + SBSA_GWDT_WCS);
 	if (status & SBSA_GWDT_WCS_WS1) {
 		dev_warn(dev, "System reset by WDT.\n");
@@ -348,6 +392,8 @@ static int sbsa_gwdt_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (gwdt->need_ws0_race_workaround)
+		dev_warn(dev, "Adjusting timeout to avoid watchdog WS0 race condition.\n");
 	dev_info(dev, "Initialized with %ds timeout @ %u Hz, action=%d.%s\n",
 		 wdd->timeout, gwdt->clk, action,
 		 status & SBSA_GWDT_WCS_EN ? " [enabled]" : "");
-- 
2.50.0



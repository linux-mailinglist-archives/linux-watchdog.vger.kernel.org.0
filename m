Return-Path: <linux-watchdog+bounces-3889-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1DFB0CD8C
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jul 2025 01:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04D5D3ACD24
	for <lists+linux-watchdog@lfdr.de>; Mon, 21 Jul 2025 23:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B03566A;
	Mon, 21 Jul 2025 23:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UVDZElyx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2064.outbound.protection.outlook.com [40.107.223.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6415A87C;
	Mon, 21 Jul 2025 23:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753139234; cv=fail; b=dig5i08lSScwcMSeQ+u5pJuAprj3quj0JwscxHEEnKpa5E8VPDKgGc17E/4I4AdLepCY6hYmDaB5Aip6Ou/CAQjk68dqfiCxGegddhx+GJQC6k+ZT6uYRTS3uPFPXqHTaL80+lBDtvFB0DWC7D+6mygfjBHQ2P0qcg2sy+poSo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753139234; c=relaxed/simple;
	bh=h7eU6cJz08cFxLSmSgnfjtQdVa/VBsl75dkVeJ0aFBo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G4bclvLr/Z/DlGcoPV9mRWCe0yKS50tvXlP7H2d/vqIivR92nLDWMGRYvQgw6V23KAMkakkm//RownHyYlX0ZxzQQNemxziwc7NEgtBgomp8dofTbs2AaaeDcqbpyLIkKwiKQgmgi43itREU0zPAxkYTA8wJ0oyTkljZjle3qsE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UVDZElyx; arc=fail smtp.client-ip=40.107.223.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3O0uyapi5JZPYHPhthmpNGvEpdCB4v4kgim5AwFbPKuP1I6jIy9eFNOKzlLNybmZyDs4ieMBRbEAJBQCf92sogfgdiD5P4LSmRyahfyIN2E3uG/w8o+74fL4sGpE/h5BtOmrGqzKMlU+/Nkynw7wVLfOQSZPHBJH2IMuy+XQMthtY2N/KZwSR2UjntlesFIMTJchepK5bwPyj2S1Nzrllxljd1/IkVKYE7zVzLiLn5h5nCTzPcZ1a615bTrWsyZ86zB0Bd9OvEnLA0VSdk8ZgzoOw9+QtLzYS5X2lMyvHOl1Mgv6bA8mG512x9yJKG8eh2q1uxzt7GbBfRwVLwu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRw8VntKea5/qjVhq9d0A8nLKJrXSzW8qO/8eQOrCXk=;
 b=ggoK2Dj/eoMB0PxwMjeBa+kvtldPIsQWY36ONZIdf1qQ0W0ZW1YHl8nbFCCmJh3gcqXms3+lx5vgixh43xXV5vZMj75snKcF2+fTjdGdBMppa/cuqsK7xZqYX61uCxFWPQ1l8QpeuYAq1ru01uDd5Zb4HsPyHd9VZt26OdpSUmq3IzZT/AYr6G8g6TesAo68XBUvPQYjK1AJTkAR6GDVvwFysHOHuOrUEqYpiJvW+Nc7waaqQ5bBD89+HYobw86C0k/CE9JZMk9d/JxifsdkugDk0JzvXVHir5DTbNwoYUByDZN8fA52dXyoKhqMsYzH+615XdfX42uhr+VHzeDTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRw8VntKea5/qjVhq9d0A8nLKJrXSzW8qO/8eQOrCXk=;
 b=UVDZElyxHq010TWRCPjxS3Ma55ZZdzxjY54cKxujvS4gsdIKwKadHyz47GigpSwDkekO3+/9w58ylT0gjW4iOMhD4Ea9OCsKM7iuaWKEnvPU3HqJOVYm6LUUQgZElZB6alGdu8p7Wy7w2modl72SKTwTWd/8WoJPwa9ESmr+OtERWXioaWkYKtRIfhGrdeFcqv53Akv6v2n42J5Xg3Cdl0RZjKEmt+DxYPS6CaN09pVFBfMowWEQzT4LWzPHjgBtjfAqMaEklSMO7BReKl/1H+PaqHDUEO/KSK93Uao4E0xTGv57DEeOtAsWbtxGxz+nGYT3gbCZSV9yd9QQ1sPAGg==
Received: from DS7PR03CA0278.namprd03.prod.outlook.com (2603:10b6:5:3ad::13)
 by IA0PR12MB9010.namprd12.prod.outlook.com (2603:10b6:208:48e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 23:07:04 +0000
Received: from DS2PEPF00003446.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::fd) by DS7PR03CA0278.outlook.office365.com
 (2603:10b6:5:3ad::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 23:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003446.mail.protection.outlook.com (10.167.17.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Mon, 21 Jul 2025 23:07:04 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 21 Jul
 2025 16:06:53 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Mon, 21 Jul
 2025 16:06:53 -0700
Received: from treble.com (10.127.8.13) by mail.nvidia.com (10.129.68.6) with
 Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Mon, 21 Jul
 2025 16:06:53 -0700
From: Aaron Plattner <aplattner@nvidia.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
	<wim@linux-watchdog.org>
CC: Aaron Plattner <aplattner@nvidia.com>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Timur Tabi <ttabi@nvidia.com>
Subject: [PATCH v2] watchdog: sbsa: Adjust keepalive timeout to avoid MediaTek WS0 race condition
Date: Mon, 21 Jul 2025 16:06:39 -0700
Message-ID: <20250721230640.2244915-1-aplattner@nvidia.com>
X-Mailer: git-send-email 2.50.1
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003446:EE_|IA0PR12MB9010:EE_
X-MS-Office365-Filtering-Correlation-Id: 152fb7cd-ddf0-47e1-f83f-08ddc8ab4ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FnHHo24R0xeZZrdDGdBVirw6fwY7eFKtOP0+N686pI61wFF5ZrceE3uVXeuo?=
 =?us-ascii?Q?HIOBQrgqqpaL/w36W9Rdl6NWqvbydWQM6nD4yyIOr0Fjnt3tEvY7CKtQCubK?=
 =?us-ascii?Q?X8U1N+wc3Ofv3UXWII4ugXUS7s9DIBM7TRi2q2+pXCQYreiWronWd2hfRRnk?=
 =?us-ascii?Q?IswAsQBVC2lpNp+7SyIXvxSSqvFge9Q39CTWbg74T3folVHTdgamqSvlUGyQ?=
 =?us-ascii?Q?y8cXIVpxg4GcK4pjkat7/Kf/htW1qr66jbBo0BxL1lljhP+TtyhbD4FfZQa5?=
 =?us-ascii?Q?SpXC7b4J42tUX6pgPszEkQsGgM9MD+mPmA2qlhQIr1mH5r6sDHKzbYTRYjtk?=
 =?us-ascii?Q?I/ngcn30gDZhMwac8WIxkI5hD0XxpNZSp5FynM6NI3eJ5wyuCXYNb5OG95ZB?=
 =?us-ascii?Q?uRul96SNtWnB9L7HsPfa71RTN4dQqfyn3VggMWitulgoZ5MiOqX0WJY8TnKC?=
 =?us-ascii?Q?udPatdKHkPzV2CLrAUtPKt+G+zWB+YABp5CI81sv1OEXby2XUJsZu70lLpJ1?=
 =?us-ascii?Q?ogD4Nq6Tl0xbIhu33PSvfywiGYixxO2Pr1XXLOHhMTEma35kW0/o9aN+sdMs?=
 =?us-ascii?Q?VeQt5+2w3Ah0I9VpuZ3sjsTitHg9SRPgPFr3ArOYAMn6qDjZv4WVGBvj+SnV?=
 =?us-ascii?Q?OM9JeSaOZXjU/m9WEuKh+eDZa4BIZaLH4979eGTmSC2wkowzSQYayuOkHG5n?=
 =?us-ascii?Q?bGKG01FqAL3UiAoOefahKw/JFTj25S7Tv4BoLNqSuQc8p6XVXfbWj3Ud7Mo+?=
 =?us-ascii?Q?NmnYAeUDTQipT7I+8esPOxR4LWCrjitBQ1BlEPZwHDoSIzAYHnWUbRbHk4Pm?=
 =?us-ascii?Q?lC7GVOL5qA7yqfYG3XJk3ZwFs+Sjks98XU7wFyupL3BiyEF9PoVaRCHyOETe?=
 =?us-ascii?Q?aM4GIOrdqfiG++X1hK67skZRnO4kMLtwPERn0GbduAopeLC7PXXvHs3ywRpe?=
 =?us-ascii?Q?mFGQMSDWpGKQlww6Mty+POhgGfwNp/VFf0Z16uyIWM3to/mS3MGIC4UX7a3s?=
 =?us-ascii?Q?QWBUtfcowkRmDR0+qIJ3B2apl9ZDc6LOFeOXWKBosFCLY4aiE8dv7Q19TPRj?=
 =?us-ascii?Q?S+yCihODScJ1eiHJt0TPhSob/zlFR1s18Ln/7o5cFiG/gIstf5WKOdUWdPLq?=
 =?us-ascii?Q?dAFmren+gfeed1HoP1EInURUZ0pX4pB00zcDrHPpsou1MEk/dJ2LDAim2phG?=
 =?us-ascii?Q?QYnAkiGtI57eSMY8VBmRezrhq92Qw69CTg7pfeGpxqVlcYpOD4V6wnVZDUma?=
 =?us-ascii?Q?k8lWsPVL70ig1EcRBHMmvBQi4famcluG9oY3ZfueLwSgWEotJr1KVZHCySDL?=
 =?us-ascii?Q?n6gcYdl4JO8bd+O+IR1vjZk8JGBi02zTmNMbx2wDWboQpg+Z/AaI0NVItuoU?=
 =?us-ascii?Q?4eHIgQ8zr3WWP+d+FZnxwmBbJcePUph8qp89wwrVanyZDOaNHKBKRtUaoS7X?=
 =?us-ascii?Q?tKO6haMGPOO2MBAAusIdjZVwdCYV9KmDMVhy1rGGKt86y35flU1WvnTBx7Jz?=
 =?us-ascii?Q?F0Q2VqPtFKh2kyd93EGyZ3PTiQUS7TjUFEUr?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 23:07:04.2200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 152fb7cd-ddf0-47e1-f83f-08ddc8ab4ec7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003446.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9010

The MediaTek implementation of the sbsa_gwdt watchdog has a race
condition where a write to SBSA_GWDT_WRR is ignored if it occurs while
the hardware is processing a timeout refresh that asserts WS0.

Detect this based on the hardware implementer and adjust
wdd->min_hw_heartbeat_ms to avoid the race by forcing the keepalive ping
to be one second later.

Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
Acked-by: Timur Tabi <ttabi@nvidia.com>
---
Thanks for the suggestion of adjusting wdd->min_hw_heartbeat_ms, Guenter. I
confirmed that doing this causes the keepalive to fire at the later time and
this avoids the race:

 [  137.500462] sbsa-gwdt sbsa-gwdt.0: version: 1, impl: 0x426, need_ws0_race_workaround: 1
 [  137.500473] sbsa-gwdt sbsa-gwdt.0: Set min_hw_heartbeat_ms to 6000
 [  137.500944] sbsa-gwdt sbsa-gwdt.0: Initialized with 10s timeout @ 1000000000 Hz, action=0. [enabled]
 [  143.501475] sbsa-gwdt sbsa-gwdt.0: ping
 [  149.502044] sbsa-gwdt sbsa-gwdt.0: ping
 [  155.502351] sbsa-gwdt sbsa-gwdt.0: ping

I also confirmed that this no longer exposes the adjusted keepalive time to
userspace:

# wdctl
Device:        /dev/watchdog0
Identity:      SBSA Generic Watchdog [version 0]
Timeout:       10 seconds

(in v1 this would have reported 8 seconds)

-- Aaron

 drivers/watchdog/sbsa_gwdt.c | 50 +++++++++++++++++++++++++++++++++---
 1 file changed, 47 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/sbsa_gwdt.c b/drivers/watchdog/sbsa_gwdt.c
index 5f23913ce3b49..6ce1bfb390641 100644
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
+	 * Avoid the problem by scheduling keepalive heartbeats one second later
+	 * than the WOR timeout.
+	 *
+	 * This workaround might not be needed in a future revision of the
+	 * hardware.
+	 */
+	if (gwdt->need_ws0_race_workaround)
+		wdd->min_hw_heartbeat_ms = timeout * 500 + 1000;
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
+		 * seconds and the heartbeat will be scheduled every 2.5
+		 * seconds.
+		 */
+		wdd->min_timeout = 3;
+	}
+
 	status = readl(cf_base + SBSA_GWDT_WCS);
 	if (status & SBSA_GWDT_WCS_WS1) {
 		dev_warn(dev, "System reset by WDT.\n");
-- 
2.50.1



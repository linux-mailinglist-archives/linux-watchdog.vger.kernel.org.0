Return-Path: <linux-watchdog+bounces-4893-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIPgAb0+gmmVQgMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4893-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:30:21 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0F1DD989
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 19:30:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2394310772A
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 18:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954003D3494;
	Tue,  3 Feb 2026 18:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aqFBhAvF"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012048.outbound.protection.outlook.com [52.101.53.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7332936E46D;
	Tue,  3 Feb 2026 18:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142782; cv=fail; b=c8s3I+J/y6cGAC2wMrUUiPmUQaZ8QnIXBmpsspKt6p8JGbkbDU65eLRN0o0SutSbO6guNE3VKhAB2IyrgbWM7CPRDWAG1MXCJLTVXz+EZoixbGjFZ+hkENTeU85rvR1Zje9A1l4fuNJw7GydbiOrHY67Fg9CRZM1xn8fDfZPk8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142782; c=relaxed/simple;
	bh=GbNcrE2SWZkP3PBUGF/8bIrQyvC/G+mwKl+pFp9fUVs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p6MZd1xwdmPGizgllc+SYyo119vI0WBxdVCS7+ZD2F7UDy185OIWMoFFMiIKHaADga3acNZ55C0KXw53/8c5g7zQehnrqlcTC2Ps7vWiB/qFylZKaEDzIk/itjIBsLWZZoV7y027p4SL4kgT6DpLfRl035orssDFwNB2nl69T3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aqFBhAvF; arc=fail smtp.client-ip=52.101.53.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UpNsg+MoD0dBtLzZyV2os9C4uw0pQAcVn25L9+xRdji06x2R5dhPJLYp2VPp6WRaOf9RX9IiC+SLTfDMZpv6Q6lealkJhy0KU8qNZmzqtK40O+rbMnvUmwqBwTHXhbgWZeXW8ucSnvnEP2gKAbs1TUzqFueCrMMa02vSeqwi8jqxz3P5C5UF4W/l6fdQ/hxnd0rIu6D5uIC2ZwwTqU6drXGlepq29LCVhNDcfnXULj6kTQHmgu3w5vvcDAGPjaaIyhn8NFaZh7ajBZbR1GpuShq8gqRqZB/YmQJjBqPY7WV/tf+oCi4FwKFsYJ711aPBRipC9a2T6YCTJ2B0xBigDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJx6RXmfwoxbjDuHhfB/6k3XOaGiaLSDD6fFnK0/kxw=;
 b=u3Jkep0fwNyQ181w8EFJ2MGFg9tVjEyXlqDLfXxjQknKNpku/Nn3boEquNYLErgwuX5a5v+4J92//wjog4FV6/7El8BHkeuDyue4y1TAklodxKtoWxar62jJTV+/eXcDYtf2BWyO9IOXCOznlFXYYFDyLG8tUjTo0lIo6JZRw9sAJvFku0UhDbsWYL3mzbDezoAZ+Idho1IEUMvtJ0yB8EcvFt6Odh5wGhDUPjBK0S7Ku7GBIxHdYDHEiPHsH/E832bAICR/pFKITbR9OtSQo0XsjV5buEK5RptRYhtv5LpX/Rsq7U7iOSZPogv42l1ZRWRVtAB8eBbc0uvQZyN5zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJx6RXmfwoxbjDuHhfB/6k3XOaGiaLSDD6fFnK0/kxw=;
 b=aqFBhAvFnvDqF53WzpyEKZ/FQJAlSzQahp//tmgxtd1CShYl0rUxyUM93oZL31enCfhwp5k1jeeKjRRgCgYN+BsLWuxR9L3gxiwmf1Wa/01Ef2wlUV+rmNd78FUnvmAgGO4vYbeIIc9J4MWaSHl4I3e/kfCX47uHRyOoJ/IzavQ=
Received: from DS7PR06CA0001.namprd06.prod.outlook.com (2603:10b6:8:2a::12) by
 IA3PR10MB8017.namprd10.prod.outlook.com (2603:10b6:208:512::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 18:19:37 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::c4) by DS7PR06CA0001.outlook.office365.com
 (2603:10b6:8:2a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Tue,
 3 Feb 2026 18:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Tue, 3 Feb 2026 18:19:37 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:19:32 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Feb
 2026 12:19:32 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Feb 2026 12:19:32 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 613IJVHv181632;
	Tue, 3 Feb 2026 12:19:32 -0600
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <kristo@kernel.org>, <linux-watchdog@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v4 2/2] watchdog: rti_wdt: Add reaction control
Date: Tue, 3 Feb 2026 12:19:31 -0600
Message-ID: <20260203181931.1496723-3-jm@ti.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203181931.1496723-1-jm@ti.com>
References: <20260203181931.1496723-1-jm@ti.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|IA3PR10MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4267852a-6efe-4317-cc37-08de6350ca33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XR094q0wuO0dfWHucHQntEOkfghIbQAnV6LVYh4RPy5BE1wbtvu7tmljVpjL?=
 =?us-ascii?Q?/tzHev/EcpIJAjU+iJibyJrrJfANAUPSmNPCPdu7ULlQtGBO8DTXGLIzJaa1?=
 =?us-ascii?Q?wC3VF5zzMtzzpe/IfKEZlLuCQzoawcN9/BtMskPWjjLqtOBJQy8kzc3yG9po?=
 =?us-ascii?Q?DzfLAtZzJf9KD7VinGXRM3mg0dv7p0OFcZi2FqbJovjnla07PSu8/990ZhVx?=
 =?us-ascii?Q?J8TvEuyuwKYVq8P5gYLDOdnIw6YidnrDdZZWKSfphIb6KSlVfpPc0DxyfiYW?=
 =?us-ascii?Q?Y12L7gT0iDpqUxv/u41muy4opbnUiB/qt7Y6wT0QmCHQAF3v5SVHHcVdNuy3?=
 =?us-ascii?Q?B2MtMMWppZ4+g2P7vvwBbobbD0AsYaH4velum/sqC+/fsHwipU+FhKRqp+oV?=
 =?us-ascii?Q?l625D1dWpksS8+jxsAbTyD+FP4jkVcb4WT9Mcp3pqKmGL3+lJRtNhHLsWiZF?=
 =?us-ascii?Q?qVchMsVo2wv07dBztc0b57JkcZmXRczT13floBejaKfq80ryC6jkPUmCRhex?=
 =?us-ascii?Q?9oFZCUgN6U0yR5ee6pMVRic5oslfkQ934gQf56sxvMKNU+LUDzTqfNqtFxwV?=
 =?us-ascii?Q?TSRFXu/LVKinO0eFIWe89ibIi39bXdI73YNjp6+xdXoo03B047ckMjDFAIT6?=
 =?us-ascii?Q?0oY3Jx638EnilLgeLi3+rFjVF7go6S8/pnbEk3pf9/k9BvQMLgMRX/ZqD8D5?=
 =?us-ascii?Q?vkb08TULFI8wqaPLVOqtaLq6IhbLR5SRtY2hSiB4XCm+DPYagyliNHMd111s?=
 =?us-ascii?Q?WFNlwKSTHdVbw4TylSXFJWelDW/4d91rD2XbakzhfMj/X9EXtDX5IlS841So?=
 =?us-ascii?Q?5b5fBtwm0ZEtB7NErl2HiFIIc0yTmUPGjnc9RpgQ5jhsPPIWehiI7FdW6/fz?=
 =?us-ascii?Q?ANZ7B1jMiFzKA051n1a4Qrg1X9XtwKOQ9hpWr81L7c2nLyXGFj8qBosWFGMo?=
 =?us-ascii?Q?zZOXVJWS+pShtO5XX2xLrNw+zLjQ5en5TwEfuILXjtp/8NBaiUAuCAvCKshP?=
 =?us-ascii?Q?P3BTBH6Oaz1lU0xBQHxrSEUxCP9GBOXLgvM7If2Edv/FHFi57Sy7V2Le+k7f?=
 =?us-ascii?Q?As+7TnR1Bw4s812YVLkettP3FmeigOkK4IMCR3l9m7fYsF2R6Sltp9cqFdtO?=
 =?us-ascii?Q?yvLOZhvCHOETARkWDQHGYPRi5UYZ9L7P+d8P214yxNMfJ1X++A9Ei2n/2Dfa?=
 =?us-ascii?Q?RVacSvtaqKeU+y/xz2xsfQa5bfSqgTwAZKKHOvwaCeTMT8KGBkdHMBM3pJN1?=
 =?us-ascii?Q?8SIhty+mHgCRaxNLzV6WuI2Ub8zn1FDiUhMOSmIK3Wcef+vpmeqXZCW7Yu2/?=
 =?us-ascii?Q?KZdOlp3K4yNanD/1CpvLwwC5xojM3DAicaO6vb0fysT3CumPmVFLC60gwgn+?=
 =?us-ascii?Q?Zs+VC91lfEtqxJXq+evQvqZZD4emdTnARbSqRnPnBzX7mHgBHzJLIfbsW489?=
 =?us-ascii?Q?F/3gUeMtlW8QDLP9gXolBPiUQQzKBSwW0sHTcI4Oa+XH3ltDHhoFj79zUbxN?=
 =?us-ascii?Q?T1WgfxXCyOv8dNAEwmk4q6dsCep/yonfnvN+8vsrfNdCnQW68SbLxe+R6xZe?=
 =?us-ascii?Q?IuaUa170KU09ubkpWLITqWbAS0QXmuPUcQy6vKhpbX5c1hierEAyBWSS+fjp?=
 =?us-ascii?Q?VBlWuPrKemZ5zOEd4ScYmWVkVwWzDnMq5Gzw1XA6/qREpqWSc6toioLZl8YJ?=
 =?us-ascii?Q?km2G9A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zwcn33qk7Ci+XOzcgods3R7oJ2GK6FM0BdYQH5D7I/SdsrAvtDD9dHR96wMrU9HdtEIO9a58DIlviz73M/tQJ+qmQHGNTK26WoV6Z7Ab42ZeQGIny9425b5JbRQUa2hdIzPa7ZhoHqu7wHQ/nH6uTMQPiC7+XNp28nW+jN7TuIDnHrjP81QMhHYKYGXJTN7f0/8tRcBb9UwgUHeCDBoVeTYzd0bnNL9Q9ag8CfOQnluDpomhxKOOMr+Fh5IOrdJcco2LhLdUUTAGdj98rrDNs6IpTktbvACVO1+ev7ChAGh+XKG43joaOz/NQkwY/h4cfYndxRSwPZ3UsX69Rqi4e9gD6PODIW8AgkqwX/sbzsiajWQ+H7QI8O2RSa9BAafsBr8471A2Yi1seiID5t33bStYcdG4hnlFKkTRS8Pxk4GWnRYkLJn0I/F3qHKeeyau
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 18:19:37.2906
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4267852a-6efe-4317-cc37-08de6350ca33
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8017
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4893-lists,linux-watchdog=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:url,ti.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jm@ti.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8E0F1DD989
X-Rspamd-Action: no action

This allows to configure reaction between NMI and reset for WWD.

On K3 SoC's other than AM62L SoC [0], watchdog reset output is routed
to the ESM module which can subsequently route the signal to safety
master or SoC reset. On AM62L, the watchdog reset output is routed
to the SoC HW reset block. So, add a new compatible for AM62l to add
SoC data and configure reaction to reset instead of NMI.

[0] https://www.ti.com/product/AM62L
Signed-off-by: Judith Mendez <jm@ti.com>
---
 drivers/watchdog/rti_wdt.c | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/rti_wdt.c b/drivers/watchdog/rti_wdt.c
index be7d7db475911..483e22efedf9b 100644
--- a/drivers/watchdog/rti_wdt.c
+++ b/drivers/watchdog/rti_wdt.c
@@ -35,7 +35,8 @@
 #define RTIWWDRXCTRL	0xa4
 #define RTIWWDSIZECTRL	0xa8
 
-#define RTIWWDRX_NMI	0xa
+#define RTIWWDRXN_RST	0x5
+#define RTIWWDRXN_NMI	0xa
 
 #define RTIWWDSIZE_50P		0x50
 #define RTIWWDSIZE_25P		0x500
@@ -63,22 +64,29 @@
 
 static int heartbeat;
 
+struct rti_wdt_data {
+	bool nmi;
+};
+
 /*
  * struct to hold data for each WDT device
  * @base - base io address of WD device
  * @freq - source clock frequency of WDT
  * @wdd  - hold watchdog device as is in WDT core
+ * @data - hold configuration data
  */
 struct rti_wdt_device {
 	void __iomem		*base;
 	unsigned long		freq;
 	struct watchdog_device	wdd;
+	const struct rti_wdt_data *data;
 };
 
 static int rti_wdt_start(struct watchdog_device *wdd)
 {
 	u32 timer_margin;
 	struct rti_wdt_device *wdt = watchdog_get_drvdata(wdd);
+	u8 reaction;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(wdd->parent);
@@ -101,8 +109,13 @@ static int rti_wdt_start(struct watchdog_device *wdd)
 	 */
 	wdd->min_hw_heartbeat_ms = 520 * wdd->timeout + MAX_HW_ERROR;
 
-	/* Generate NMI when wdt expires */
-	writel_relaxed(RTIWWDRX_NMI, wdt->base + RTIWWDRXCTRL);
+	/* Reset device if wdt serviced outside of window or generate NMI if available */
+	if (wdt->data->nmi)
+		reaction = RTIWWDRXN_NMI;
+	else
+		reaction = RTIWWDRXN_RST;
+
+	writel_relaxed(reaction, wdt->base + RTIWWDRXCTRL);
 
 	/* Open window size 50%; this is the largest window size available */
 	writel_relaxed(RTIWWDSIZE_50P, wdt->base + RTIWWDSIZECTRL);
@@ -254,6 +267,8 @@ static int rti_wdt_probe(struct platform_device *pdev)
 	wdd->timeout = DEFAULT_HEARTBEAT;
 	wdd->parent = dev;
 
+	wdt->data = device_get_match_data(dev);
+
 	watchdog_set_drvdata(wdd, wdt);
 	watchdog_set_nowayout(wdd, 1);
 	watchdog_set_restart_priority(wdd, 128);
@@ -361,8 +376,17 @@ static void rti_wdt_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+static struct rti_wdt_data j7_wdt = {
+	.nmi = true,
+};
+
+static struct rti_wdt_data am62l_wdt = {
+	.nmi = false,
+};
+
 static const struct of_device_id rti_wdt_of_match[] = {
-	{ .compatible = "ti,j7-rti-wdt", },
+	{ .compatible = "ti,j7-rti-wdt", .data = &j7_wdt },
+	{ .compatible = "ti,am62l-rti-wdt", .data = &am62l_wdt },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rti_wdt_of_match);
-- 
2.52.0



Return-Path: <linux-watchdog+bounces-1494-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A3951FA0
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 18:18:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 56FA3B23294
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 16:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0133D552;
	Wed, 14 Aug 2024 16:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jAKxSfPZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6C21B86C5;
	Wed, 14 Aug 2024 16:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723651992; cv=fail; b=TJ7Y3rln6R7zlrcXvgLkLKHLQbwaQ5TAG0dRbwoHQv3eDHSL+rwEGAckPv2txom/z9xp0IlG0vONrbSr5PyESI3YP944GdGBcez7Em7w+LbMzw3r3+4MKguW1WkJU0YQDesUd+F2u1s+7Rd0yRY1mP/UmOUlhJNq9y1DIZ+aHHM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723651992; c=relaxed/simple;
	bh=bF6Rvm+jrGfuyQLBfe6cZbh/Zg0+RJaTwhyWbIGOkmg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Vzckg3cgOIDiZEPOejxHNCXwnuEtE7gwXQxGohspAOxGs775wSxchHNaKL+f3J/5RQdK+tVCgVcsjea4/TEPoF7K2nNAHxTqLkIgq1uDZx4vbkQF+Azxt4P6ANzEVbWnMXG/q1xHVEe6Xo/5MggbcuDGGSMy/RZsKcOJ+ozjYKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jAKxSfPZ; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1YLQ+s+cqCqYelAPRNnnXcqSJlVPGfQT3YDi8ATqyWXJArloxQtbRqy0nasNTu0oHwfQHYDIsYH1Zen9ATCeuUJGQgcOkm3INhX0pEskEXvzia/dDTIyiJXJ6uAqUUslwavwTL6BZXszu5dJy/CWZyXQ9zdx++4JYZ9A5QRF6KZpMj7wDeirP7238vbKmhNSrveQLSW5ppWsU8HAFvHI0tsrMrLOAxU4k7smWqEuUPBopD+VTlk8YzdtcP5B/g3BRVrzld130EeLq8bon/nRMypqdD6323mRYmpKS10VksK8aTiJQVhpaVS2Gk5A4XDNsNJWIB/qvD5L2qrS0Ci4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCawiasEWQmxx03JaGJj0ghynWnI6lujryI395NphD8=;
 b=h3U9izGod2SlqvyZdHRwTrAMck1i2jY93YCB56xPPHqF4mm3WJLs8CUTxCSf24p8IUxk6K+HabYlUNix5ckD+O3l+w77Xy/RjVMm1JxaqHEGnm8hjkE89jfpDB6J6xzY/EjvFeAv0Ymss96QeW/c5mPgyoQQ1qTmkaAg9r9uhN0weRA0Z1prOpqAF4fOPV6lAuNSEZk7Xn2+n9UoMBfoW61FOTvDNkRoDSKrOFJxCw+o8SYod7wWG3LNmwLRCQzmjgNgYLlkPSzX0TMRvm9uuf9lcER0URQsPm2kg3JY2hnsI4tdXWWP7bxSQsMnn3FJddRNKCXtwiNLWA8RhBfMQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCawiasEWQmxx03JaGJj0ghynWnI6lujryI395NphD8=;
 b=jAKxSfPZBGyc3zIPUtn8dRyv7B6aSQDeLXtrXPGWSLEFLaWuowNTIMRdMTVmD40ah6FsDwuEhGgTM05j0vzHcs4sttrEBDVYgEYi3E8DN3XvlgLeBcKM02ZbtmICbFS1fcIpbNSyQ49zW0h88FwNKFndfR1cjOUwJP/RrlytiQ/Vn/Dejdlfzcvswff033y8ssGVNWIeUVHwk0vOUREQzCpRlyum3foI5jDVgGueVpbvQ1s0g7MFCET67zw6qOCvIN5rik5WF978hDoSjTVoKV0c/rq4Se9tu4rGt51HYBcL+oZqmfJbCNLYJ/HtRzpt3iV2UTkGn7uQFjNNttcpZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB10270.eurprd04.prod.outlook.com (2603:10a6:150:1c0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 16:13:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 16:13:06 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Martyn Welch <martyn.welch@collabora.co.uk>,
	Van Sebroeck <wim@iguana.be>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] dt-bindings: watchdog: convert ziirave-wdt.txt to yaml
Date: Wed, 14 Aug 2024 12:12:48 -0400
Message-Id: <20240814161250.4017427-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB10270:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fa1b009-9912-4137-3d9a-08dcbc7bfb17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sJlrtUONhbX8zmypIZ49xI9CSznz2k0zk4WT0PuudV54VKS0AWCZFN1Ajt0U?=
 =?us-ascii?Q?8NYKD3mcr6RRO2SbIBdjCLHv0TovutACpcRYGnvyFtD9ocAh6l71gpzXzpZw?=
 =?us-ascii?Q?PaOnpIFgUl6Xr9lhK8A3QpS+npuwjvo8Z9OskjVOT4ILJnllWohrqzRkTHcm?=
 =?us-ascii?Q?sR/d95yJdyjV21OdiFvcgM5pHQ/opANvORdWqW0UgODpWuZocbTw7n+vGgvu?=
 =?us-ascii?Q?CknJx3ya68J1ZLLCf/9ztvtglUGaS5fNOC/S3qP/eSs7+bZwp4fYDpqvfC3s?=
 =?us-ascii?Q?01Q+KQ1w9aJswyI4Ibr2UMbdEb9BFZlG1x1V4+ysxMVkN99YMA/3tw1zIhEu?=
 =?us-ascii?Q?V8J0SKglCvzuX2YvxOk89QEaySi3TYRLTRgFsSdcR0PzmynIMxwdfMXJvLoJ?=
 =?us-ascii?Q?uvCuuRDVetjacCtYU5IB/9KVMZvbjEk9IDDgAP4M0jbZYJRFnGvR/S7Tg2au?=
 =?us-ascii?Q?Y6q6CrRwODGK6rVudJfca4iGRDjzUcgYPPJAAQE/57ImSLYHmNfrvSby/PzU?=
 =?us-ascii?Q?qm1YnyGN9M5kcb7HfyTGr9QBztGy2A3rcK2Jp6yk1hc6KrOGpVKW8wnb0AwA?=
 =?us-ascii?Q?bMpjzx+nNU51dA4th4YPpA9gOYRtVLZR9uAk8Qvx3dR8gHhMx/AdjD/WjO0U?=
 =?us-ascii?Q?ZmR98y8j2GXQs2XnsNc4WM8FPRWsz/H30/Hlmw9OVwB2Ah79cS93xs5iBLpQ?=
 =?us-ascii?Q?KueAgXEKsDbSTD3ScQ69tLULP26qhPhYdjTLWtufMxRJ3skY6H1vj4zeQ5m8?=
 =?us-ascii?Q?u8bpb0Dl97Dyboio18HlyZuSPrz+02Lmk72NRzoxn/KIftDbFo/XCpbz9//u?=
 =?us-ascii?Q?WO4x3mDDkPHFJJeo0xAhdWXfO62oVy+tPfz0gv2nn8qkhV22SWTANhC47ndd?=
 =?us-ascii?Q?Wt1pr6fQjylLk4M2A0D6ykpf2fZIzjPjkeP802qz45fOLO4otoP0398YjqU2?=
 =?us-ascii?Q?waeeLXkPGUCXc40m5LbEOjcnkXBe2jFfR6GxOXmaZ27EOO9UBOyVej6iLOls?=
 =?us-ascii?Q?z162g/Lm/9CJeQ28SUY2Sd7J5TEmcnSOwsCDsrMjVTNpTVfrSr/Wm3PNpNX3?=
 =?us-ascii?Q?Z8Oijyu6jh7/fWLI6Ik+di3rBv7/2gOMbZgFBV4lvRKmEXNGt+Rs2Ai9KH3/?=
 =?us-ascii?Q?uIZ7TrNzgQ7WNc3v9VJrrAM5mCPLmcJs1A6pa2XTP9PoS5tgYwv4DzDZMDwR?=
 =?us-ascii?Q?c8UPEf7HA8RAv3WKXhiqq2hjcaZLqZp+DXt5hwB61cs5pUkvERoDIHQMp35w?=
 =?us-ascii?Q?DpPzn/QMqqhysre0xgOKza9pfq6kIX2yDob1rLPDfGWKaNuHI2P492fPU798?=
 =?us-ascii?Q?XbxtLer9Yeg9ZpdI0lPZ2AabdHNyzqAaIlNrv0nCSWHKteyPkkMwCqf1BsdL?=
 =?us-ascii?Q?yFIvIgxOfzteFhIph6oX2gV79bz1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iQ5aUnhQkwYMjClif5OqeqM4mjQhyPokczwwkMPpmb1OxmgxQciMyxSELtIs?=
 =?us-ascii?Q?jeyGa8X9qQfXZ8AHFFALT4TXatymNi7O7eFiExPlabvtUpmb0FNS7PegC/PT?=
 =?us-ascii?Q?kBNmgLf6WI2xkqCnghTj8gf1iTWtJXXhm9bgXG6eVThe5JOFClPO/OqYTlmh?=
 =?us-ascii?Q?JlYY+jAqBuuSFSI9tVubDdxD9aOzeHKVLINwUwM58B5yB6r8oLnPTMwuf0MT?=
 =?us-ascii?Q?o9mJvRBflXd/EZCHtQO1J7i1BF87mJYMybbPChrhDEWp0WYqmepVOmM98PIf?=
 =?us-ascii?Q?p087E3GHgiG/g56uGiW+VfssgLDMtCi3uHEG4e8Uox24oJ45pF2IjwMK2aTl?=
 =?us-ascii?Q?bL/j50DdQj+Ny9B0H581aLa4W8+FaXIRTBihHCVmjC1azUvHr0cLOUavC/Wh?=
 =?us-ascii?Q?mfSqRghzVKMh5XpW8MpvOG0BU0lLNyMOsGLJ8xw/yJ8HOOG7sNqTbBSM/C7D?=
 =?us-ascii?Q?dzPafeMXDmi7Ft2KftBMJvEGpjKPqbbV14xWj5VgQ7ZtzQagqZ+m3FkLxpd5?=
 =?us-ascii?Q?JJH/P2gaSF1g8yYbxpVFYVVJzQNPVXNJRvH/JIy0U9MmrODEft6aAuR609G8?=
 =?us-ascii?Q?jXYrRik5rxyoHbnyHQDMatux6ws2QXEIVOLMwY8X+NVA3DTglBUPnPnDiFaP?=
 =?us-ascii?Q?FsFHoOUqkMDpI1QS5OPGCSXvFAN96aX+h2SsKFPw+rpf8cz4LmtBPsx2o7SX?=
 =?us-ascii?Q?zIixNMShgUMaMAH+A13uD4L/gZBewx+mkqUq5iCRhIf5EF25Y/62Q7EUrOtw?=
 =?us-ascii?Q?pNPM3EMNOf+x/jiQE0NodfHXpdg/aP4TFAyRshaRgZ+lTJerxwnf3JIsvztY?=
 =?us-ascii?Q?QI6gG2LcIXSRGZwwg6nDWCcGte2EvATjMQDEx22HzZDHjGmDlUXpraFOOEdg?=
 =?us-ascii?Q?WaQ70H0Yyf8sC00Au1G3SI4mm5rprQy/56BaBUtJS9DgtJpn+OSbtREhmaLh?=
 =?us-ascii?Q?QLftyNKrGMyLkn67dyFfP2ltuQXfKrfez5KJw1ozsYhzF/o+iQesYlfIYPWV?=
 =?us-ascii?Q?K8j8ZHn/ng7MotqL/gcVCD4eyBOVFOQBjVs9rpV5TEU6nUs1mfxPAG9I6iQ2?=
 =?us-ascii?Q?+1RlthWq1BWoiuJH5JrGsZil9SJ0KfmVUSw40RbpP1WfyRf93bnUSQLAtlpv?=
 =?us-ascii?Q?J0XJJ9XYFGCXRcUC5iifrJXGTpe+o7st+SRGBO8OytusZRLfi8sEy3uQ+ymg?=
 =?us-ascii?Q?t6De87QfEY+Es2oYnWFYmHnjRI+kEBz95i22YDtPMeeXf0U8df6kfb0gTYVL?=
 =?us-ascii?Q?m6jjI0a09ju8Ozumv+KdtxhBIHCsZ9dPTELlUEeZBouI9GECn4EA08HbB0e6?=
 =?us-ascii?Q?qXY8CBaGDvza6xXLdivO2EaGsbEImyocQtNpuPhXqEgx5IExJjgxcaGJcWSi?=
 =?us-ascii?Q?6qOFg7pvvNHDh/Gb1jDrcqe/byodVG4hDLxd25SoXmOkKWn1skhnsyv7Qz/f?=
 =?us-ascii?Q?KgoN5TQu71t2TZ5ZDYmKYb3wAt87TKuE77g6WvjuQk14JqYd3K99zV5l8+W9?=
 =?us-ascii?Q?Sd7gr4VcL2mDp4oN8wlfhalmvSviT9aijNETVZJcb/OFgkfwZFELus+CCXtU?=
 =?us-ascii?Q?YoMycaoDdYaeezybRcWyDDlmVsp1/uwi1Y2T4UJo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fa1b009-9912-4137-3d9a-08dcbc7bfb17
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 16:13:06.1459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+4iXRuAtzHq6nIoE75WWkx02qCwN6mOuTw2R/Iy7gHma9HU9bS7doiF2F/D15WVAwDGg4bb8R4iKud7BwMYNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10270

Convert ziirave-wdt.txt to yaml format.

Additional change:
- Add i2c node in example.
- Add ref to watchdog.yaml

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38:
	failed to match any schema with compatible: ['zii,rave-wdt']

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- using original driver submitter and wdt maintainer as maintainter
- add conor dooley review tag
- remove value in milliseconds

Change from v1 to v2
- add ref watchdog.yaml
- Remove timeout-sec
---
 .../bindings/watchdog/zii,rave-wdt.yaml       | 49 +++++++++++++++++++
 .../bindings/watchdog/ziirave-wdt.txt         | 19 -------
 2 files changed, 49 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
new file mode 100644
index 0000000000000..9dbaa941538e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/zii,rave-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac RAVE Watchdog Timer
+
+maintainers:
+  - Martyn Welch <martyn.welch@collabora.co.uk>
+  - Guenter Roeck <linux@roeck-us.net>
+  - Wim Van Sebroeck <wim@iguana.be>
+
+properties:
+  compatible:
+    const: zii,rave-wdt
+
+  reg:
+    maxItems: 1
+    description: i2c slave address of device, usually 0x38
+
+  reset-duration-ms:
+    description:
+      Duration of the pulse generated when the watchdog times
+      out.
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - $ref: watchdog.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        watchdog@38 {
+            compatible = "zii,rave-wdt";
+            reg = <0x38>;
+            timeout-sec = <30>;
+            reset-duration-ms = <30>;
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt b/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
deleted file mode 100644
index 3d878184ec3ff..0000000000000
--- a/Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Zodiac RAVE Watchdog Timer
-
-Required properties:
-- compatible: must be "zii,rave-wdt"
-- reg: i2c slave address of device, usually 0x38
-
-Optional Properties:
-- timeout-sec: Watchdog timeout value in seconds.
-- reset-duration-ms: Duration of the pulse generated when the watchdog times
-  out. Value in milliseconds.
-
-Example:
-
-	watchdog@38 {
-		compatible = "zii,rave-wdt";
-		reg = <0x38>;
-		timeout-sec = <30>;
-		reset-duration-ms = <30>;
-	};
-- 
2.34.1



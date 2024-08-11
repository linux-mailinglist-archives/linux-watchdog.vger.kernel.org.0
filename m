Return-Path: <linux-watchdog+bounces-1480-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB0E94E3A1
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2024 00:05:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BED31C208DA
	for <lists+linux-watchdog@lfdr.de>; Sun, 11 Aug 2024 22:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C3915C127;
	Sun, 11 Aug 2024 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VYgGsPIU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9864D41C75;
	Sun, 11 Aug 2024 22:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723413938; cv=fail; b=D/DoDcEzlojXZ+qRSBhnAVnOXLJD9VYSTeyhBGED4RXJ95IBqo13jZe5/iAkFoe703G6kwrEX8sARx6ADyYjXm9Bu6w9NVGV2buRV1l0tSgwP1LGtWHrIRuucybiLgBcfSF7n0OPvOiWM73HcBeClowHePMLoUOdPBnpD7Cxlkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723413938; c=relaxed/simple;
	bh=5mBA6L8+EyxVstPksjT92kz2N+vaODBZgQHQPQ4Kvt8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fOK6rfL1cYdSeM1DW+yYkWN5HaTxtbEDFnxDlpPyRLaeyCo3OmRe27cRNVeCwXhvaQDVsmK9Zr1F+mxqreTTX734DNumL4iyp9B3yc41GYE1+6gV9ilgkGKz3ormHZOeKeSfiLcacjcj1G/EaWTTFqJSPoVYS7issMStIG5jEZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VYgGsPIU; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QMz7+TmG/LavdrUBUqYQwp44mi6r6a+neeBAS7MXOILRxdQ2Bund2ZT4Kl/rAltIxKDXKQYeRTCnB8rLWgkwH2UjgTgdTbUUzK9f16FfL/MTIIlbF4escBky/jda/OMvxl0tssX26aoZrsA9quHOCFYaSHZrbyDMNvxRgDfUHywiigMa+Xl4W2lQdzgyJmbMHvPqOgbJCFXAoxisBl6lV+C7y3IsEH8fIJyE1903urt+pynvBBhq3hGs7CyrY/7eq6/BMJlMV0nHFrPO2/yCheUbyVZVLz17eC04ga55nPb8QdAGvLVT08sRRe9/QSoCTEJpwbwPTXbKdigruvpUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8nsPm4uW1imL13AXpTJtLCRzR9xoCnvwlhTMXGCxtM=;
 b=Zz+C9/YXjtVHTlaBj7UaEQulGHVs3i7C5IpajWU+A+9VgkDtm69D+Ysm7QKR8dX3NTvWgcITPuHM6X3ujjoszfh7RqJtfjvDcoBg143ATwWoQZDB7acdd7Ys7gI+nGifeFLJSx7y5fLn9errSvrdcJBaAVWjtvNFhYhPWugATcfWIvHRwNOiVBT94sDf56HBgGh44TtDr3X0HSowJ+tto/Fxy6RVE7LtwR/NMsNvXu63VlndQJJIGaG3zRdRiQHIDHVoBP8oGX3fAlRi7caGOZChB2RmxoAaRS8vseCYCfmnqjDcw9Moih3VJZ9c81PDLpKWEgUUUT8vtODpSTK+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8nsPm4uW1imL13AXpTJtLCRzR9xoCnvwlhTMXGCxtM=;
 b=VYgGsPIU9eXfUfR9SzGVPKoc7AJwD7uJzqNWlt2ajjMnxnjEQb985ppenT/twmy+LNsBQvPTIgK0EbVPgQojM5TjpeDpDftv8tXbOqMxxu2aEau1s5qnKwrWzSGUbKskUZDVhDeyDy8DUlc4d0ozdFyPEItXFuUHPCjvFg6Rvvux0MDpPDtcXlt3GnS3o6lxHjczlNKkPgGZoyq2NO3Drd2XS1HlzWceUKYnPL5b+xN3Bh8wAPmnywfUAUAUegsKk+dsma4oQa8yxQo1ad72r1KmyOQNY5N4T5PE+pxuBEYTjI3m/gpBW66sPoKDrnV2nEKdCak0owLY6jdjnOk4nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Sun, 11 Aug
 2024 22:05:33 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.7849.018; Sun, 11 Aug 2024
 22:05:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: watchdog: convert ziirave-wdt.txt to yaml
Date: Sun, 11 Aug 2024 18:05:14 -0400
Message-Id: <20240811220515.3776756-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::9) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU0PR04MB9496:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cc7c6d7-5c78-49bc-2bcb-08dcba51b7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Timsn5QlgSKrUIB0qYK5vOhhOA+BCbW4FTULxTsD5h0ODrUQDeuYXNZZ7Hz?=
 =?us-ascii?Q?EVi1zsAvk8Jm6octOdL9O4zx/8z2Ppfc3TicVZyzy8aD/t75OK++SaRDXTnr?=
 =?us-ascii?Q?hJNPpWHPvE+q34whLEly5VngVs0ShbbPedn3zlK7MEb643xdR4NVABe5dyG7?=
 =?us-ascii?Q?D3wJfmRenwYWdlrcDyKgPB9p980LvMd9lH8rebyY4UjXRh77uil8CMJSMVEx?=
 =?us-ascii?Q?Rvng/gozXeIszf3uTXwg+Vp9MaCM0AavRh/aUjz6LyFINk2inmsnDEbUqvUJ?=
 =?us-ascii?Q?s9NyvWGV8Pwie/TenUtDLOcL31t/gpClxPgaONc3QzEiJq7wwKT0bBe5eTwp?=
 =?us-ascii?Q?usPQdOf+21jkuHk1pDGmwaZBf6xl8KI6+RzqC0l91Zng5d5Gd7H6AanHLIzx?=
 =?us-ascii?Q?tvcqy33B6cuo1BsjrGdmDQhT/HenLgKLIL5GQ5uWqslIfUnZSsTdX/jtoD0t?=
 =?us-ascii?Q?4eLsKzYlXACXwdK+r1X67XFh9xjV4z/0z3q3srHPs+DieMAZqN043VTYEMTw?=
 =?us-ascii?Q?/oZY3fm0iLRdJ5yS2mHcOifSNNtPJrL6hWoLEgvrNXjADD0McBZFOqD0xZIe?=
 =?us-ascii?Q?x27+ZgvCEhBZiTdScpd1DLTl1mKhnIFuv6aWK/kSlGSzhYDTKCtx8E9gfiDM?=
 =?us-ascii?Q?rFVJouVDVS8rEA3bfREjUVM2m1qp+xn7klOvnn/5IlroQIUXlFW2P1I1jj7v?=
 =?us-ascii?Q?YCgz7+zFh049z26pFtqqzCEtmKQj6jQ1KDzkrSeiZeludMeN3SFQmEVFvR0Q?=
 =?us-ascii?Q?LIQhD2BqQB5QMaAmWw5mLbGOEMiYVFL8J0a2zaAPNe0BsLPuEMxUbxPV8MS6?=
 =?us-ascii?Q?e3PgIyFom4opXC71rSp32mbjB0UMzPrk22cej6eMoQNdPRn1inCyQI3UwdTB?=
 =?us-ascii?Q?61YTZp8NrgyiaTJJgXaT/95Lp/CKFoHENhJ6BIZ/eqPkN1PP0qiLbErLERkg?=
 =?us-ascii?Q?IFPeiCBKHlt9eMT96Y/oURuQJjQ2olReUAruOtUz5JsaTWp5YHUHiVxfsfK+?=
 =?us-ascii?Q?Pj4RNy9UPLxzzidLXZb4+S1qPSOdzPjVFmY51eY4Wc8gCNcRM15nQPH5TbWf?=
 =?us-ascii?Q?k38EIw2fzb5K853DLlVOjP5BygBHyMOW9Tdh0x8A2W0tVMx3yxgv4ncr0uaK?=
 =?us-ascii?Q?vshM4CxlObzUcyLTKYIWOrOCw4dt+pyBmteMeJHU04sanqAhqnlRd972810B?=
 =?us-ascii?Q?uzyHO/wI0tMofLyrY1tiOblBoPn30OJMT360hrZ8f2pip92ddSlTL8sPSavv?=
 =?us-ascii?Q?2eaWdlCOq2cKkrj5ddTCLnmGgNctx7y3hcAbRkbkCwkV97NLLtfB5bQ2S4VN?=
 =?us-ascii?Q?HfK18pf5GsixxzQReR2MQb5EkYhRqInEi8V0TXqJb/12j+EizyUPKt5onGG1?=
 =?us-ascii?Q?5M4SPSA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WRtwEyHyUiqLNw4O4+k93J5yQj/SoTlSCTEVXSvY/b8r3VeNJhtzAxxA2zR1?=
 =?us-ascii?Q?puDyXgkuzzRRr2jqzzsf/PvLkPuw/VFIjb54+MVuQIwBkarcKKS4nlDgK2ML?=
 =?us-ascii?Q?2qRuloRjrJ5TAEVoThm3VrjBFmdRieh5a2oe3VT8K6E5rap95g8HfoufgA6p?=
 =?us-ascii?Q?YbZLIYmFZKfSS+HoQot3c/i6NXeB9tYUM/Dj4koJjjNb283pJrORO+QkvGp5?=
 =?us-ascii?Q?zZ9PXVCZYXt87onFTYCzqB4L9wQ8WcGRfKjEXbqmWoKHRqQwkXKahxkg61kr?=
 =?us-ascii?Q?dIJELkMlXJ2gp1TnnlGe/GKOiOOetdSOqIkIhzxDOM13EI57ipFLebjU8MuW?=
 =?us-ascii?Q?IevPrDhLLcjW/+uyD1VAatAjPCbacUwM68WJkThQM4piICcCx+gxFwy3mwAf?=
 =?us-ascii?Q?vIppE0qGkT24EFtFnohMEWedcFXoq1FFbFEZSAlMOxaIEmi5j75xR8OpOFWI?=
 =?us-ascii?Q?066sAmtH+6XCjrcd0KYbytjuYQBtvayecLA/WyXTbVcFyqG5E1RzLjwNf9pi?=
 =?us-ascii?Q?UKS2oRwZMuFEc3/lEO/d6biMQriKt0/BgZ3a8wUPmZuJtLXN+g/0NM+QdmNl?=
 =?us-ascii?Q?dWK/vSgSA9skoz2aWXyIJFDmXaLYH8ufBsYl/KAks5CcrjORnxFffXX9xDCc?=
 =?us-ascii?Q?5M6rwDjcOCmkhX8gehdu+NHC+R+UkL/rWhuvkEp8uOIldrVicfziqOyKZYG5?=
 =?us-ascii?Q?KjH4Ilmn0GfYz748RYIv6w5C79lFKwx+49puqOGID7uN6f7Naua/MDgcuZ4M?=
 =?us-ascii?Q?ezRa6ly3PXG7kQJfgN2vvu4B1whn6vQGcyLjc2ukxXmfkAt5/hgVYMGW20sD?=
 =?us-ascii?Q?w5fJ+0A19j7mfharu5k4NHORQxxsSOg9bYI4N1YHOJe+WyHV+jvd3mvCPYZV?=
 =?us-ascii?Q?t1qm6ISvcktsmueIt8t+cj0tImFGjbS2phUWCl/cILu+eUrPbnOLdCOFYHcC?=
 =?us-ascii?Q?ygub+b9eUfAVJwHQ5UZIT/rF0fCrXNu2g4BaG1lX4WxJls/KoiL36/ITPHug?=
 =?us-ascii?Q?+gY0UuJFdQvlbT4ucRbnV+BAkRjTvOYUtGv/BhbtJc7LVvIu5pACDt4BrLTN?=
 =?us-ascii?Q?C5SlJw+1PkdXOTRz4Nj0SY5o+7bMWoLeNzrjTYFc7EVia5en6kjnJUr4Xs1J?=
 =?us-ascii?Q?ltWGn7nPu1PuXsoWHYaXZvUE+lCZ3vyWb2+rg6h0Ir93CY/GUId2dd1SRHM2?=
 =?us-ascii?Q?+x5gjq045Gwex8G7kenDDPM7tPu9uhQpmzEi9O0rzFe2tFg3mZULuzcnSIX1?=
 =?us-ascii?Q?vadmpWKBsu7fWFS/VUen3AWr79GHVMqIbRanKaGyrD67eV2yiRy5UQyf4wff?=
 =?us-ascii?Q?IZ1o6th2nD6IAqV2Ag9NHM0x0pcw7O86MqQr+KClfhk4LPhUepF6OvOsCpE1?=
 =?us-ascii?Q?PxXo7l5NwfxyZ9NW0nniUQE1Yk0rUxt1tOmza5byyOVFc5C6hRpQ4xWQu2mp?=
 =?us-ascii?Q?D13uxvhsNsC55oX0yrNBUBvG1rpXnGTNXQp0dYkIj2Q0KMKNYcOHmUBSwm05?=
 =?us-ascii?Q?0yKq7Fvt+csyayhLglnUk41bdO5N5m93Fxh23dJWJfzlE3DGL4j4P99chZpd?=
 =?us-ascii?Q?VaCpUBaAlaUEK6KDUEexCjVF9CJGUDzb/HiOqJwx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc7c6d7-5c78-49bc-2bcb-08dcba51b7f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2024 22:05:32.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: STLLNkyk7hFampntb2OJprReM5dsi/r8S+jjlyAkNWbztulpdOr5TuJ8gqwyxxlH+2htS0JTZK7oogpFyvhvbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9496

Convert ziirave-wdt.txt to yaml format.

Additional change:
- Add i2c node in example.

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38:
	failed to match any schema with compatible: ['zii,rave-wdt']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/watchdog/zii,rave-wdt.yaml       | 47 +++++++++++++++++++
 .../bindings/watchdog/ziirave-wdt.txt         | 19 --------
 2 files changed, 47 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
new file mode 100644
index 0000000000000..6c0a16912d7f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/zii,rave-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac RAVE Watchdog Timer
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: zii,rave-wdt
+
+  reg:
+    maxItems: 1
+    description: i2c slave address of device, usually 0x38
+
+  timeout-sec:
+    description: Watchdog timeout value in seconds.
+
+  reset-duration-ms:
+    description:
+      Duration of the pulse generated when the watchdog times
+      out. Value in milliseconds.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
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



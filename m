Return-Path: <linux-watchdog+bounces-1482-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3A294F44B
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2024 18:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D53D9B23DEB
	for <lists+linux-watchdog@lfdr.de>; Mon, 12 Aug 2024 16:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B124A186E47;
	Mon, 12 Aug 2024 16:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KTcdmn7+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013057.outbound.protection.outlook.com [52.101.67.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D6F134AC;
	Mon, 12 Aug 2024 16:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723480115; cv=fail; b=aYbMA3MdThlyuZxQj9U8Eb8b7ctwPClmixfZU502wDZjwfVPH/ffklYdVMLd4F8XXX7qmp5e2UnghIYwJ/1rtS6y96hkPX1Qy9JppRCQ7vuFRAa6DYBZB05tCEij/klq/nlD4SkASP+T7Qm6wl6uAKVYGq/Pw5PD4pmaw1wILjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723480115; c=relaxed/simple;
	bh=en031VsTVDTfk/4P1PoNzQZgq7RbsFV5YOZeQ3smuC4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=BsJh/Pdz2PVcQrtYDyqzYpoulyhn3zgrIWUWBLXD7GEkYTuXpgKQVzwH4NN4TKTZtlBmFlqv2O45ektpAy0aX1UfDpC90M5oWIzLgQXIUtf3hBMUlY/8cX1xGahlaqpMrirkVNXI2D4ubwkFZxmncjiRNv0/o1zmGdqB3Rh8pvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KTcdmn7+; arc=fail smtp.client-ip=52.101.67.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BESQAxKsBylIwhXN0DkHKYsMFQhtOLsR4XJxyUgPlJODBle4mvkpfus7iVu6xBtnBf8QNuJX9V358cZCOx+CQVXOv/bdQOHZfUv/pn5mLb4aW8oa6kZP+z5HJQC3diqQ9/1n2M1EcIOD1ZQIiGkcaINCDa1JCGvTos9TmLXzUHr7X/lsjKx8sqoryUqZGjCEWktwlLQUB1f4Hc9sw7XgnR4WDChVekRjAwVlBWwobPnLhOxPyR0HwU+GbjICMOpnR9xolMd6RSLgoBHUS45M1mt9k0KMIcr/RhjqZ0UvGzuMm9OLMl4eor9tNtvlQdGM/5Utedugbn+QpExiExBTjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDbx1TLFLpdJ/PRpLPJgHSJavQe52YiuPdkpRAM5x/w=;
 b=NVTzK3q0SHpD3JXNkwXZgrBBlEfBthPFFTpMxHhomdLmrxzq61XqbvS7XfatwUx/Z6OuojJHDalpLRm1yBcnwbhfpm5+AdyOwCTxgw97gKB6fu2upk8FApCa1TEuKSJ2PVuX4h72tSGo29mZDvzsDsFfCVnY1lHADqCyJNQAdrNl53Mu1q936o/g9FH1kI3Rw+6NMD4t1RGJG09YZ3oylgLiVGCbI6nXuDFAjstmk+V1LSYuDgR90Y8zTRmAIiVJHueUdqmIt6j8EK/oT5zkOFAly8EM7QbTDEyk1prIgdydV0zjOeqg3f1nUoGOiL0cB9gYiZeoHFY03o2+80it/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDbx1TLFLpdJ/PRpLPJgHSJavQe52YiuPdkpRAM5x/w=;
 b=KTcdmn7+1gYgZvvCU2QmobDmsm4TubNHt3yz1s03hpvSghDabFk5qRpF46Px3gZtMl/A0xm6uppKLDDzG5NJ7nuI1aykJ+BdRmQm51w/AFT37xLPEj1AgZWyBIxdQ2KDOi/6kifsAJQUSbn+qlLyWq+w8mJ7eppZLrdA1dN6X233keAsKiPHGaoIjE534Jt7FGWnw0rVMC0LQjCY5QwTCkgrkKrVg/9OmP/+v7pzJKKtfz5I8zKS8v5vCz1x1gzE37ufJj10ZV7pOpSAP9kqxhqvCEngyEunlFOQHAUyT6pv6uGzpJW6F8KsRxRTg00tV8CtaAHLc3ILq3sEe01dxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6941.eurprd04.prod.outlook.com (2603:10a6:803:12e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 16:28:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.7849.019; Mon, 12 Aug 2024
 16:28:28 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: watchdog: convert ziirave-wdt.txt to yaml
Date: Mon, 12 Aug 2024 12:28:09 -0400
Message-Id: <20240812162810.3812802-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0026.namprd10.prod.outlook.com
 (2603:10b6:a03:255::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: cf60140b-b4e7-4955-d793-08dcbaebcc04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VO1iOjVzwprOuOH6HOd+vnRyxOEX5O0tUjMbpMhXdn+wvsylaz1kWBvfoULL?=
 =?us-ascii?Q?yeuvDRoXIu7lEDpy6ldSjuWbb91vN0wwR3x3MjZSgsunu26j7jRn0Fu7Gmlm?=
 =?us-ascii?Q?rGKnzx2OEE/g0eP4zn268IIhq6Qku9gZGDWF//e8fe6bBBFyNb5ceAaUXJN0?=
 =?us-ascii?Q?SJFfAjmFNVMUQSNKzgpFE7HKw+8/yARwzUjYh51/gaJPkF+GQsTq1H6L9vF6?=
 =?us-ascii?Q?9OuN6GS4xGEws7Bf6HbBYl0Ye/VJxfpvaqtu5WV0ryNU8OXhJ9nGeVIKDrOJ?=
 =?us-ascii?Q?7HotlixE2LqG/YloRmJFAzcGyqogRu4aWnDlA32Oxrk/lAkssxnGwMZrEUqf?=
 =?us-ascii?Q?X5tycsB+opbqeVFxbcrDhtAWcrmUKM39jh3+BkRw18KUs/VUAivAt3ueWss5?=
 =?us-ascii?Q?Y72+UZQ4PYatC5PmjBT18fmO3/yHO66szr3jlEIPKTQCAts/wpQPkQGHjo9a?=
 =?us-ascii?Q?melWQdztwdIZOP6ppNdv7E+XM+AohfhBMlcqdhp83Eiie6sChoy5BE9tjJRK?=
 =?us-ascii?Q?WdAc2eA1de9P1ULcVeM4oh8WCffmICbJrymJpeaWV3CsdlcjId5pAwY82/iU?=
 =?us-ascii?Q?xvfLVNuPZ/Vqj3fdBB7OSM5mYG3wIlbBLABm3HITUi7jM5VxkyN8FEIF55Yw?=
 =?us-ascii?Q?zFV//BRIy32dESEL7K3Q44XgTUXnzt7hyrmxdMvF7oWy2vbhHTAR8y+ecRp7?=
 =?us-ascii?Q?bTbS5fNCdyf6Ux1lW9i03WTW54383iMbf2YKoySU+5oF4PFiZYj0oSmdLpfA?=
 =?us-ascii?Q?vrTXAr81WAC4jRR5rr0YadSJTB+L6w0KJfYrggS7XRBhjOoCERXsQlm28f20?=
 =?us-ascii?Q?lWSjtGKlAk3/eQBhO3QdGwHfDNWU6Iz8NgjouBxAvj7QqSNXefEX6OgHCMNz?=
 =?us-ascii?Q?Ur8f8Vi96Jc89gjz8Nukxwbum+i3jvxyscrrdcDAzZ6d/aYXjh8fDFQynhfK?=
 =?us-ascii?Q?pOTsnzp1mAWqRzKhXmu5ajixuGR/vxBukUK6enfToo+Gsnu4q7FWaZPurSJj?=
 =?us-ascii?Q?XaDX/xGs05WrrSG66lZiLZiV2IAkpT77ayXCMwJdHlEcZgaPR4PhkX3/FoVy?=
 =?us-ascii?Q?n0BlF3t1sPmsxlmwQ55rSMtj3xqyG6AIcHDO+5rcS/Af3ks8eYdj5ybjIEK3?=
 =?us-ascii?Q?X4dN+RB65QobDquZO1/JEFa26NQXjygJUqVojz9+ofxQlYTC+vz7cfllrBT3?=
 =?us-ascii?Q?VwNTCEx9a4AKGStuTZN0vOG9OZ5Ittjz+pSOJ8Du+nFwJ/GxOy6uhIfj/qob?=
 =?us-ascii?Q?6KWnYe2L27ha05BquiqiEzCEOyM9E/+8P4HB6ynpZbj84dyw1E7A6xRKY5iG?=
 =?us-ascii?Q?IAJiua2ix/ju+xJi/2vUw6+l5cGhhvISluwHMi9Udq/AFVlCT/CKP/kRwswa?=
 =?us-ascii?Q?H8tfRYI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V4Rhl7+dXB6Jf/R4/Mx4HUuyh+LtnEHVBYHlJUEcX3+DLnEGFdSdxGWPSzdY?=
 =?us-ascii?Q?EFf092DLl9UZMbmc3CqEE29T4PN+prJwTk1VRUoEatyyMWDqM49RKPELygVM?=
 =?us-ascii?Q?sN/A07itkwMLFPw0G1L3kdTUvIuWPX4V93434AZ8ubx37mJujlBOXTLxcH4+?=
 =?us-ascii?Q?SVG9mWol+dJTz9r929Ctn+ddNwO0x8xllE8EWr3WB4k5rMW/66jyPw67Em0T?=
 =?us-ascii?Q?rbyTGC1aApe6DLGcrPXbasYHb93pew2vSOrlWaLYbdNwpErkmirXBNJZc6I3?=
 =?us-ascii?Q?FQEByRcrMwL33MrngQsb2N1Z0qs6ErGXZKQ0xF01VOhRBkG5nI8pR0Ng0ujG?=
 =?us-ascii?Q?/aFvPh/A9j+nCZ41ZxQ+Djq3XiKPV27sH8w2CTBD0W8msrGnP2kzPrH+wMT9?=
 =?us-ascii?Q?OcWK62H7/VfpxQLyHcgwxQbpgX8j5xJ4fC3a7zDFNnjtuio2Y86f1LvFt1Uz?=
 =?us-ascii?Q?m/9HgJnLeqgXhBsIWIxkcsdUTNcvOi8zR3I89cGcK1jtW4PUSq2FUnAmGkOF?=
 =?us-ascii?Q?3SImrgVonXYzwt58iOPsciZWSNgIrzUaYujfQ+G4d+cLfQWJxcZNJBkgy0Rb?=
 =?us-ascii?Q?NU/2X6HTX/+iUqt3/1gx0reUXVad/NTmMCdAUFomuDBro3VxTBRocZs9wJsH?=
 =?us-ascii?Q?XeLX+dEG7NO6ZxbN4xYr93jR4MzdVDGh5lLQUPUDyrtByI7DPM+sAceGdwGs?=
 =?us-ascii?Q?YUiK9280YuTEB1SLaa31FJvcXXiquuJ38EjWiasZ1FZbDGVBHxCY3LnNT1d1?=
 =?us-ascii?Q?49La3CRaRzUQb0JA1l7OxDkT5KM878Y10/OOrsEVkGGfi6jpRmm8gjeGqcWA?=
 =?us-ascii?Q?EfDRAkLfIxmYTNRRhcn709ITprCi1zey7YopJ0c2m79Mh0GzlKYb73aAxZ60?=
 =?us-ascii?Q?G+MzupcwLB1y2VfuQkYkIFFkm0J3L9z0aSDcVUykOCXNMHkepCTajdft9LRx?=
 =?us-ascii?Q?BX684F1IyZANIHWV0X5DCd1B6xKeveWE698cMQEsdyc/SK0HkYV2++wLdpfG?=
 =?us-ascii?Q?kxZgh9t0Jx/kCqSJFoXe5ZKNl9YXFD2vkZwsY+dj8ZUIYjyeRgAPu3+vCaXl?=
 =?us-ascii?Q?UZeKPbQZ2/zA7p7xKyh8R+WeNsYJb/56r6AFgl6tIc3OLxNWbf4E7pkWhnat?=
 =?us-ascii?Q?cg9x8kH1QihB+ECIX6oXJ/oSLfNFFCXZ3zG/88yHSDPY9PMEOKzn2w/HzeEF?=
 =?us-ascii?Q?R0PV4EFJaVq0hW3dvRARP7DhFnisNrrRYenjphFM28y9I9RCOqYvd0ZI6Rs4?=
 =?us-ascii?Q?ZdC9fFPn6vFgVWov3QESjSn4peozkJqRnyNUbSYuaMk+XgKOQJvkPcjIUEe2?=
 =?us-ascii?Q?CA9Gd4dZYqkPjvqVjWUXD2uzswDK8O595s4Od5N9smcCfWqF70Va+KsmsJAG?=
 =?us-ascii?Q?PD4JrZs7FFc6LXE9AGUNsSlL81h788GkOOxuHHeBxGRd/2oqdaitFA3zkC7y?=
 =?us-ascii?Q?s61yie2A1aemxNGPhXePft13akgKEp96qmLJwOOkz94P9kSexrxpcjDcrfRx?=
 =?us-ascii?Q?UEp1HY6wOtxQQil63LxPt74gc+hdJ+43m4nbBTwp0jL9Rqpo9FyweYx3anNP?=
 =?us-ascii?Q?KRFLLeDIzYJqf5yVs9o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf60140b-b4e7-4955-d793-08dcbaebcc04
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 16:28:28.4236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lReGXUmlFvdhxX33KajSrWUaXxRX+WzalPboyfGTccSghf33kne5DxgpfY37PutT0mscg0hXjbPl82CBZ1qYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6941

Convert ziirave-wdt.txt to yaml format.

Additional change:
- Add i2c node in example.
- Add ref to watchdog.yaml

Fix below warning:
arch/arm64/boot/dts/freescale/imx8mq-zii-ultra-rmb3.dtb: /soc@0/bus@30800000/i2c@30a40000/watchdog@38:
	failed to match any schema with compatible: ['zii,rave-wdt']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- add ref watchdog.yaml
- Remove timeout-sec
---
 .../bindings/watchdog/zii,rave-wdt.yaml       | 47 +++++++++++++++++++
 .../bindings/watchdog/ziirave-wdt.txt         | 19 --------
 2 files changed, 47 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ziirave-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-wdt.yaml
new file mode 100644
index 0000000000000..0206d9ddf872d
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
+  reset-duration-ms:
+    description:
+      Duration of the pulse generated when the watchdog times
+      out. Value in milliseconds.
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



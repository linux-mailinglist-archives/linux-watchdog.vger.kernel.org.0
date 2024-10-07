Return-Path: <linux-watchdog+bounces-2133-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C321993916
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 23:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64B071C2314A
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Oct 2024 21:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106991DE894;
	Mon,  7 Oct 2024 21:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aQJ0lqDs"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDEF1DE3D4;
	Mon,  7 Oct 2024 21:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728336295; cv=fail; b=F/x0+HtFwvbWBbIUfeRfMAcG7+3Zu+J3HcnrvluYEz09bt5FUas5Vo/rFsCFihVrB+IYa5ZUsVHrHsh6+RU6yt7jhMqI72iJarIl51mhTRL7lo/QV93vXi2WvquBW50MtgvhrBjC7Vvw4XrAvjF9nAWGb4Ht0jpVwFUIT3Gp3N0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728336295; c=relaxed/simple;
	bh=JlRnnnVLdMiP3eKg3ymz9zpkVVRCaIVAvhldkFKLgZA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GJwE35aI7WtGiGcSTS2DRUyd8KAwJMM/2Qgb4SLlpzoxEeRO2J4zY39PzLoxP3sBAChDHK/HTUt+Dw/K0AvcnSVrcFJflBOgeNUL/X3BIvJ1Br8rUqr87FUFwvpeWkN30WHUFSfxoInw0FWGxwSkA9DbDMMPlyCVRqKlPZVe3Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aQJ0lqDs; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hT9s8scqDTC+IisuPKrZji0zQQaOajTVhpjBLG4Vtai0WhYxoGzcPzhpdxqFsnr8OlJmlDkfV007muAGBY7MmlPtv265pGkQe2AwCP04QJig4px9edBMs/ore/jaxg+ourmgztr2r2BS1C7ArBFAgXFD6gOwcEMMct+oKvfnBjtld2J0oVCT6oBX1nzvCS4fc/EAcZ+oQG1BIB8V6ylvK6i5HWrS3dh2WNwjIwhPIv3CV0fvBt6E4n3kWgWcjh43Ydue0UTBfLkzvpMeOsfndNIWxe9tqnDzT6UZqdh8p7gpFrZHlVUiHCJrh6yq4NJjyUcJJVhEsGqfZcdzRMc2xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vda5Pqpj/fgvR932jI+3YgmY6sAzls2no5+SZM/wP/s=;
 b=f6w5Pc3WOlw68YN1Ra/e0y0vMr2TxitflAcm2GN1W/dlpCZ0rhPHfnUIle76CWYOvdF1QyRpYC3nKfT+N4b+zwBwUjNQLHHk7o7X0Bhj4AuvNT6vjLmC96DOWdwZKPLjir+zEOokyAw0AuUwnT26KwW5Uqg9O94cKTJ7aW+pPk4woQVaj4lOTL1ITIq2Ppp3iq1hxNEDa2wI+07zuKMbdv/+65vhfA1oVwsa5lmlsOKeheel4DDaDgh07piapMa6y78uQp7OmGmVJxHkqZi10JUDUJLFN4PfZgjmxkGOD3uLGEOvjhxW4nTILAFNvD8wt4yRP/lj2ajimvFhU++0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vda5Pqpj/fgvR932jI+3YgmY6sAzls2no5+SZM/wP/s=;
 b=aQJ0lqDs/ZC5zv3Ny+hIXZKfIrLcnIdhTog44ctv0s8oMNJU4Xmcu17W0MIboVzoMKMARd/PL+Y1CHDiN2FOx37CIyp/X4shRrkk7TKODjBCnwWzjxrSmv/V4NTPOx7KN53dYhmOqHldhu5eV02Xg1AvNNnbJxbY7ZCXbPxyahDBV/2EifgNx7ALDvDgzR1Gy4h/eOR98JHWhDvuy0s3cTgM2GI4afYAXEpqRwY8HuWcItQK8MUH+w6uVH/cklHkQuQjeEN1bXcQISYOVPFIqh659EZTQnvYtpYGqtWj8MRTvJpVYttefqj1AA37etD7s8Oj3K1EaeVrZbFHCZK+RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB6976.eurprd04.prod.outlook.com (2603:10a6:803:130::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 21:24:50 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8026.019; Mon, 7 Oct 2024
 21:24:50 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property
Date: Mon,  7 Oct 2024 17:24:33 -0400
Message-Id: <20241007212434.895521-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB6976:EE_
X-MS-Office365-Filtering-Correlation-Id: 983c7a48-00f7-4051-efe8-08dce71679f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?exzWDdzlFickdKR0YOD+XxilprggGjR+FBUf8hRL6g1HEu+FKawGr0OzZ0nb?=
 =?us-ascii?Q?x2jQSHv3nQYzCrImgMUUoTjxTD12C8HmMAIiwz+J5uUxD21WLbILR9tzKQHQ?=
 =?us-ascii?Q?1p/5nnz4O0euxg+i9Kj08JAhgcR3fVWe+8bAOYobiGcyRZjH16Lll7gNoCYd?=
 =?us-ascii?Q?3ZsWhQ9i0lJz3fAgnFbyzVIb2SmQTV0tnVHQlUV6IMNKn0kjmyTWv86gLwAs?=
 =?us-ascii?Q?GSxIIEqedP8iM43PRdQ/bYosms4pn78OhnwlMv44Jo12yr/fMDYFtX7Qbsc6?=
 =?us-ascii?Q?ImIx6o84/siyYrAC5OHYi3v4upd7XsukVYxRXH/u56ftTPPDaoMpe8OKgyGf?=
 =?us-ascii?Q?xS+EgsC0keOCDoGsXQYnrzhdl54tW1trn+Zi+R287kLamvrBvIpA/fcMCjCI?=
 =?us-ascii?Q?tiFEHJ3pA3FG79VydoylXvFpHmJzeGguEjIBRrbeZlacCLyg1U/sfY2OM/nM?=
 =?us-ascii?Q?O/PbKUiGLhAzJcHD/iuP30m+i1jTux7Si+2yXsEiRzoHdw7/gb9lzV8M0sKF?=
 =?us-ascii?Q?AHVlWE6Y6ypjcxFuZd40sGSKhngm8YxPw2Y3KZFI56NuUVqTlv2MhN5rUJC9?=
 =?us-ascii?Q?L6p8s4ovR1RQ8gPopNLJfv+G33OwnKRpvx6xNkCIk50M1zx1818WMyHISO+e?=
 =?us-ascii?Q?b0668/QzvewLcZOdKYn6uJ5U8MvCfX86NfTKwQWnoOuAlQ3UL8GmKZQAtPuN?=
 =?us-ascii?Q?/Fe1yk6BvvB9tquKmvalptTJc4pjS7Yi0xVYZTiCtIt15IssL3o+pci8+m7M?=
 =?us-ascii?Q?dFCJVdJD7W4FgruRaK2Tma+ILhdKVW0EXhl6Ia71kL23QlSHB0vSiuzWz4SV?=
 =?us-ascii?Q?1/8jCeSZye7Bfrzz2jdTAqRV3CuNqqo8Tq9SMhBAaqQ2umVp3WCa/ASiyh4h?=
 =?us-ascii?Q?nUzSI7udj09AI6X93H2mLSNlGkNPoOjnr6Dn6BxEinJbBMLgt53p2UHu6NDY?=
 =?us-ascii?Q?7oHyHFdGfoRQqAIBhiYPLET7NYEfZYQWde/y8sjGlcEgSFJ4xO7SDKk9VYb0?=
 =?us-ascii?Q?JAkUjZlnoVoDBDQWetGGgli51yt8rYqvJAgppVWWfldKcmtAdp/DRk+wixA4?=
 =?us-ascii?Q?3eSVgQsGr/tK9guxh4hlyRekUj0eZNUNX0HFhIgRCUGVwlmzu7kV1fefVIKG?=
 =?us-ascii?Q?9096dwQvy7oLa2aWJ1Cp1NXR+gU41De94Un4LKEgVw2yGudiClMk57nyRZOs?=
 =?us-ascii?Q?UXj5PDsznqpzSIeualtsxeLuwRPJXzsMyf01P22HCajLu4XWJEL3ci8KBKgH?=
 =?us-ascii?Q?7igtdwlnbzi25GsSTwMtgcexlA52bAW3Jl66wSMvZ7PeEu0j4xBTIWX9uJie?=
 =?us-ascii?Q?aBLA3oD1wNrcqM0O4pHZdqB5bdXzOofZjiTJ0zuGWDToJbzFkmv7G4CRU0SP?=
 =?us-ascii?Q?9zTX4Qw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xdg5pF8o3w4G/aYHBc12913hW4NJtaIkPqJQ6hDsN2aIr7QrPQqeb1xCWZuP?=
 =?us-ascii?Q?D38GEWyM4m09xdYo/ntjwF1STMrsjVFHq2lGHm1alJnyesvD3xzgw+DqpGNi?=
 =?us-ascii?Q?hyRVxoRGycpwdsZtvl1KXlautnFWGyU2N6JyZBJIDxu5f6e7s8Ai7yu/4u+w?=
 =?us-ascii?Q?Oakb2WdTYxUJbVktQQfzBI3ehiWZg82Dd42OVuIb/a+0kWCjxMv96uZqp6MH?=
 =?us-ascii?Q?VghER4eDVibcOms/C1HnT+whWE39VO2H+SNTaw1OtdqTFONJQpVg8tWy6KgP?=
 =?us-ascii?Q?W1KXBR/XrnhlEilWjWkf3aKACbnKdoE0OEYkvcPrjzxt3CSdt98poLeLPokj?=
 =?us-ascii?Q?KLjMCatsDWtG5TfHwlelRmZV1DhTx+bWaYTuBKAjquYbto7xQDkhMb4i9soI?=
 =?us-ascii?Q?vayFoOha/SfLVPC/68aXAW0MIs2bKw42ODtB+Xm6Lh8rMuuJv3DhTEkQYqJg?=
 =?us-ascii?Q?SoKxKaxGZmsGtShWtlEU7gNUT3TzM3fzTHPSfB8agBLg5oV99JhNHE+kCGVk?=
 =?us-ascii?Q?2rQzttQTXu/eo9UpQS47rN/yL1essBl/zarsT97BQ4Xk2Hg7JkyyLLEfwa+v?=
 =?us-ascii?Q?BC/tYYoh7j2Hr3JpV1SosBmiDKvwgI8z0x402rFSrwM2f85Y9CjEPkpCpYn7?=
 =?us-ascii?Q?CloD9RXAa3QKputDAwl+dZxZXXJCLenkRt0Vk3gfeQGZMEPHoWlsqsSthU4Y?=
 =?us-ascii?Q?EpEo4OngwEA6/l8rY3m2jkMIH7JghcbNjq5d7SWxZrt9LRcflKhTzAOGhPHa?=
 =?us-ascii?Q?iUTM8Kb5TKLjL8eY88rW1pld3gokBeAmXZb+JqF+rMWMv1rs/Q4jg5nOXt1w?=
 =?us-ascii?Q?wleoRv9uZB5pv5khS87KQ1U4LJhU6VHBAA+qUmQ/ZZ9Apl/nNQxKEbRehJ2s?=
 =?us-ascii?Q?Th0aAIJCGNcu7Gb81P1X/BeFHlq8PzdHLav4R6zyeoAznFzOUd30PKIWB6dC?=
 =?us-ascii?Q?CVhkZmk6HUEad4zkilWAqJM6p4npxnFbQZC6l3MmtKnDMJOvdhYrNkMz8PH4?=
 =?us-ascii?Q?x3+NiayWvcfy7uoTAWKb+bKbdsgkLiAInbUrOsppCXwqJB0uzcNWt1xIJ+TX?=
 =?us-ascii?Q?XcEH1OmyfMu/LRrnaxE38pSM3lWacqNoq6qlo3oPFJ2pc6kB/kpf8Nx4VdE8?=
 =?us-ascii?Q?CMKE7Ih03U/Skby+I9MS+C/MVzxmE0lbMRBx4fD4cu/Q4gYHBDzVDrON7AoS?=
 =?us-ascii?Q?RwVy5rMGs9vnSwmZ7zNWdy3NzgskDCNaOipzAtcTpalCgWncEJdypZZdrtSC?=
 =?us-ascii?Q?sfEnVGLP+xKmKA/2pEeV/pBGaPiRc4FZjm/02vnuQ2Zjrbvn/F8K47RnVSKp?=
 =?us-ascii?Q?m0p+SUZgn8HOndwgjXDT9jI9IFZ2tsMzogrfwy9YwOqRb8pALYTfvZEDWpli?=
 =?us-ascii?Q?PxrqsudfEzrwzRuTIwaD/sM3Vi+J4hlEaBgDNpBNx9NONruaZ0nePfWdNdsZ?=
 =?us-ascii?Q?K5RC55ogUGb7blfsO1FBvuszv7X3hiOkOwaLc5vNNj0EcyM7vYXGTujtGzMA?=
 =?us-ascii?Q?oYGXDxj/Iee1GMtb1ffmhzTavfLkSjM3+XHVmY7BDlgRQ0wIRHJMr1PAEP3e?=
 =?us-ascii?Q?LcMBC2e/tMS2nh1bvPKEhFk+9KPgZJ08E1FvlhWY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 983c7a48-00f7-4051-efe8-08dce71679f0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 21:24:50.2423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmwzZtHnnR4ab0NzKf/EwogXBI/yIlJa7uFqfCsQKjDi6tUepXnGZLgq18BBH2t6GGlcWiMc5W6Z6spPecBaMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6976

From: Animesh Agarwal <animeshagarwal28@gmail.com>

Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. Only
allow big-endian property for ls1012a and ls1043a.

Fix dtbs_check errors.
arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
    Unevaluated properties are not allowed ('big-endian' was unexpected)

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Change from v1 to v2:
  only allow big endian for layerscape platform.

previous post at:
https://lore.kernel.org/imx/20240806103819.10890-1-animeshagarwal28@gmail.com/

check spec, and dump watch dog reset value
at ls1043a platform.

0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0

It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian()
to handle endian.

So this change is corret.

big-endian for wdt is necessary
---
 .../devicetree/bindings/watchdog/fsl-imx-wdt.yaml  | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 36b836d0620c9..0da953cb71272 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -48,6 +48,8 @@ properties:
   clocks:
     maxItems: 1
 
+  big-endian: true
+
   fsl,ext-reset-output:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
@@ -93,6 +95,18 @@ allOf:
       properties:
         fsl,suspend-in-wait: false
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - fsl,ls1012a-wdt
+                - fsl,ls1043a-wdt
+    then:
+      properties:
+        big-endian: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1



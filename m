Return-Path: <linux-watchdog+bounces-3067-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 892D3A55265
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Mar 2025 18:09:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC9D318863B9
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Mar 2025 17:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443E523DE85;
	Thu,  6 Mar 2025 17:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cDWuoLUY"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C2D18C01D;
	Thu,  6 Mar 2025 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280810; cv=fail; b=GYscnVYGpJa2+q3DOKWEGMkvYpip1gHC8mfuF6j2ORDwVq26e+UBlMJ5QWQwYsOhkVjptSVtPjeHslysv1H2DRn56lrtd+LsqBkaI1Uha+NO0N2zlOgVNMahSTW151dr8smueM8ZWnr0cbXrVsFgsVN4qIgAZgsM5QUYn4atrVM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280810; c=relaxed/simple;
	bh=q69Wcap+dR+jBHD7evNrid+s1HCNKcxLf5IPBUrRDIc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=H7P2FohaiXAiE762oxGMIASkCv4ct67MVwmL34xXcG5O7hUHdlS+5I7/j8Apyr9jZBeDWP49jVQdBqysoxmInnZabCoQIIKR8Y9ihNKMH/2WqePR1vJyqER8/b6dLZztBY+RzWqIG02+clUFrADgm+ORoJmuoQmJMnSJRPjGCEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cDWuoLUY; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yBdpCwZ/2C7NIBm+pxvrr+dDu6I2N+lgRpges5naQ1SCEQca9QGexUCCKtRFKBjK+a9RRJGIZc80/kwd6MbRAnC143iRd6TIqRF1aZb9VDrXSRzZcMKu/aR8svz+M/0fYAbP9AMDURmvU7gfhGkKo4ucSX+RShXzmsYx7cCj7jiX/Q87wkJ2gVBUxftW4jA7L+SjTyxgMI2UXgGMER5qPURQTRL+ZKArGRXP3DZeLJOs6H8hHOpaArIbQS/k54WvqgZNs8SfJMskR++F/Yu4ztMOxVUIsO/PMRAwHid+WZ4dPD8Wkf8UjSbihiily298zMQaxAo5aKkMdtEUne+bcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PawRMDD2ocz/RPxW0UustzNT+f6H0frkwH/deQhbkME=;
 b=VFi0GVuwRhJxah7oPlTreVj1061n/9NG+7iauIxAEH4/Dz1bQV2wXOx9MgAFMraXNC5mPhBzvQKYk06JwM91tUjgkXG6VSNBMtB7Mf4VaUwg1nXzpyAMDQRYFcWHjm4lta291NDpXXhkvp33Jj8GwdggkXaQcldwe8GuBRunBzdb0zQaLW7+4AD41mgJJ/IyynmYBJdZ3z++nv0djJ+3SzojSLd5u/bd9k/zGBM4zmUPwuUZV03qIyyNqoFLDANSO63rbilePvECz9l6RCKUbt/2AqVgRkVl2hzTvCSiYIga7UQksRyiRfYHJ/BrXQQ6qXfN28gwE62RzUbmm/n8fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PawRMDD2ocz/RPxW0UustzNT+f6H0frkwH/deQhbkME=;
 b=cDWuoLUY73HV2SMerokte6x/crnI/nqk7hYAEyKLtAnzKpn4yW4uF6pEWXMYZEIxnREbc51oKAWSPYvTRc6S9wfVNqpkaWeMLMCcvRq6QMI7N/RqiZkdGnE6y46B0ToN3uaZgpMdhdoFa0lrjQwZY763LN4dyka1zj5PwwZfgkgwLLjUvy8Q/V75xYmOMaUoiWBuR3t9/zPgFfGAbkgHg09yh/tVuRZ5oQkgD3W6ghxpM7MG2KFr2ju0B95KYCarlQzn3OYHC5Z0fI02X52xa0NNfIc3RlaFTzsdJgHWHdVnJtlhCA+1t2BsSlLldzOQ19Tujk4oZ+NW6HHLHNKzeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10680.eurprd04.prod.outlook.com (2603:10a6:150:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Thu, 6 Mar
 2025 17:06:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 17:06:45 +0000
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
Subject: [PATCH] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add i.MX94 support
Date: Thu,  6 Mar 2025 12:06:28 -0500
Message-Id: <20250306170628.236422-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0038.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::13) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10680:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c6f2db3-c2c4-4fd1-aeba-08dd5cd145f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D/+55/Bx0MDYEn8wExm7kx0rlFzfxR1dO110OdoPy1+WyXmOb942JdwUTSHd?=
 =?us-ascii?Q?B0ZbGxTjvCHUvNlovgw3RR+wRAyUJrHdgLsE9ZsEl9JiNr5kcWhfP6B4ovCw?=
 =?us-ascii?Q?wnBpdXo639ZzL9A/+MMk50D2Y2VRCOoC5FuXQWmx++XgadTBwpgtqUCNUwhp?=
 =?us-ascii?Q?lCGgP3CuDQp8PFBKUmyHHFivwiAbY+DhJ8Kk0/HTvrHz5wARlNseexMU/TfW?=
 =?us-ascii?Q?dUg7sG025UrpmDE5wLtHCmOEt8u6GOzqcje5/HKAAwHNzEwE+mU1T2rdqkqV?=
 =?us-ascii?Q?YhY59zc3U1/jneyt/74RWq36hDH/SUDnuFSneJ/GpzZSbR1DVxNF+MEwdgQV?=
 =?us-ascii?Q?831MX73u22NaQwcQf8tIKCt+gsQD0i0SdPF53tUbZ0oWOYWxl+9X95DHtdLI?=
 =?us-ascii?Q?3UY/B63pb7hmiQkeS58NqVU1T4k1FCRFvrHqQt4QxMnW1Xj9/CGaiGXNvVAN?=
 =?us-ascii?Q?1JgKbUd+Co51Rjn+JprkPBY97Rjt7omGnGeA4Z7dU+UhzXd86tZ4nVodqSZe?=
 =?us-ascii?Q?hlnzdFTxPPP5rB1neWlL1t4R6xt7IwSu163sPX1SYEELTwIbZc0ydPieCuWN?=
 =?us-ascii?Q?gtchSM46V1T5dAVgWlvU9OOOXUjTrfyMY4db1a1kbpLpGnIHuVdPfi5EJEx2?=
 =?us-ascii?Q?QoMc83/Pxa0d6x00Sy1AZTNAOVrWcw9LIpvKrQln4ggtMyUi6T9dU/mUsqmp?=
 =?us-ascii?Q?99JvjZjlsKhN/uamsJt6k9mXUbENxOeHJZ2d+fbCMPL8SvJCiNWa0NiEmr+w?=
 =?us-ascii?Q?ugvKqdpGmqVr7YL3rpvMJhc/bwyZURUpaT8aJOGOr2bkC2eB0GUsa/earsMc?=
 =?us-ascii?Q?fp6XbdDKKDtTAkLJEEHTxDpUbE/LDkDPbY/CM9qtwO7Fqg4yoU6MxS+CPm16?=
 =?us-ascii?Q?QiGFe9gSsQq9iJo/HXxIaDd7a96gkBUojjd2z9h561Nq4YouRlHTT5o+CPFF?=
 =?us-ascii?Q?rsVWnYViHfV+jY1Ch2600jKhH609xS3Icdq88RoqwijZe/xWODqn9N9dNUlp?=
 =?us-ascii?Q?CVN5f0UWf0Pze4qaGFzwLTD/cPvGmgQll0do+x0ae1om08SlC5DLlYhNPbeu?=
 =?us-ascii?Q?sWiYaG517s0JkBva+X/LzJHoGFop/+3xFeGu3FxE8Jx92XuFv/V9laHJdmiK?=
 =?us-ascii?Q?PYSKeA7BlLV1b1A/H5yj4cBN6z952DTAFEKOOuu52b41y1dJNWrYhtylpDtI?=
 =?us-ascii?Q?gKx8D930g42t4H0o7ge1HNGqMXYA8GKB9ZUAshIYeQtVW946wh8Kzth2SlcU?=
 =?us-ascii?Q?+8JoYUKmWvebK1iU0cwPeACEpGzpvxIx5sDJAB5oT8iVPuPxJsOoK2Dsk3jq?=
 =?us-ascii?Q?mJsieLVSIuNHFYMt0tFkZieOguvhCh7OmP2/AD7JCvHwFsoSXiasjBjwviAH?=
 =?us-ascii?Q?hchVWbV/fh/YZLO5KlvR/zpgCltiI+sr5SSl7EKEa4Hoj2so7swHQkz41d3J?=
 =?us-ascii?Q?nbUqtJACxF8wN3Q/zTC/dbyCAFQoX6gSTdOLjkz89ctSEYwWLCHyUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oG7CXzq47RePVir+I/cyHvEh01n+QkPP3UOFjjOYGP2pJJCiuj7C7CG0uSLk?=
 =?us-ascii?Q?sUpW9q4bahIWjn+undK4hP92bCNuQrcm60IrPkagrZQwLcJigm0r3D8YKMIL?=
 =?us-ascii?Q?cJcic2mFWwTsj2W6pXSaCWzM5cIfDw0PWPQ5ZRCJzG4c5h3V7ivpFXhkfQk6?=
 =?us-ascii?Q?K0snPiN4X4OpY9asDHLcy8W6ejG9hIzlsbGUsLndta4WsH+ER0TwuQTx/7xW?=
 =?us-ascii?Q?/aB6Y5EM8NFKNx7pCso/mSwx0ROCp7UUQDAJhHJUv4KM8NCI3a8wXjduzD0S?=
 =?us-ascii?Q?SrMfKTHtBaPkPrOIIel+9bn9AGhznF0BOEe3bvataTTeLnKvdqgkLKK4UWR8?=
 =?us-ascii?Q?gZ+i/6BMQQq+suqDD0G2La84jHdUCZsIa3dEzSYjJyPpZCI23hSRJT+v2hgN?=
 =?us-ascii?Q?64tTDaNJJNDkAbLrwGr0U/NgsSIwevYpnxdnsN3GKIREpBJt3Y58qeohuZoD?=
 =?us-ascii?Q?BFBkoRfiykjpGl2EpvV5RviIgHo5u2SeDsjslM7Jk28eSqoIceI4FwR9x0VC?=
 =?us-ascii?Q?Lm4Q6bCyOydw+LOcMsBIaDITXwHovLykoNhSzm2hs3b68sJf51bfb8PHGDKj?=
 =?us-ascii?Q?PKOdobLuv1l0ZJ42/opTyw2gGUWn+lEQdo+GKYUWZZs/KAsgegWR5HO/sQax?=
 =?us-ascii?Q?B2tMxkrvr4hWrDQcwW2e5fuy/uaSUwTwllRVAAKmpP30LtUpMfeRJChyr5lX?=
 =?us-ascii?Q?qTUGFQWeJcT5CAC4v3yP4tsmbGCF+REU7p6Z/9YdnNn6QO97c2xB3bBknnUG?=
 =?us-ascii?Q?dUwLAK/WvVI5LXfAl2+rqL0F4S3zrK2K8dlooTLQcYW4ipBNexzUBkxJC7mQ?=
 =?us-ascii?Q?HqVDOSsgk9hTrp3+8dRtwBl3OXO6g8R4dKqMR9iUyebzL4NP0SyBSt0aSMTY?=
 =?us-ascii?Q?zjLdIZq/uJMwcWWhCFaQjJSDg88voQTEIFFOsO4yaDehu/Ze25kKj1jiXwJt?=
 =?us-ascii?Q?r4Dbpq9lwCTukc0yjgYrKoomC8EdaC9HIb/1y9crWVF2BzopPuWXZMmKP9fX?=
 =?us-ascii?Q?YW6ILqhYJT64e/SuwXZiGg9TRuYXcoxFl8aztzMvIGkmx5tG0SAHaa3ry+VV?=
 =?us-ascii?Q?7KSiYn/OxIbAHYs14Se7MEtcchBpg5xkBl12Y/jIuf4xiVyfwrppYy2wWA/d?=
 =?us-ascii?Q?BEBVpBUYZgbSPv8DjLc+Mr9IaVqNlJ+PhnUPyeTTQzE3I34w2W7Hpbycc9TV?=
 =?us-ascii?Q?65JGrqoVQ77owg9oraBJuG5htMwMJhEXXiRspq+f3yisB295VIculAY5bPaS?=
 =?us-ascii?Q?BOvKHoZsPNyvtpneAA3q0CpGgKFDB4VbsWkmLd0Wa8ODfYm+2pW3xy1KVn31?=
 =?us-ascii?Q?hh54sChuBLQSUBxZjNy+/xtJ5C4JuPRdZT9KOehfVDQf6tZoLbjVvbt0SOzi?=
 =?us-ascii?Q?Cu7Dv0aknnCEi+0z0TMCwIiUoUWg12iX3SrvkVNwocI4OP8v/KeTpP8Aqe6e?=
 =?us-ascii?Q?TYG5GsNKajTYoVAafR2NxQdBSC6FGoQdt41vdja0QLDittbnXUIeGrb0Sj/4?=
 =?us-ascii?Q?jBAZzoO29JtJ9gGRjoVP4AkUOiSdUsDiJ6tfmlavpeohdmGD6QsC9D3YkfKy?=
 =?us-ascii?Q?0yPMVc9zjQCnoOjojUDs45GsYGHUK2uvknJ4fons?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6f2db3-c2c4-4fd1-aeba-08dd5cd145f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 17:06:45.1378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U7cpqWmDz83cL1pn9iwAzjbQT+XWygg/4qaX2kQ3qyoWq8dfHMseYvCVHQTdESnkn+3ZmrxF4QiYTjnzYkYqcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10680

Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index a09686b3030db..711c18efcd4fd 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -22,6 +22,10 @@ properties:
           - const: fsl,imx8ulp-wdt
           - const: fsl,imx7ulp-wdt
       - const: fsl,imx93-wdt
+      - items:
+          - enum:
+              - fsl,im94-wdt
+          - const: fsl,imx93-wdt
 
   reg:
     maxItems: 1
-- 
2.34.1



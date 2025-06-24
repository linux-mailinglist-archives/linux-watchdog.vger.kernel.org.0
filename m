Return-Path: <linux-watchdog+bounces-3711-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2744AE7064
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 22:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 386DC17D1BF
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 20:12:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193E2E6D0F;
	Tue, 24 Jun 2025 20:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jo/ZOG02"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012053.outbound.protection.outlook.com [52.101.71.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF06D23BD1B;
	Tue, 24 Jun 2025 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795961; cv=fail; b=R421JF+hRq5MfyOCPae/lHuD3/5hWLemK7IIo2VEv3YscI7o4CHSOEGBOdzC1ejBx+AKn6lmP/jtXwqcif0b59pvh1schzvUZavblWPX/g+mx7nq5mHYiXfCTyImTzz9Sp83RS+Hy5bn+N/p4sHAbknr5GOmnGOksnjBxrwb2wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795961; c=relaxed/simple;
	bh=zN+JI4TrTH/pmZjHLT+IJVweh0I+3CKMLBAGEwYvXRA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mmYSgw2fB8WHOx22INgIxvewQeMLVNSOS+CaNu9Cd4Xo1jnzX2rNBHTB5Hkvw5GqC+XWG8GdNuJ83Z6ELgKKOe0LgqglxB3WHfvHi+TMhFEzggJqOJJDSBF19x/qqt37CJ9byVdXBLaUAeIoKcg6uQu6aCAk18uOPyKSJymweD4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jo/ZOG02; arc=fail smtp.client-ip=52.101.71.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7fFU7BRokeTwhxv5aMlgyzeNPo0etff6/ZUz3+9hATrEtEZol+Xy4xY3fs+jP0vMnaJjXvyRHBafyMuYMj+0B/LVtmoCjsQF3sEWl27cafyUhJX2TBbkUnSz2PXUi5lH0WUlo/5N+S1dLz+WfgFg/NFFnQxEt+fhwjOfe8m46QgDN+3sqqdu5TJAGnFdhaQNvvNTi4Xh5bxpfNIcIeHtvWpUuieT8l7gDbOXoV60Oym8oQG2UvQMJ3tMdxctnlip/r2q2tehAnXNrTmCV1iC18/gPC/aB8W52R+ayjRmtVPiE1HsNjpg7hDlOrKFL0evFAqvC25oK3pKLVA4bkrfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoyoMtnj5URWWx6OXNESdTYaKuTWxdC6RLmQX9XmymQ=;
 b=G2uF65+RsT1HkNF9ah2VXNsUwRafX3JrLzMzt7+a65wO1HXSgiiVI+vsG9xqW3+eY1CYirDZPMLOQJfQxj5s2h/IhFbIzajyTN3fP4GdIrVVMDZGHnBRQwc28jAU+EYKRDQkLqcDFR3vNUVnjNkRQC1qpMEDNGUNpsYpujQKnKhHn6tQL1hwEoI3TXI7KhzIr3IduS8KYggunZ3WmdRLuFOvY+sW+nFHzbkmdVKyXcIM/8hqP4lgxtf0elB/Lq5TCzANgJM56QLUaTsMrrnJdqAHNKDnkJmQiQiWCRvf5qO+1RGf9pVkdQLhifGkV5JtJt+uh8X2ROM2GN1aLeY9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZoyoMtnj5URWWx6OXNESdTYaKuTWxdC6RLmQX9XmymQ=;
 b=jo/ZOG02LG81YmtJuoZbjSyDZT+2kuSbf9daUPwfGmJUaLfOV2h4yKp43e94heWSRQS/K1NJMSHwxOLMJs08x58tA+eJhqv5fQKH4UjBbYx5f/lkUKOIjGbio/XAGLbGob25EnE/ZcPm5zqSx/fC/aW48DeVNtRp35jcPKhq94WMm45ska/qLK2XsO07RnaqMG7GQ2GoFdo+v7TU2jRDcp3bYzjjtiI1JOfSZaJrnbzBpJhdLcjVzpPtiJZ/fETu+2h2rKrx7n7ljLJbXD9Ht9fJM8obyTW0aXUwi+UuwsBqIUSNFUZgZK2DyB4nOnpzCDh5OROLRN4hByaKwPKemQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB11458.eurprd04.prod.outlook.com (2603:10a6:10:5d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 20:12:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 20:12:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roland Stigge <stigge@antcom.de>,
	linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: watchdog: nxp,pnx4008-wdt: allow clocks property
Date: Tue, 24 Jun 2025 16:12:27 -0400
Message-Id: <20250624201227.2515275-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0008.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB11458:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cad2d89-c3b8-4b2c-89c6-08ddb35b76be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r7hiJ//h01A0K9zp6+qBcZTNHKmjHe72NZPkP44spW/EcQnvv1Ka0LcNEKQr?=
 =?us-ascii?Q?sSJ7LYZEXQAKxljiXRrCBozF//JoS8GRTwGG+Rt+QoeZDzmLQNdSLZFh2Phg?=
 =?us-ascii?Q?EKVOX/8tV/rdhXArjYEmp8SKMqAEH7D1loBQWXLcsCltImK5SBWSU9cP7Wsf?=
 =?us-ascii?Q?Wc+tMdJIscCAlTbhdDzyNCteZ+n1iS5qnk19Sw6IMkl7un+eDF0TlCEPfb9K?=
 =?us-ascii?Q?OlSZVXrc8UR7wMTezPt9/B6BTi3pMPjkCI289YIdNHOJVQk45v6ziAOrtnL/?=
 =?us-ascii?Q?uT15dnfdoU8H7717ylWH0Pz5yOa3cWyAN79OwR+TAIrBds4JSLsJ398vJN2F?=
 =?us-ascii?Q?CRdHjJtZ5W4DaYzfmyAn8YtqtcLt8K+OQopc1bZJq+Q2CxAVLGp9WtktGVL2?=
 =?us-ascii?Q?lbMfSdcG9FpTL1LEfi9C5zX7XLhjXoF6HTmYu4yBUShYm54RxTVKlAYXUvww?=
 =?us-ascii?Q?mBzH8hoZaohUkUBL+UKSPra4TTWWwQsNPOP1XJKPJH/RhyQmDTR+hu/iSGSH?=
 =?us-ascii?Q?XN329ah7Ri+mUtXvO35FGUS5SDnLZq/IQyVYv9SY20V3++v3t/OtAfRtMRtQ?=
 =?us-ascii?Q?bUwEcuGUdKhQCJwXTjDwayNc6Ii1KQCWwRtCWMCZqqC8pqoUnLg8Uoi67CZ/?=
 =?us-ascii?Q?zSWPnperNoh2N7bGLPbbtEoZeglOmV+U6wZ4iqx8G7IRLAus0F9SFSLLznqo?=
 =?us-ascii?Q?wvWf+CWe4QSXFHjLjPFAKXYEogVEGUnQDB9aZ9fCuzA+AULgpIYhM8fIxuc6?=
 =?us-ascii?Q?Yi57kEZXCW3kHjX8OJhMyBigI2tI6/Pfl5Hi5yq3bsarAvwSAkg3GAlGdu45?=
 =?us-ascii?Q?X8ZHfnATHdhJcXJzx6KyOdheB2T0ICYmj25e6jIo7wbQibRQC5dcMdFNUQrG?=
 =?us-ascii?Q?90sPphtFQl15tEROBGS7yU2RfgCpDTr2j9+CC8AbDkOiIYkZA/Z/3xuuWpwk?=
 =?us-ascii?Q?XLfGgtcSMgoG3/cRl1yQBPgNkEaKPQOz03JEkkuTVq05Ge64xKJwFvF6E2VA?=
 =?us-ascii?Q?WPmZCL/jGMZyGvavd3hsYFYjexdAAxKILsUM4hvN8wE2Un5kewbF+PN4dOkj?=
 =?us-ascii?Q?uLu+YvR1TlZTQ6W0r3j86YKtq90MqnuQyexxSj2UdBI3Z+FgAL+Bmnat7oyR?=
 =?us-ascii?Q?uvrvaUCadIB3WyOFGDyDo7A60811GMK9C0ygiP0rl/QJ34uMvoxBYejIkvTd?=
 =?us-ascii?Q?0srmc0O5BDjR+05qpQbog51GkuzACxEXtpdYgxL7ZsbiVVkbdjfp7B9WM6Wr?=
 =?us-ascii?Q?rBT1Xbcwkp0qz3ubiTDz5I3khO820W6xp13GjDEJoUolsZgfrAmlz32oYa7d?=
 =?us-ascii?Q?1/S23XZiAaGk4HareNEpN1ncjzdvG06tBPTZwO8aKgUgqsRO852zkyIZyzO2?=
 =?us-ascii?Q?EIksHadow5DhUP9IEaHU6lPkgBL+EwgIiPiGavOUV/etACUgDkh7eBXPSodv?=
 =?us-ascii?Q?EQk/YDsHwwz9mP9n6pn2mun2NEeW2YK+juXU079HFK1+qPU7tG84Zg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rzMBLYVxhbeQlmQUkjZvrCwLloYCtNMhnml89Pf4vY3/ovDl/B7IV36gRFN0?=
 =?us-ascii?Q?Skd8d4EGGhU8iVYgkmGotLGvG8RQsxRXhFkFxHvB5cp+TdGiFhXabmUBdKKI?=
 =?us-ascii?Q?A+sCjxCc/fEAhbAqu7c8GUqOIdvTaOCtyfGTabsX+Y7BA1zxDjToWwLEZA7W?=
 =?us-ascii?Q?lWfYLvD1ju8ai9EzhJ7JlSmN5VsUMKVAD5JrT7BcV1L4PnZxZJ6icmn17bBJ?=
 =?us-ascii?Q?ZIbSP3WNsw3+p2Ann8H40fZNbLoh0iPqj0Fbo7NYPGqUYjuCTzI/oaZYKeaN?=
 =?us-ascii?Q?sxBPd3xXbBXmoNM9xsT0TaEjK1DDg/6VeRqwoFAgCBB1I6442xK3S07uMbRA?=
 =?us-ascii?Q?AX3vwpLvgsQlTlgy2Kjub1rVowAkWs4A9vIv5R2r6H1qyPrEXlR1schMJdNb?=
 =?us-ascii?Q?hFTqsgLmL5HmVNd7RSdKt7eERzdwNo1HkJR13gwcFlW6iwxSu64eZ+o2OGEw?=
 =?us-ascii?Q?u77srpYBo3/RTW8esPDJ99DgUVN7lygY3jiJbyzU1njVJx3YeqmkkkcR/PJa?=
 =?us-ascii?Q?9aG9thz3ti1wrx82nxsKu/ISPEfVnTp2xmQLHg6XI8e32iE0S8b0L5qN3yX2?=
 =?us-ascii?Q?maEcQSkthTfP6cPj1ct2kZZXwLzCKhWZeHmG0kC7fkI0ZHW4Psll62Ghusz4?=
 =?us-ascii?Q?OGOx88ByKkHKgKoxUgudhG4quQIQ8R4pg3DB9R+b4yoRyz9puL5yWYMOvF48?=
 =?us-ascii?Q?H/8VpqGlCCVvCzCIEBFKcPO+LMVOHDJ8o7v/ue2qL8zEeqrGy4a8hjASoP62?=
 =?us-ascii?Q?hEDQdw05voZI48+AoEiZAtlMgptqdAYmUWdQLxUu/HuN/VlYRPU2V3paVgHX?=
 =?us-ascii?Q?iTgkYsFO5l0aHdwk64VQaB60PALitG9zyQF2GRJdODF4oVw/tqLHfnayGay6?=
 =?us-ascii?Q?mRvE0tJm/eULE/UPIoJ7mStoRtbfGnvcr/aS6hdt3e4PMuz3ckV5KMJWornU?=
 =?us-ascii?Q?hENPi7Nr1PPQPTR8Vbh7il5pNckD+Wo2qBFLTUvAJKFqWAPNPvlGmLetXHQT?=
 =?us-ascii?Q?Kml2N8XNOu1jditUan5bpVFky06hYV/d4NI0N8nuRd4TurKmctszwNEP6OaJ?=
 =?us-ascii?Q?7YL2+0Ky1SZyHPOPf/KUwWG66pVRziTOByY0+cgb8pEM5KJGuVRe/RKIczdt?=
 =?us-ascii?Q?GB7+L3ghBdQfXlNQkbJab4d3dlVpchZmlJ3M1sGxqFK+0lSBftq+eMrw7inj?=
 =?us-ascii?Q?i6mUxyRZiydCLo35NYYsyLmJX9pFcAeuRcC5CEs8hrQ4PeCak0MWwLmd3Ix2?=
 =?us-ascii?Q?mev4PiPv4Muz9Sdae22NhvEnZ9CafmKbhX5FA0QBrJ9lTk32/ICUyR9rLh1L?=
 =?us-ascii?Q?5arp36bw80N2YZ442UhaZ3wnQah2Gj/RLTGDRz4UrHSXhcVogVi3tZDRnBme?=
 =?us-ascii?Q?5/4SRPwBY9I2UuxgoqZLJCz4j/tjZ0V2okKaNV0B/nHQ0CYoMUL0zvO/0fb7?=
 =?us-ascii?Q?XHJ8M0MZ/tLuEIpcGLnpvwSdF8+bpUI1hxrURI/DrJrog/DJGnO/aF1WyF8N?=
 =?us-ascii?Q?o5kuyczij6oPwBAiVpd6WC8zeWITv9zkRY/ntNoGJVKEC8iHCu214AZin3Xw?=
 =?us-ascii?Q?+SwReet1KdRv2/beDXUNNWQS/0Oga0YohrkHLEzU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cad2d89-c3b8-4b2c-89c6-08ddb35b76be
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 20:12:37.5031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZA55F/kebPRg6GY6d3e44fhqy3B1GQIMlRJci+wAp7GnYznvb521jqWO0hc18ciGDvGI0RRcD2CQMZdZ4cvCGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11458

Allow clocks property to fix below CHECK_DTB warning:
  arch/arm/boot/dts/nxp/lpc/lpc3250-phy3250.dtb: watchdog@4003c000 (nxp,pnx4008-wdt): Unevaluated properties are not allowed ('clocks' was unexpected)

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/watchdog/nxp,pnx4008-wdt.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/nxp,pnx4008-wdt.yaml b/Documentation/devicetree/bindings/watchdog/nxp,pnx4008-wdt.yaml
index 35ef940cbabe8..8964c1c5d5220 100644
--- a/Documentation/devicetree/bindings/watchdog/nxp,pnx4008-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/nxp,pnx4008-wdt.yaml
@@ -19,6 +19,9 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.34.1



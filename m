Return-Path: <linux-watchdog+bounces-3575-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 95482AC14F8
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 21:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E83DA2144E
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 19:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51902BE7C3;
	Thu, 22 May 2025 19:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AfH0JujN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B3413BAF1;
	Thu, 22 May 2025 19:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943273; cv=fail; b=KbWs74z5lG7gFLHQ20IZh9MRSldFzaO3UGGbrl0NkJQg/ZnS26f4m9jGnKTJun5RllDQAAAceJCQ9pJiHAEduG7ya6/I1cMF60TnDCGjr7o6h1+uP1g0qlFxeJHihNZuuUP1tVdTuGWEE0ENsK3p54DvwoYMaq5/HHuvEKX9TiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943273; c=relaxed/simple;
	bh=7xuBYdVij1RDkW+2KU5xLJEN5eRudbRhdMHc2R/xPHk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Z4wEKF0XGtsbPW0zko89P2X7L4Ca77/C/NCX3Q1mBuLRYZxQH4Mvrav5sKtCbNE8hiwjtDRhjtc/ZNWUwnzn1S6nmJ5mc+WxEG9nnZV1aNy2GWMHK+CP/EuayoablpHWv298XIhW65Ww00LqKdZcOgwoeLvR9+Iwa/4fdKqqFe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AfH0JujN; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iw7E+xIefCfdmujoSARY7ABpMAQSdZ8KRexcdS90aYWtrl9bEYqvsNyv56I9cU7w5bYz7m/qA7HRmKh6BvA+Nnh5mcoF+IshREeE+zb8GKcHKxdLRsvBMxIn0WUzZPH36zkaoMxa+qvUkBprYE2ZuyCoEDDXP9A8dBCyrWwLsxLjrO7BLx+z0bSi5JsC8voBUt9gY6SRlBdqWEXuuM1kFmGWn4Xld7pgc+UjpY2sj7bVonbNPjVraBf3h6nyktNqzz0nlGLjb2mhKubwJF02OH4TCmDbJlHrlHXLNSyDhN93XG+m6lXiawFPY0YLI5TbIRjZEefusMZvsAdoJIAIlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC2c7HKxlilzf7igCELiT8bljV+Cn13+DosLhK+OA7M=;
 b=m6r9HQrsb2H85M77ahksIPADKo0/hZzPL5cHjVOtdoCgcDVxBDqoEw0/NVkAhp6YbFIZL4de2XjclBkB80yDrJRY4MkgQMRI8x7lxpUjFegYiRvXNGfKDRl0fLLBh5WcUsDgijzypys5IAQgQM5tV8KCqdAwwGeP4tssaJR+z+bLhMSkhdfmw+qfZpCjdWEFCae61C3xuTyPauoWFHp39vuwnnXVLXbAzsrgznbkuhVROuk9zTgo9YDz4Fxxm7V+jR1QDiDm44x7vNB//SZrtt0daD6Z2XDXhq/UBY50M5NqANGoPw8xQYIiG6q2SVfl/qJ9GgCj/721/9FSMI+txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC2c7HKxlilzf7igCELiT8bljV+Cn13+DosLhK+OA7M=;
 b=AfH0JujNwH9t76lubVehsZXWNJzncGettkBFbx9Kd8zvd31nWS3jn1fuunqD1lxXPNYLJE24gG34Ex3NFJc8yWY6XEOFy5AeXHNzi5ELA1sNw7erqjKXs8ltFNnOq7Z+uH+v8C1LP5pYJQU/MeLW7rLYaCHOtcpcQhtnk/FqwcesIMpbandw/QAUX6JIme6xbl82JWV0e3szLpixNM8s64D7B3B8XBMQUmvO+lTAdNG/L2jQqiynL3vHWFp8jebDiz22Ne+RQkn1Q9De0tbzHkURhaEem9s4u0ewW92M/7jv9tIA5nmSG9zwu6bIXvvtYxADb3L76gARKl8g+yQkXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10775.eurprd04.prod.outlook.com (2603:10a6:150:213::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 19:47:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 19:47:45 +0000
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
Subject: [PATCH 1/1] dt-bindings: watchdog: fsl-imx-wdt: add compatible string fsl,ls1021a-wdt
Date: Thu, 22 May 2025 15:47:31 -0400
Message-Id: <20250522194732.493624-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0099.namprd05.prod.outlook.com
 (2603:10b6:a03:334::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10775:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba1d191-7b31-41c9-f96e-08dd99698607
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DQlasKKFKJWAQxVdEeMSWH9k5H3TfNg6e/9mdM1fmsI595qtup+7e1FQQKdM?=
 =?us-ascii?Q?FWSWTVmEtzUmqaULU4G5lCipzZsGubvnDGadS60yDxXrPjDFCGrhFpf/zLy4?=
 =?us-ascii?Q?3pGEj4PIsY+Ex8pqvEZO5/WUFc/vI4pFk2EZekidDq81cAVdsqfCGB4zXyyL?=
 =?us-ascii?Q?8IEQGKqhaq7UI7NmzsTbkqwMrzLd4sncajtcMyfdcsUTLyn0XkYaMFbLz+nH?=
 =?us-ascii?Q?18QOjfpe18zg86/EcwdVtQS/gnyHwIHSXoBqEzCWrFq/dWxc/AryzCXR0/iI?=
 =?us-ascii?Q?n1gl8l7vRVIvbdEqTmXSGasqE2mgzfmhq/T1TPaAwyGDUYgD8njK924TC362?=
 =?us-ascii?Q?OHd2XrxRfSEKyFXW12iVNwFdVzu/s/5S2INbpX9ByxLAokVEELui1xvbVXLD?=
 =?us-ascii?Q?MaymZKfjuG+x2D3NTuBzsGZhzyxgQAjE3qm6mle92CE61mD9S5KU80HY9UFG?=
 =?us-ascii?Q?sQiDlGBgLBzvn4uHD5cv5yd2U0u+QtwdYl83Yr6UnG0ND0Js8H2VuCYqqFri?=
 =?us-ascii?Q?57QtTSzS93Zt3+7u+YyVHUN7uQpTQVOmhWiiWmzVSwNGbXhymcJbNw1+Ejz3?=
 =?us-ascii?Q?ooJssh9uQyljgoFDOQulEVVFilptyAAKH8uCLnbfpSRXOENzF9qxXDktDzeg?=
 =?us-ascii?Q?cCfwLQhTqDArw1lR2ZkLKZ1hI9Q5wcyruB3gFbNrZoNcq0SXRj8U8iE8yxfe?=
 =?us-ascii?Q?9iIDvTSopu39/TgeGFi3GEFM0dHa2TkH+tmJ3e/HwZ8xCD8E1Gj/wZ5R2IhK?=
 =?us-ascii?Q?xuyZa4ZxRT0eJtKOfl+tl8IoXe92csnj/6w8AxKfGcZXQ/bYkTgOfWfAf0ak?=
 =?us-ascii?Q?qf+SRbrZvLwXabf1erUzUTKwAtZl0kHkj+C8rrqU/KpZN7fcNyqgCBHsyG3t?=
 =?us-ascii?Q?pGgLbsDeclpfn1Dg11gRS+VfMYNs6+2O9DkoDEGEhGT+j+8c1mfz8n3c9WDB?=
 =?us-ascii?Q?buNDx/szQbTtSUD6nIJIb3nfJUDnQdxlzDhsgdK72Hanflyx7Ga/5q4nUk0h?=
 =?us-ascii?Q?w6IFNjURFQr6JPqKCKO8Zf0RwsmqxqGGu3U+/q6JTWJAbDRseM1klCURe9Cj?=
 =?us-ascii?Q?cYG/sBSiEYyBysiKvZTWy02uQjrAYN/5AEldOO4NW9EGIIHgXj+mszFwgfs1?=
 =?us-ascii?Q?lWxT8Zve9bi/9eSvOfhkvyjKXSUx290K8SdkrrDahZXycLfFSRuUBTx/ET+e?=
 =?us-ascii?Q?/2YClY6fMQrCZIoIsNqG3G6E6fOw1baWRfRkn7bZk/CKhLyLBEicIph/QUPF?=
 =?us-ascii?Q?cXTl+pizMKJnQdSdcaUdP7j52Vk7GeSlvyscCUdNCu/dZA16cLJnekY/NRpl?=
 =?us-ascii?Q?4jzUoMFG3gNR8wj7EIK6qB5kj76UrN7gbq+zeD52bdALzebX6n04kG+sHKV1?=
 =?us-ascii?Q?4yejsydLOfWE8XTq5opKyu+LKGfCnDbM+WRA/ObsvZsJ5rWSqmm4mQnpJRld?=
 =?us-ascii?Q?FcMoB1EJL+NIuxMM1lq0tbzmvH/RoNqfaLuA8mPmLEO16S5kP64PWk64Qif4?=
 =?us-ascii?Q?Kb7Erbv7TOFtrVc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pHAio7avGjsWJr0c5Q1VCoDzqwAC63hoRaGvnfAcCqcLEj5XD7Q12rYhi/5d?=
 =?us-ascii?Q?zFetI3gHnLmMM3jo6bGMxDvk0Lun1rkQDo/QGsvLkF3jFXGELm4bj4Kvn+uZ?=
 =?us-ascii?Q?blN7mLLaIo5o8Mc4RPMUIiHwpS3ght1Vqo0rjpPShT/WaFZXMskK5FWWVf9q?=
 =?us-ascii?Q?w7lnJvoSxTZEjWSIBZsAj9Omi8JQ0ZZvrho7f9g3X7LgQd1ebnMiztyB7ayD?=
 =?us-ascii?Q?k1SxdhAJGYQIWJF41vjZerBAakjJUyCjsHVkhsUM9xScq/2804swMP+pofVV?=
 =?us-ascii?Q?dFKjKdrF8lND0m3lg+xG4jPXje8FPzQ9XvcrlfLJP4tK6N3Z1k10oZXKx9rj?=
 =?us-ascii?Q?UUZfwrUxerlDGNAc6DEIKnrr0YQspBwwHCc3To5ZPHYDctUVownPLfojuSac?=
 =?us-ascii?Q?K6yBOG4tbmXY/ES3A2EDfHiJgB0JSyjIBFDcxjNlKhyIaWYSZc/pANuTfvaH?=
 =?us-ascii?Q?axP7qixhFr4u0RgwVSsxUecyricJqmLC6WoPNS4uz503WbkN1rxul7XIcrUW?=
 =?us-ascii?Q?cop1Jx57isVSSaHyu3BR20s/MKOzIca3/dKCRzgR8eVHltepV5MxHGXvFuXr?=
 =?us-ascii?Q?I0tuhabBFP3Arrwz5ey3+SHNGNOEoolDHC9P6O29zAJk8Gx153F1AGAi5IZP?=
 =?us-ascii?Q?lV0GhleE+9qw918E6LHEAUgn4vM7GvuSdb5gZ9bKq1+7AHtGp84vOB3w0dkY?=
 =?us-ascii?Q?vvL4Hj+8KhV9XwSN00AcUkkf5gajt3BZIlLthUycm2WMr8/XAv0rsqNpUlvj?=
 =?us-ascii?Q?gu8bhgJYoVwER/DaWyZziCEGQ/Rrs2ZEGPy1paokO5wWpmYr3WU2cWGPjHWn?=
 =?us-ascii?Q?y7k9fkXhPyigtLXX2bj4BQBwulYWjn1WzzsMFt8FIt+zqBgJADXNGPuFuk2b?=
 =?us-ascii?Q?ukwTcIMGn0+dFw0XGcuXNwPAMY9/Vsj/0f6imZ6clqhpExpn/gO7fOkWcx5W?=
 =?us-ascii?Q?YLsas/Zs1cSa9bJ+LFidmHg7Xu1H8FTGF9CDuBKdJW24BlNdg3UdC0RbyVI5?=
 =?us-ascii?Q?Qv9lRCvXgKZEJeIN+aegMvXMgCWSLt8xmR6btouMcqoWz8XdLf1ARyZtSKyV?=
 =?us-ascii?Q?NU7uQD1tiWFWg/nXwyMWnedJUDS9tptGUcWWr2yxMsvTWMLefZpFVaZEYYtc?=
 =?us-ascii?Q?pYWtwbfE2O/b7HK4aeQYRZQmFZMxdEPhGvDCvHNrhx+NL983CBquXgwPBV0z?=
 =?us-ascii?Q?7Foql8hOsEKzFXFo1GaTcIOVFY3408R6mgIKMTQao7Il+3vLbz8hJhQF+pgd?=
 =?us-ascii?Q?FPmVRfaP+ErxmSbw8HoWGjm8PGR+N1l9nsa6wB7THTPB15IObOKez1wPOAPp?=
 =?us-ascii?Q?1rTC4IxMwRy8fv/cbwHtzfEMAMC/klhNJBouFBKmHJ90cjOEVEkKV9xEe8sz?=
 =?us-ascii?Q?VXJL6o5dDvZYlJhtTdofsyzYWTiWOMoiY08k8d52WbTN6idL1NRz+3dPd2C+?=
 =?us-ascii?Q?vKI9SfOBA2z9mEgHgahyHfrG3kcCTEs08mo3WbyzG24CG1Uip7ftUkCYi8cE?=
 =?us-ascii?Q?MMER8NuAPfVqCbABCGGsRcMvqnh1fl2taeV5PGQW5dzbbF0cC03R9X1SGCjs?=
 =?us-ascii?Q?kiIdNUDT+uGeUFOkWy47cByrQvBKpYBX0jC81wPZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba1d191-7b31-41c9-f96e-08dd99698607
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 19:47:45.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: st/gvRMzN4YmL/hK1VxTU/79yy1QNT3z7P933er2jOoG96O96TI9JX3ANGWDxKjK+Smtvl6UOsFO42MMD1wKQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10775

Add compatible string fsl,ls1021a-wdt for ls1021a SoC. fsl,ls1021a-wdt
allow big-endian property.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 0da953cb71272..8a6c3a75a5478 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -35,6 +35,7 @@ properties:
               - fsl,imx8mp-wdt
               - fsl,imx8mq-wdt
               - fsl,ls1012a-wdt
+              - fsl,ls1021a-wdt
               - fsl,ls1043a-wdt
               - fsl,vf610-wdt
           - const: fsl,imx21-wdt
@@ -102,6 +103,7 @@ allOf:
             contains:
               enum:
                 - fsl,ls1012a-wdt
+                - fsl,ls1021a-wdt
                 - fsl,ls1043a-wdt
     then:
       properties:
-- 
2.34.1



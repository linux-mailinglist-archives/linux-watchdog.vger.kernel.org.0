Return-Path: <linux-watchdog+bounces-3073-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D378A56C68
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 16:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A0C1889622
	for <lists+linux-watchdog@lfdr.de>; Fri,  7 Mar 2025 15:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DD821D3F8;
	Fri,  7 Mar 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LaFjyP2x"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2052.outbound.protection.outlook.com [40.107.103.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F7A21D3F1;
	Fri,  7 Mar 2025 15:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362288; cv=fail; b=mChMITtFylM5v/pANOmozl/TGPxHTQVr/bXB8pvDgxmfyQOjKXBt8W1OmK+vx/I5crVFDsXBoV4g+DVHkwa5s1CL0wztpYHQoa+YMChDPVPon6biAWR/onkhA4eauvZDllizkPiip/XQEhkn0pw3Eav/qgu3pb0vVn2qzIP5FqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362288; c=relaxed/simple;
	bh=uRy7SokIpA1r/Gy+xBBc8WU6xuR0uUSHl4ko5KjRqXE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XfeMYN64O5QWXzxDlxNQJIdgDh4Bjq8dgQwVectMuBfIzkDbgUF70s62IGoVBqMO3LDzB6aUkXbmWVyDWobRcW6n20GHAAlht/tvMOoj4gxqZAwHcEVsEwNIvYBVImxJM9tOYIIF6+AvI62HsdDCbaEL/E98G8gMLuTVErJ3K8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LaFjyP2x; arc=fail smtp.client-ip=40.107.103.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fNcpcTms4jEGuy4IXK3ezQzEjqB1l143aLPWGfvqDcX68Ug2jLg33VT0qdgzwKss5sdlqafLw7EDFPBhTPftA58F8PFa/3qgwATCLmoo5ZJoqn4/9XOuq4omN4yf0MpEKHFnBGs/dDay/Uy9oM4lqxNhwQD0JU8CBsULyUulz0vE+O7EWIWHql4a9v5K8AV9mX10BnqmibK/yKqbdtxWQOSCZMiFBOt4G15nqSLNH2Af/ltmflOYCyMTvQBEq16PZn7/ZktK45KKXFX5m7/bqk5h5SD/hh+AQTZ0Dl29iPG062BxEo1OZzAQQreTw49DaLv6EOd2wf0HpEHBoh7Lxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe7b7A70Vz3Lju1AeGWi5s+Vf18PLq+33L4MxDC5Fxc=;
 b=vCccNnZHOAvs3yASSXngFD4mcFCGU8dQVmi4OSoZWFDbRoOFO0Ad7R6VZteTuAJDW3menZKokliwSW4hvkR3IL0gKKoc5cdvzotZbvVYkabraoMbhDV11rgMkhOxQF3QaRMEihflLQhk+4o4KJ5dpd2kkHNuXXiBpJEOFe9WFAbxFyJdPu5LNmZmX/7dNO7xbZE3uo0riGbpxtxigpBX/UZIRitGp6pAcL27qnhphA1O8P8Ie5xndH424bwQ4afGuh5KmyqdFip26f9AP0RQk8tUZMXqrHqUn2gusW3TmeXc2Tky4qaLAKAFUQje7yIKOWGBAkZgP4edMJpxGyNZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe7b7A70Vz3Lju1AeGWi5s+Vf18PLq+33L4MxDC5Fxc=;
 b=LaFjyP2xOaWCv7rCsVoAvFQW5HzZ+l3carEZN0TWJqqzKPqm+T84MxPbX+NmyHmWb9ahRFnSc/zDVXnufcob16JCTd5G3WJO2JYllPgyr7fznkALvGiRhZ0JiL0/4zN5aidu02Ceq2eoi51BjUTpS6ya6nBnntS9YT+NbRsxQa/OiyNmRHzyZP26UASSLLR8He8WCwSyYRU/dF08O4EnuC8rVzn9VcOtFiBm+p/TuYgVMx5iavGylbBdnSjG7R7JI6BxAUFsso8X2TZK0anepacI5U8wDiYpSXy9VJS/yJA6ocp/i4WmcS+5nzMcvSSRaHbinDS4oJ+tmFhsCoVl2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10550.eurprd04.prod.outlook.com (2603:10a6:10:586::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Fri, 7 Mar
 2025 15:44:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:44:42 +0000
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
Subject: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx7ulp-wdt: Add i.MX94 support
Date: Fri,  7 Mar 2025 10:44:24 -0500
Message-Id: <20250307154424.2613795-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0009.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10550:EE_
X-MS-Office365-Filtering-Correlation-Id: 539c3787-074d-49ec-4637-08dd5d8ef9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?99Q7Eq95NadjXtR5zdSLvFAfrrTREQlyLEusbwpaZa4OzUKjHvWo2kkuCLeZ?=
 =?us-ascii?Q?3N6rvPapEHvrMiTUp2qEXe1f/lEuV+Ui49PmFKBObpwCVL7vsEu8aBY9CZNf?=
 =?us-ascii?Q?Fd1dMNj4eNAHqwhV92WP4swkBau2AW+D4Ph4FzqeDc1ysOD3/Tv3BqTckPGK?=
 =?us-ascii?Q?F35+FQPlIYL/68EjO0HbnwAtQXQQ5759jlYUBXUsxPL9znwC2Fk17Gumy4sA?=
 =?us-ascii?Q?XUdPRdqlgFEQvVxbJwT7witE+KOuT3o51eTyoSK0Se7+OA+a0GsZeb4FTgEi?=
 =?us-ascii?Q?oFcSWwLwuXz+44HAJ30AoBDYEMoWJpSYAvPeHbfYlApKTFfgCUIn7Bvz0KxJ?=
 =?us-ascii?Q?7yILbMN8Uy7/NOmItoR0qPU0PxsNv/Frp2hHFaRYbM53vKzYbWhkmGb9S54v?=
 =?us-ascii?Q?2G16ktzRdGNO9k5F/uheNz2ZSV+XyLn8BZt8OnjXFe59hr1805YFU0JmTaSv?=
 =?us-ascii?Q?iXphdUaXEAGCN9iBN7J80Z75PE1WMLIE9ZRmxvf3oV+p75DRgYCuY1fXNxXw?=
 =?us-ascii?Q?Cz07Iud0STwN+9EKe1O/MEjNq2V5ROiioJr3lBleZo1uKyIm7bAal8tMOhxe?=
 =?us-ascii?Q?sqRxqScdZINwVrNSGM1+kt6A1vuT8s9tezlxyAGSGX4xVpL6DfmR8sDOfguI?=
 =?us-ascii?Q?pXjc+r9ddc6yHLf6apuHSOv+4zoRiOBEQKImMHRTmoEARzjkqODvmMFdZME+?=
 =?us-ascii?Q?c9pmEQgjZAH/Cv4ztitJZFG10V2hghI/RZHoDFyJMhomM/oG98hvzHjjXOpF?=
 =?us-ascii?Q?vB8kOArXTja1Lwuup+xKDs2+IStWXurUOBmixey6IQFP6BEL9aU5BEw4XZTq?=
 =?us-ascii?Q?BY0yHN+nW2D4Z5v3JIkQ+1YBOEv7eFME125+M6lFqt81bPWzILCwe7bFl/ZN?=
 =?us-ascii?Q?sAFdGcbn4k5vb6/yGjp2vmcEx9u5kgAdZH7ZH5GcHHJZEykbIK1x5ZiHYFJo?=
 =?us-ascii?Q?rcnpAKYN8OLRCgb/EmhMNJQWJUSucusx9Dg6XYCl2rM8iSVg5sLem8uuPoK7?=
 =?us-ascii?Q?tZeRCBdYDIX3uT2XJPa5a2izCKdUWgZk+0/S4BNv7gnZikkBE5xVgthUgU1l?=
 =?us-ascii?Q?vvRjLLcRhTcOYVn1OBwfr/l0KNKLWWGVYuyv4KY3gf0V8jCisqX5PrDcOXTK?=
 =?us-ascii?Q?bV520YAqho3hxKHplh0GdcXhIAsEbJXzyj92RBm5LBgCPndpYSd3fDHJ2+Ep?=
 =?us-ascii?Q?qbPAYg1sldYkO5hwpjpSA5aQ+QG2j5VLyiR64dNvZQgerYmSZFXQiJwMN3DS?=
 =?us-ascii?Q?b7l01jlhvAx0LurmCYyGqqJJ3/EL6urjvImJE0yfhBbprI4nh7op8b/IMydU?=
 =?us-ascii?Q?qp66o4ruppleD7DxUTi9EM3YoN642cD6pF+pV/uWTPCdQROuvfvsik0fP32g?=
 =?us-ascii?Q?8PPqKXPhLRQljiE8OaH/c0T8e4P0gvIcS2SLk/RSZFJzDRuGTqaFIwUNRx2G?=
 =?us-ascii?Q?u0vXSjzHm1hUqKJuvHf9O8hrLMSxJ+kwcmlyai8hew+6OgvjoUTvVw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bs4t5/6Yjsy7RRUOqclm73VehoEYTjAuqI7Gg6+B2vbvA8MFN9723xGP/JUH?=
 =?us-ascii?Q?+tG+4tOUw6yKfTLj6Wf4pKVfqWlfSQYI3NM/0gTqqoXpDLabiNDfgo9fp6hv?=
 =?us-ascii?Q?XnXw/blqbBPdWm7c2eDvDrauFpso9ppRSl0/ufUehRW2iUW8SwvIpFRvgduE?=
 =?us-ascii?Q?idbISCTQBUwZf1cLMr8NBsXmmTG1YZzw6ZBLjgDsCCHZWKj/JZiWbSQzPIAI?=
 =?us-ascii?Q?S8I7nBeUuhDq8nhnFxkvuEdZ1F5nuUb3b0JUs7pjs82M2muOaUxgfmCO/rQq?=
 =?us-ascii?Q?WLsdtdObTm+iCcpN8PABhbo7JDtDFFI6C6uSvqS9m9wIqyW+imbLpipsgNV+?=
 =?us-ascii?Q?wRZhf+zV+5MIMv+jzxfLVohed/D0Ur10QNz+N2W4aGLag8jWZ4RyDuUOv1KX?=
 =?us-ascii?Q?c7VSK+P3gRZRY4ceztErZlq9g3oHOUyOARcY6rBZU8zSbB78Z7N+oUXOvJHA?=
 =?us-ascii?Q?16DMUJ5JUvrVGx5M3GdV9RNlxJzLYpss1Ao1hDKQ267XOdwQ9/pFLFDtifEv?=
 =?us-ascii?Q?uydyrEv8kvmMElEr0abUTKChjavaC8YCitLxuTR0p0Q+D4Cno9HvmnxRr6dE?=
 =?us-ascii?Q?tWLW8hbMpqR217dxbJCT0A7o4J4uvQB48nqLdxkbQcuX0XmY7Y7fvvebe+cF?=
 =?us-ascii?Q?fwLGKIFnhivWPX+Dz+Z/6DcLzOsxE/Cv4AkZgLM2UgKXGeYF2LU8i17KOyfe?=
 =?us-ascii?Q?PWI/d0uM9w+95ke6TQ3M74b2hrlYYDgkd+AtRaL8HkMGXf87XDFik7QWzG7W?=
 =?us-ascii?Q?ofvl/Qq503jPDnbtxUmkjE2M1umX1WnhHFySkYEWF8KfzUbNKZuGH+t1/h3D?=
 =?us-ascii?Q?U+OxswbSiCk0RMF2morNi1fDJkSGZxSwtTvo83N8icR1OYT1PpvfOjVh2PyE?=
 =?us-ascii?Q?F1Tq87uzCibJGnXZKC7XqdAONdQ2b2c+GcT0CBjxRKHDnH/GOUD1Fr/seU1j?=
 =?us-ascii?Q?mUBzRI049NuvR+Zir4KTWCA9ENoBYBP4Ehj9AeHrP5lW2JPWn1SMX6Gey8eY?=
 =?us-ascii?Q?/aZWo7qFgrws3ClAIioYJNkS5/b513q7wMjD4SwXTC6s9d7bizMvJYtKXF1m?=
 =?us-ascii?Q?LrjtTU+RhW4U6mXNSBtVLl0sQNyINJjPYSCXOWGTDGDk5F8zNhu/IfLDSTAd?=
 =?us-ascii?Q?45oVvVa+c0FovCy2XrJEqwsXzywaqX3zZM7lKq6XFw7YK5TR8DUYdsKh0yVs?=
 =?us-ascii?Q?9axZ+DK6FfD1Bum+K+el2FAyPbBLjQBUDAzSpujecUM+TLEFpaJEH3tbyGaD?=
 =?us-ascii?Q?rGQXnc5Xtehq05ySxSmYrnsjt3aqCJZZ45/LuG1H3/B/Ek03QrlpDIUy32Jg?=
 =?us-ascii?Q?w7l+Cy7SscNBrlQmqdoHpTUfEPTJaCcVtm0MccbWAZBdZqizEVNZGQGfRwKw?=
 =?us-ascii?Q?sBnNre+c7ncur++mHDzkcAMAT1pk4owdYd8yq4ZfyuN0KA7Y8zzf8oFF8DgN?=
 =?us-ascii?Q?l2GZw0yaqyZx8pZ2iiq56L7c2DxRvyhfJJuegz4tVwTC4m38P5DcRZwU1lj3?=
 =?us-ascii?Q?2fmMVHHp/uh1gs2LpryOaN/pTmM35emVjW6Gxui4bTRvxD1U7Ssuep6iWlTl?=
 =?us-ascii?Q?gyvHAQxXfE2xEiM7L0pTY7hJjRCR3x4s3d38dV9Q?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539c3787-074d-49ec-4637-08dd5d8ef9f3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:44:41.9846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIrq6Yl78/H1Y02p2zhp/LyCvwpRwnD/FedXo0u8qDRRJ8I2ZVwKnONyc/RhoOrWPppsVZBqk80jclL4Lpiz5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10550

Add compatible string "fsl,imx94-wdt" for the i.MX94 chip, which is
backward compatible with i.MX93. Set it to fall back to "fsl,imx93-wdt".

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- fix typo im94 in compatible string
---
 .../devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
index a09686b3030db..6ec391b9723a5 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx7ulp-wdt.yaml
@@ -22,6 +22,10 @@ properties:
           - const: fsl,imx8ulp-wdt
           - const: fsl,imx7ulp-wdt
       - const: fsl,imx93-wdt
+      - items:
+          - enum:
+              - fsl,imx94-wdt
+          - const: fsl,imx93-wdt
 
   reg:
     maxItems: 1
-- 
2.34.1



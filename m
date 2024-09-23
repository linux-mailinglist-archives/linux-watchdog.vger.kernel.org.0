Return-Path: <linux-watchdog+bounces-2016-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE9097E6E3
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Sep 2024 09:51:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE2392817AE
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Sep 2024 07:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3A06F2EB;
	Mon, 23 Sep 2024 07:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="HVnmai1L"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2053.outbound.protection.outlook.com [40.107.117.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB9B7344C;
	Mon, 23 Sep 2024 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727077846; cv=fail; b=Vvv+MykDVCMJnsnSnHKxPjBt+3v1QsijywsCcN7IHPdVybwFc9LtRiJtzwZ6CfF0Y2+mLquCy2d2kZYAhiKWP5JNVKKrbdtZH96bverEEmvzEqifGCNNvKyZG6Qy3WUb0bHS0aIh+sZm3NDbL4sDwrcU9u/FOB9IepaU69QsCcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727077846; c=relaxed/simple;
	bh=mxIjzoSRjaWcHqJWJxCAA5j7+5S6WHHRCDqBzrpY7RM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=niQCvr4DLVGDpcBIwwfBn4yfetrqRTUZMtU3EX7S6JusmnlWmyQAo40AJe1K29EfnUsJ+Hg8fRrcmx4tq/maNkWRJpKIqEaF669hj+jouis8xpKnVxG6opmewndGL01Hca8CiiW1qKIpqnfrufDU6HeacCOJt9HUhgO8IXGIj5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=HVnmai1L; arc=fail smtp.client-ip=40.107.117.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wiv0/sxivFdHAFxrwoos2ATXr4uf1tuRc8lhMnqBxbrOsb9G8Bw8FvYnGhM/pvDzp2nqQOf8glxJCykaPYHyxNcP5o5yab+SWEWbTUQEl3LHLWpum2oP9palNomgwlw/s28Bu7BVNpi2/tZJn26Quc88uPk1Ggg8dZXJFJiBeEHaY2LZMMO6NizHG7kwRqtZWNF+u8HPcGk2j/Vd16OU2YhBG9+cGJZu3uetfSe4bFHLfXbIAhs/ZqTrE8PKjjd8TL4Sng6wGKVXhdiToN4o66qDANtR/lEhR4uC4LhG09XtvF+u7j7vt0zvzYg3QWXpFJIZKT+KSfRDX/gRKEoryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+WGbRvtU9yD7vE4pJHIoy4Y7EumFZEIM8xx/uV4YJc=;
 b=r7E1jN6e0GyN8yq8oIG152/sjCU/R65W9I8XBcCdpRz/1ifeEL53I37MzmnIdh0PJ+Ya32tx1H7FRUlgEzagkrEC07h/2rD72vkp2ZDZE43+TeUQiupS975A6h7oy7zAbPs6omowBRR/s1dV0QQ8BcYvMfFApdhvT3k58496obxNWvGme+c/OwHbhMm70hiY/eZ6FgqXitm4tN+mO9UXpDZzckL4exs8ZQG8TxPr8OsM+4/wP8gD/iSEdgfdNM+ujNLRoX/ntSwW2oXze0fobzO4OMX/qy7KJ8lx53Gqo3abwo1EUymT9eUS1yR3z83bHriSU6eGa7B77PWDU5MjHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4+WGbRvtU9yD7vE4pJHIoy4Y7EumFZEIM8xx/uV4YJc=;
 b=HVnmai1LniYAgn3h2rbWKicDJ6NPXRxbFfTAsCl3vquZa095//+aScFYpMLJn6MLvZ5C/+08TQ3FEXeBS8s2xD47yqemdUzlfrGK2A71JfjKnWjSEheL7LPpdASC3EURmQpX4z9z8NjM6XeiT1+Y3+d1uMfpeKYjnmFE238q5RX5db9kj1JGK5N3YfW+rMdwlhEqc2fNY6IWe1rfudni9e2D7dS/VtpPwD7MoQRKyLqhicKShZe2RylW8+nVPmPGP8zpji2b/MD+kLq2bzoFUTQ6w8XwxjjBLh6DZmMjoIyWczcfPQokZsqXI5QqRqxhq0gn+r9fVqbUlJWiuIvOFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com (2603:1096:820:31::7)
 by TYZPR06MB7256.apcprd06.prod.outlook.com (2603:1096:405:ab::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 07:50:40 +0000
Received: from KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1]) by KL1PR0601MB4113.apcprd06.prod.outlook.com
 ([fe80::7e85:dad0:3f7:78a1%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 07:50:40 +0000
From: Yan Zhen <yanzhen@vivo.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	xingyu.wu@starfivetech.com,
	samin.guo@starfivetech.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Yan Zhen <yanzhen@vivo.com>
Subject: [PATCH v1] watchdog: fix typo in the comment
Date: Mon, 23 Sep 2024 15:50:16 +0800
Message-Id: <20240923075016.2439774-1-yanzhen@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:404:e2::31) To KL1PR0601MB4113.apcprd06.prod.outlook.com
 (2603:1096:820:31::7)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4113:EE_|TYZPR06MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfc6aa0-da6b-49cf-e619-08dcdba46b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4S36UlVJRAJQijf9Z8GxwzBhkoLDduk866sX+r5CJqRS/iVqrK/C8bSdOi1u?=
 =?us-ascii?Q?5hJMiA0JrhBDeHslsKlWN9yhCuNNd38fnFhMckC2UCEgHMumMNDO/Sd851Z7?=
 =?us-ascii?Q?Tlw3dL/eiZ0zOtcyzDYF+HBf4gkL14vOMTUXVz5KleBCYsHzfzDdIUOY1IEs?=
 =?us-ascii?Q?Crd9/3K2v+Uwiz7e6+Cyql2azbuBcEGDSkOl0AXDny0zrKfp6bZwBIfBDIm8?=
 =?us-ascii?Q?7lLoMteZse1LbeSiUKoh78iQFVGzqvn9ZZUAS83SB+OAChnu3dzoBvqFhWTl?=
 =?us-ascii?Q?ABd9sIqk1RBg+Q2LUjktSkil4Pluxd/kWsw/cv3D9SqlC8ZtbIds3lAjB3J1?=
 =?us-ascii?Q?0dHkN9zTmsBuPXcSRKqyU5euINOGc0spAWVcOEmsDLf0pTm3TWoZB6KUbtrY?=
 =?us-ascii?Q?WP7YC+J42rit9NQlscMySPblN3vznlzA8hq8659B5D3MzQ714AKu1nk0ywXH?=
 =?us-ascii?Q?BaExn+fidDhZh1Ljv/4gEA9Jzo1/SsAHXb+kevlpOiuLlJLr7qqj49uqzddD?=
 =?us-ascii?Q?IvcUnA1SngNQfR2IED4+J3ptw6ZNaENGRgN2q/0rlWpOtcXerchQoxumPlWe?=
 =?us-ascii?Q?KNvWNwF9XBRd8K7OD2SGbOcyvOmLUNbFaLN2RRLhXr/yQRMsP5svqbTd4tgk?=
 =?us-ascii?Q?rUhv82NEIno2M27N13vYnk/LMr4+0qf14VBaQ6NzEFvDH5/axnGNyuCzwNY4?=
 =?us-ascii?Q?if2cCXkTft6aQpYEW4me5Vb2XbmgiBrnNJsdi4HjM9NEWA71rTdrHXYv3QKZ?=
 =?us-ascii?Q?iOioPPbAplOgEuOAoDpZaxTtvhhsGFk1UMQ3qQzf6vLIvD4bU9EZeoWn0uaL?=
 =?us-ascii?Q?n4BEHdsNEeALLvxnSvX5+ff6Uk/W750qIDTNm+6tP0TePba+/wg+XdFucN+S?=
 =?us-ascii?Q?J7W+voDrXf+eIGjBdBt5/fyxQG1rot/lym/8chMWzWhnkc5cQviXscoL0v2B?=
 =?us-ascii?Q?GpV9BHuzzFP63KjLo2fyktBFah/0A0Q5E8kG+R98ASTbm/SrS/uMSGggv2VX?=
 =?us-ascii?Q?1yg6HtXoQec81ZCxnaV55rv+H5vvyyeNv6llp8K2H1H2wqWB3ZD9YilzdRmw?=
 =?us-ascii?Q?nAH4oJ3KYlZla/Qwp9i36gdaJ1jOny7wrBAgmqsrNYsPkH0TdEHYbqj0Pi6h?=
 =?us-ascii?Q?GNfSMdcofGVBNji1OfjcJY2C60nS4oHBwxDqfhes0bOn82/O7T7ZEYkCdt/H?=
 =?us-ascii?Q?eRypi7VQvOQ97qSMNurM/lsPm/LY14r6sF7IXVfj48GAUAg9H5Ik46IsdmWu?=
 =?us-ascii?Q?55PYjgPEw3IaRrHXLaiL+QeFsJ1iGDVbj9oZRlr1LVvtQU2Uk8PPev4oGDYb?=
 =?us-ascii?Q?xfHxx1kLjYjRA0ERAVJYGHOpFsOVoAai5DhnrESsrHMDpTBh+H5x4LXM3e4J?=
 =?us-ascii?Q?Nu3xhdFE7TTW3XuABMX5oTSQB8r8kxedHtATEULoKRV9U51b6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR0601MB4113.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qQ1QfORC+8OOsdaMENYt/LB4Hkvs3pOYeBgjaxR5iSjWyqS04Pm1vDfbed4G?=
 =?us-ascii?Q?yb5k/rCanMU8iTiFsMZN02J+7+TLXwmiMdeMxRZ2jCdbGwHG3E+ey04OJ3vj?=
 =?us-ascii?Q?ebiz5GqI6/Kcony3xL6ycHSj95Yc1SwH9Dy1RvTfQMkFuEZz6SC6YpAUPscF?=
 =?us-ascii?Q?tq0VQe5C5P6664qaweCHhgjZ+ujlXbViP2tzgzezYIqrHimkrqQtkLbv5WTt?=
 =?us-ascii?Q?tXn9rbT3Al7wzD+COb/NonuoAYZmXlx/tFSCxjCNCXhGDWjZxdbWidSv4Z0y?=
 =?us-ascii?Q?OATazK78+2tofDlevXUbbk19S7mAxFRAlAU9UE8GHSNc5RFszLWqqh3NsMRg?=
 =?us-ascii?Q?GtgN1XWmTNw0FYRG5H/c1buEAQPn+4+bq/cDLDFmyHSxkt2vsQJSdGlKd/gW?=
 =?us-ascii?Q?/c494nzzK7UZW/BUhImsFo/OFpJrD3KatXzhLkDOAQMtkcRz7SIFCjRi7Q6O?=
 =?us-ascii?Q?5WBg71Y7A3m73JBolOUNs2SiRlzYwWwdA8pT82u4Q4vkOEV0M9JyWbrANYOE?=
 =?us-ascii?Q?2wkFQsxX37U3Rsu8LDRmi9vlc5EqdEEN7ooGygD45PDiucwiR4vxWpLGk78s?=
 =?us-ascii?Q?MFYToiF+9VPaaxKkfRtbnPCzvRAM/zhmVfs05/Vz6t+l2yf7DGBTU62smme3?=
 =?us-ascii?Q?BH2uXIkET/7ydFLdL8fbkhLywbiR++IMfCrE4vizLmAzKWWajHo3uJ/3/32Q?=
 =?us-ascii?Q?I5eQDyy007qe9fmau/OztX4QehH61VUQ6AwNLyzLCKw+HCtWkzBgINQ8tiU6?=
 =?us-ascii?Q?6DrfGsjlunoPgvc5IH1pvbrhpNpCn2h2jBdMq0C2Bf3j8iEyBCY6UFkZm9Hc?=
 =?us-ascii?Q?4N1Yfq2rRHxYfCdyzUN1qXZPVVybcxkRiVlXpOl3U/64AEug8MrCRorK19UO?=
 =?us-ascii?Q?Dg31Bu7kQza5jPPwaJXLJVTO4Lf1XyqTc4x6FK2OrWTGG1WhMluimG4UrB1D?=
 =?us-ascii?Q?HXy0jrkMz3rwxnirS1cQmBL6xLvjuTpdSiARrBKKv5hpEYnfuLm3KZ6ZJnkd?=
 =?us-ascii?Q?tI8liliDbD9IZruxm2F0GDLihDIbwgeO1v7FYI0dKhuT2c4JP2lh7XkAw6Lo?=
 =?us-ascii?Q?+IY6kFVzJP7nrAgNy/InFbCOeUMPmw6HLNr/8nZCLQnrNIjP2Xqr01JMgL+6?=
 =?us-ascii?Q?KSrnAiYCUWM8Qd6Fzk8KIGWG6x8F3q9ZSDwEf6zjfngOWesiM6uZLxkzrXvT?=
 =?us-ascii?Q?EHGYysPPu6IvP421Pe6WRkQICQ32vtyIS3tEcBl4RKexlRmSBne9LmuNQFKh?=
 =?us-ascii?Q?U3cCIvMzABoSV9Yo29Pm3d6DciHTabZ1arA7KT0I1jDRz8caLQjnJLgpm2rR?=
 =?us-ascii?Q?1Mk1r/UPrEn8sXC27vcp9qN4DpxuWY5ho1ATigcoVgDLWsQzKIuqCiVIno20?=
 =?us-ascii?Q?dOZs3OX31H35E5QATGUu9O2VGlDIwAj91fdrQMhscR1JcWG6fcO0nVPb5jIX?=
 =?us-ascii?Q?n9woi9iAf/V1YhPvAcXuSJi621/5sjUSFQa8bUBNKTor9ooRQFP/GI6hDmdZ?=
 =?us-ascii?Q?qcnQROstYhn8aFmnjllVdVIZiZ/cWSIUar1teovoScOhAz61OlArum7tnYYn?=
 =?us-ascii?Q?p6ny2w++IAFp5GRM9rcTpDYWFDQBfsMFB8GtHAmo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfc6aa0-da6b-49cf-e619-08dcdba46b14
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4113.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 07:50:40.0116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2We/XTA/c54R7XJLpzHRRAPY3hWxhcdG5gzXaPPIrTEQYaUNpftf4WpcnnYlnzPEnHmL/AHLURsN6AUOT+73Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7256

Correctly spelled comments make it easier for the reader to understand
the code.

Fix typos:
'hearbeat' -> 'heartbeat',
'retrigggers' -> 'retriggers',
'funtions' -> 'functions',
'Resgister' -> 'Register'.

Signed-off-by: Yan Zhen <yanzhen@vivo.com>
---
 drivers/watchdog/pcwd.c           | 2 +-
 drivers/watchdog/rzn1_wdt.c       | 2 +-
 drivers/watchdog/smsc37b787_wdt.c | 2 +-
 drivers/watchdog/starfive-wdt.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/pcwd.c b/drivers/watchdog/pcwd.c
index a793b03a785d..c57293335d6c 100644
--- a/drivers/watchdog/pcwd.c
+++ b/drivers/watchdog/pcwd.c
@@ -835,7 +835,7 @@ static int pcwd_isa_match(struct device *dev, unsigned int id)
 			port0 = inb_p(base_addr);
 			port1 = inb_p(base_addr + 1);
 
-			/* Has either hearbeat bit changed?  */
+			/* Has either heartbeat bit changed?  */
 			if ((port0 ^ last_port0) & WD_HRTBT ||
 			    (port1 ^ last_port1) & WD_REVC_HRBT) {
 				retval = 1;
diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 7d3192d34afd..96fd04fbc2a2 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -52,7 +52,7 @@ static int rzn1_wdt_ping(struct watchdog_device *w)
 {
 	struct rzn1_watchdog *wdt = watchdog_get_drvdata(w);
 
-	/* Any value retrigggers the watchdog */
+	/* Any value retriggers the watchdog */
 	writel(0, wdt->base + RZN1_WDT_RETRIGGER);
 
 	return 0;
diff --git a/drivers/watchdog/smsc37b787_wdt.c b/drivers/watchdog/smsc37b787_wdt.c
index 7463df479d11..798562e8b92e 100644
--- a/drivers/watchdog/smsc37b787_wdt.c
+++ b/drivers/watchdog/smsc37b787_wdt.c
@@ -485,7 +485,7 @@ static long wb_smsc_wdt_ioctl(struct file *file,
 	}
 }
 
-/* -- Notifier funtions -----------------------------------------*/
+/* -- Notifier functions -----------------------------------------*/
 
 static int wb_smsc_wdt_notify_sys(struct notifier_block *this,
 					unsigned long code, void *unused)
diff --git a/drivers/watchdog/starfive-wdt.c b/drivers/watchdog/starfive-wdt.c
index 19a2620d3d38..a8b6cf767117 100644
--- a/drivers/watchdog/starfive-wdt.c
+++ b/drivers/watchdog/starfive-wdt.c
@@ -80,7 +80,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 		 __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
 
 struct starfive_wdt_variant {
-	unsigned int control;		/* Watchdog Control Resgister for reset enable */
+	unsigned int control;		/* Watchdog Control Register for reset enable */
 	unsigned int load;		/* Watchdog Load register */
 	unsigned int reload;		/* Watchdog Reload Control register */
 	unsigned int enable;		/* Watchdog Enable Register */
-- 
2.34.1



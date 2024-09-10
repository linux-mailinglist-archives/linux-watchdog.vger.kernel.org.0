Return-Path: <linux-watchdog+bounces-1825-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A89729F7
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2024 09:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 073AE1C240C9
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Sep 2024 07:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A89517B50E;
	Tue, 10 Sep 2024 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="PsVSzPdB"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2041.outbound.protection.outlook.com [40.107.255.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A332617B4FF;
	Tue, 10 Sep 2024 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725951675; cv=fail; b=sAEGHIT3tiJ1g1rqFooyTA3lLlmnYToN/1q2gMn/WRuJEMkYNicmHcd5lkkCskF6jAV/7n84IeSoReUqtP4D8MNjqiQ6dgZdDt98sJVYh0EO/9rcNGaESCPFwS/oeZYq+Jm5CZB1LPMfNFrUN+qC0hNs04mO8V1DArlErnqXkVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725951675; c=relaxed/simple;
	bh=D0bJWI4kx4QAbnDYfQkYtoqOhQ9YVJExlOvmzsZW6Xk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WtSCPu4h1Nvg1NLrrqzrJefxgLZyEgShtOWYwag11tUTQUFPQOU30o9CcscJC63NmWC9qKZmhQUChHIHxPQ5GE/ehMVmUqnOkRuLZ0NDofMs7oe6XcMtAuRSfWFbHL6NgcImRSRLbwPqzYunehiJ+GzOVwFHokLtZhjglMsxbgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=PsVSzPdB; arc=fail smtp.client-ip=40.107.255.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnh9R1ABOx3Y2CnHetZEGB8AvITYqBIcB0G7KbBpIhMiN2dNtUZ5b/Mh7GRC11CnXLbvGdcX4OHcltsgeyW/vO1PUOc4AJCZmIzk3Qh/qad9JpLHIHxlSq2IaCLa8HIIfILBAOQvaODpzFsmuXu0F8QlLUwPbAFer68d6oN3dUE4rrC6hX5/HbphMz47XK5A8W+dje130W5THUTaLARHJYa3028c1i8j+InQ5ZXF58dU5V71nPQqpziwpQMdS8bRGwmzoVYLr58oLwoMfFMi9jg5paHROZaq6H/16irpZ3QKIbspUXXbumodFUAvp4tMt4z58oYgDo7RNFbS9dDkPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sfdIx0/xYyIKnRdpSahiM1TBvRr6C4U4r8OEPxSxwVs=;
 b=tC2t7JxvExZoCUjU9aLWDgeTj+sSx69vSqaa7y3usAq1E8fpBFTQQ4GO/ZivO6xyQrF5vK4+I5Xs25PFURMvTijWEEZTUXponK5Jzg8LrSE+HQMfZoAOfG7pR1KXnOPYt5tggEh9mPzS+HA37IVYYIj9lwwtQ3T1u4qpt3yL0csWlCxzODQFdBB1uHGHeye4Zzkb84pabnLDLrvF5H3tFW+9VNSdsnfQVEYPKRm+j5wQQjEzc17/9p0Re7XjhH8HLZAUwJ1esOLOGRYLMBwkIuNebGj9if5vQdpFV3439J+hdZaF25Hs9a0j7AcY0cLpMj7zXjc49y5UMpAT2esgdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sfdIx0/xYyIKnRdpSahiM1TBvRr6C4U4r8OEPxSxwVs=;
 b=PsVSzPdBPUyCZUDJDiZ1eYebmrRoXDI63BsgLYlz4HRyQpeRIXq6MxX5KrAU1cFOBaYSa0IU3VRWZ2RjgNKL+1lHB/xKqUAgmhSteLBl9kePM/0iLsp+qxXgoPRKUYSyIj7RApq4i+RZFsJMQ74IqyEkRD1lvBHk6Kc7LWCp1lVL8DtTy6aBWenn7yJxQY3t5jYcR3MynMKIWoKPgAlCKL0thzRoXzh7VBt6x2OMEw71FkYWZwaxNVxGPmVTVHQzFTzKukkScCP5vzHwoUcurNRYQGVvNQhslgqWcSqvjQaexHZO2nqwxrCt4Ibba45QrHx5FhSrkbagAeH2G7VPWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB5896.apcprd06.prod.outlook.com (2603:1096:820:db::5)
 by TYSPR06MB6409.apcprd06.prod.outlook.com (2603:1096:400:411::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 07:01:09 +0000
Received: from KL1PR06MB5896.apcprd06.prod.outlook.com
 ([fe80::f820:452c:5a5a:fea6]) by KL1PR06MB5896.apcprd06.prod.outlook.com
 ([fe80::f820:452c:5a5a:fea6%6]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 07:01:07 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] watchdog: Convert comma to semicolon
Date: Tue, 10 Sep 2024 15:00:58 +0800
Message-Id: <20240910070058.40867-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28)
 To KL1PR06MB5896.apcprd06.prod.outlook.com (2603:1096:820:db::5)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB5896:EE_|TYSPR06MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc55f05-3cbf-4a2e-1667-08dcd1665806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fnnSz5KSAdK9v/RIoVzM+LO+md6qTSmRjiYOmO+jWQ8UL2Ws6p6V8EEg6hiu?=
 =?us-ascii?Q?EkLYJFBR0v0Jd5TDtj34PVZxybxapQUOphnNv8ZMNtyNty9fWmHj/sQYQDkt?=
 =?us-ascii?Q?HLvxv1mZNSwaa/cCFk3OqXz6Mc0pTU75dqD8fFzS21+xVxuREkJH4SXMn7n4?=
 =?us-ascii?Q?FIl7BqnwqfM60FjSXWfi7wFj5LKBqDeMmzhKb5DHXAEP6fBaeYJawTX6hMUD?=
 =?us-ascii?Q?+sUQF6cKmg8JK5/UZtxS6fTbtnFyUwVnrRbTL2vmX/3clgzGjTpRqW4y4a8c?=
 =?us-ascii?Q?TaUbgCPzfi/oZYyIKv0Bb622nrWLpS8TazOPT0jh0DVmZoteBzzeIOgx879x?=
 =?us-ascii?Q?sTgtGfpQ6wEDpYSsJ1hGbmN2YJVNzTQOci4zyg1rDJE22TAvgaOAUxkCxtYB?=
 =?us-ascii?Q?nnwr43Pfu8kxNcecXQZ4QhnWTNAi1/Wl1Jk88utIBARW+cL9AG9/NMo6qVHy?=
 =?us-ascii?Q?8X0+uHxDd23x1MhBgE/UJAIor2eu7rl+uiLHjy92XfXiAREeqwK9n4QZkDSt?=
 =?us-ascii?Q?mGeHxPzs/PHcmA4zVq3QC1kaFBTnu3Ft3f0hMLi9NH2r50fe0ED9B/+f5Cpc?=
 =?us-ascii?Q?6FUiHzfgbslgSEE6Snfk2o4Pih3YaFqEMqO3zn79WpJ1Kch7bbVdOPjpgkhE?=
 =?us-ascii?Q?EutUNdDzt5L1p0J6pZIPklnHKEk4sbo+hlr/q2ZFuYTHMtAbF+M/gHUEKIl9?=
 =?us-ascii?Q?w6KeeTs1MWY22ktwjtTgXWbfdskynxKGO6eSswh+u3cUK3gYf75ocui1MZ29?=
 =?us-ascii?Q?7p80BOlPDO13wQZCEgYS8QOZiLnfoiWE99ml2+/C1UHYj/6epe6MYkUcBcxz?=
 =?us-ascii?Q?akv/DsO42GhJ9b2+IjsuSxLz9avJQaCPzVVvvHRU/0of7Oevmsg45t+IJ5MZ?=
 =?us-ascii?Q?XuCUmOyitoXIvGU8Vfsoq57nQsfKUZblDTy0dbs8BpSycCiBAExbATHyZywo?=
 =?us-ascii?Q?yEIfCLKJu5Zh3vzrX7NCMiwAk+F/EI047moW4f7zb+cgzckgzUz41SFDjdGH?=
 =?us-ascii?Q?IskS7R/2iqX8aJt4oe0TNZKMsrSN25TsRuWVu4nHEu0m8iHnqIMs8Gak2ypI?=
 =?us-ascii?Q?5i3P/5T/ot5enX3vL5epXvQcxFSQMbNMJ1ovGXdgN0TxZy75wYMp1a5AB0jU?=
 =?us-ascii?Q?17DadV5Uh3Ilxbgx12EeZxx6ZZc546oBbbGoAlE6tMeOwr0CFdY8Y8vrshUC?=
 =?us-ascii?Q?4AYCqr3bZMDMiZb4lJyklxsKaqHpKDpPcNVcD/BBFXXniyfxzsuUs9MxjBhH?=
 =?us-ascii?Q?UvlEC98piIlM2QtHFHjjAhP5ix+UvJ59ce2vf4UsFhZx9eaVzDQAhy7tpMAD?=
 =?us-ascii?Q?kFP9oltMw9s+U8LcftylJI/y09D+H4Ajptz2mhU6J7L1VEQF89wa6x9Jz1Hw?=
 =?us-ascii?Q?rmXnd8EvhiS4UqnMXWWMsTgo1KjmwxTbmKtl0OO+falrUSc85g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB5896.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/JCJqjkZjgn5EWpJQjcfTC7kxTpjqHepLk7FFdN7401WnVXzeX8QFQbWNiGp?=
 =?us-ascii?Q?2hg3FMJrDDv4uG8zoahUj4EZCdEj6NF9nZt0jWu8viyEnhUCv8pXY79/q3kR?=
 =?us-ascii?Q?qQQ/Gj/ye3oYsiFMrQMgzI6VM8Ko2o+28+HKqAJhHQXaZSQjaUUYdpZAeOEI?=
 =?us-ascii?Q?NWHwpQ80TAIIM+ZtB5ycVO2vW4Pp+JkCc131ilhmqvBEmR1OaJfthyJh+737?=
 =?us-ascii?Q?BXTd6RKqFG9FGLpu/AamjAHbAX33l+zQfjJ1eeonpxpWEgZRnb1RIao1E7QU?=
 =?us-ascii?Q?5coxo0QqOS4Gbif2oQtcveK/KhMmmtTaC6Ig+UqDdZgbuvI1MVkmHjrfl3UN?=
 =?us-ascii?Q?lXGSlu/EAYgi4hgqR11DQo7jC2t5fFa0WxNRYC9OIPmURXcURzgT1Cf/r2mK?=
 =?us-ascii?Q?nD5BFxbu2Nmo85ZLlzLxMxHgOr4aP6YnXXx0PFtJfkeBhRANJjihNu8w6gke?=
 =?us-ascii?Q?/alPhSHzlkTRTJ33OcdhKxklYEumaY1sxBWDbyhw9Jq6hAbgpduozl1P1RGp?=
 =?us-ascii?Q?W4RqLNPnO2HOq/PwGYr/G3iU/FZ4eqVQ1NqBnZPU8eiDyVtDKFAdmynhCxUB?=
 =?us-ascii?Q?c37xxFWObYL9x2eZUKI++HWa/EBS3X1DRNhspDLWhETLyKR29fGcr8P5yHzN?=
 =?us-ascii?Q?m29Jx2xeIDd7BiyoXmrmXaw+dDWts+fBaBMQqBaXs7Uhrt6CZ+NOfNkwmlEU?=
 =?us-ascii?Q?bx70j2K6Ip1CZKLW0X4mrSo3ZxSZXWoDzXIigB0ujLxbKwvCCPpzDcMPGxOb?=
 =?us-ascii?Q?2xhZqYeuP+NYgJknVpHQKN5dTFgNf8kwATXQpazA9yX1PB4sfaOnYfOfOSFE?=
 =?us-ascii?Q?7/LeU9Wxk6nrPUJIyoje44qDOxAPPNSPaE4aK9uGGAWzAxwWvYf9KEzFTB+r?=
 =?us-ascii?Q?GJdSh+x0BODaSwOLMtKmrXmS3OcCpaceFrBJv3k+MjkGKnkgJaRvzLTYxeLC?=
 =?us-ascii?Q?i2vOljRx2YJNiV43mV8/V8hWKp+CxoUDsvBypYjWDfPIgUtIX1v5Dd5vfmkQ?=
 =?us-ascii?Q?mlm9UkQX4J9kF0KUICtoH9bC3UNiWogXmypYlQa3yDzJPOkSghgMxNMG1+ZY?=
 =?us-ascii?Q?am18tgjAo0PKrAdNbs9YrJKdIG9v8VHcQ4c/Na4APwXmD9o++mpU5KfNcGvy?=
 =?us-ascii?Q?1Up8Ow7exIEQir3G8WDp2Du4VHSuXyVePLl1O7Uf6hMgTJ/VQK33/PQTuQ7V?=
 =?us-ascii?Q?QUh2Uvv+1fmMReinEfudNcxfeg+lpmZWrB5l5te+TwO2Y6yMEcrdfc+f1PuH?=
 =?us-ascii?Q?3qH8gEMCEGOMgP+3mpSJyWJbBmz3ISEEEYi6uSSgbTjoQXcKfV9peyT7ealY?=
 =?us-ascii?Q?FZehwnhuhAe4NnfAcZD5j7A/As5Ezww+lnB9Rzb1nNwGE5JQIXihIT30ddTk?=
 =?us-ascii?Q?I7E9F/YC/rCzhpCvCPRR/UYeHLGvnd4m3OSifrMAmLmzhYiXB+ri2ccv3C4D?=
 =?us-ascii?Q?OOS0SXFrh0ZdovWSFtm3DTmQKF2BcdOso6vzJNES3IYuwvA5QXWCjQleOi05?=
 =?us-ascii?Q?oh2csJwro1UCcGAjVKfEfktHWpNO1kqaaDE0s1YHWluroein5DaO6VnFyuGR?=
 =?us-ascii?Q?K0vY67xqRrcN7Hfdz+QS8R1202j82vxj7wGrd9rW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc55f05-3cbf-4a2e-1667-08dcd1665806
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB5896.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 07:01:07.4581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAr0gEWPU0HEvHncA3rXjn6JcXwhdW5lnQqiIqSRrGzU8C9wsnM2rRYMggR00jaz7hGG0uZ3zIe8AExZvLWvvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6409

To ensure code clarity and prevent potential errors, it's advisable
to employ the ';' as a statement separator, except when ',' are
intentionally used for specific purposes.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/watchdog/iTCO_wdt.c   | 4 ++--
 drivers/watchdog/pm8916_wdt.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 264857d314da..35b358bcf94c 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -563,8 +563,8 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	}
 
 	ident.firmware_version = p->iTCO_version;
-	p->wddev.info = &ident,
-	p->wddev.ops = &iTCO_wdt_ops,
+	p->wddev.info = &ident;
+	p->wddev.ops = &iTCO_wdt_ops;
 	p->wddev.bootstatus = 0;
 	p->wddev.timeout = WATCHDOG_TIMEOUT;
 	watchdog_set_nowayout(&p->wddev, nowayout);
diff --git a/drivers/watchdog/pm8916_wdt.c b/drivers/watchdog/pm8916_wdt.c
index f3fcbeb0852c..007ed139ab96 100644
--- a/drivers/watchdog/pm8916_wdt.c
+++ b/drivers/watchdog/pm8916_wdt.c
@@ -218,7 +218,7 @@ static int pm8916_wdt_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	wdt->wdev.ops = &pm8916_wdt_ops,
+	wdt->wdev.ops = &pm8916_wdt_ops;
 	wdt->wdev.parent = dev;
 	wdt->wdev.min_timeout = PM8916_WDT_MIN_TIMEOUT;
 	wdt->wdev.max_timeout = PM8916_WDT_MAX_TIMEOUT;
-- 
2.17.1



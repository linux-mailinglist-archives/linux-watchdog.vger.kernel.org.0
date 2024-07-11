Return-Path: <linux-watchdog+bounces-1359-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB692F22A
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 00:41:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C74F41C22530
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 22:41:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188A16A382;
	Thu, 11 Jul 2024 22:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="fTsKLlBH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013045.outbound.protection.outlook.com [52.101.67.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901A1A01AD;
	Thu, 11 Jul 2024 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737679; cv=fail; b=pER5t3pOChRI8Zwb2+Ji856feCNLXhu0WRUknHfbk6cfYBd5zQAORVahNdTSLJk6XH3Nbp86gPspQlW/z8uVgUsf7MHwA004nSrhCiYiy1Q9xQXmykVDMRX/zjsYZB1c/80iW6095HO6NNysu2pMpOFGXbnpC/681JruJL4xDbE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737679; c=relaxed/simple;
	bh=uEiuhLf1huRMmyUKhJdKb9SI28kHXbFCt0l/dZKE7cc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CRujHB5taRoA5Wl8A6hER44bBroSbRWlV03RaKXbrT3yVZH+ohsudX5cbaiELyyf9fnweod6/Fk6xVz3wstDKnZWclbl1hcnvqG+QsLsCbCmnn92wKBGq7yOjneFJ9oNBNR9eMXHWjZzSXrLUOsEJ7dMpfHnYIWo6mSD6cXfKhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=fTsKLlBH; arc=fail smtp.client-ip=52.101.67.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rI7zPRuU2niJvDgG/+RIMhzX7He0ZacMOQBDEXaMM9pEthOYz7II+4EH7yaJaP17SEh97NFS4BFqg3Wtjeett2tdEidj8Z1Jv6vcWUsmGxkayKSZVb5xhF0oYWu9MYVrwMHcb/fN8nPkcp7Psrkp53EgcgPk97sWyw98wz5CmunJLMbkCqHu3j6MgfqfPxcye/ftYKHsQXtLsNdt9viWiowSp63Mv44I9egUoujp7cA2UUjKy+mzep/DXL4uj4HcuYFVEr3snUOUMtit0fbrhB3wLB6FKYkbCby1lhhGCBfPwmu79YC/gYDMM6ZGmuTSr+0FDXw15dr/9oxNknysVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ab4l3n6rAricfUg7BZy8N6NQpjP9NTqC5ViGQw4g4Xg=;
 b=fN4XyP5iIWqOcTx4728JFtm9LqD9Ng94nMMgpUYS0FUk0A1tg8hJrDHZq+tgr/g1xLnMAh/GbHGu3wBG6JrOYgeeGyLYY3+Gi822cK77YDVuHZLPEk1ZXQCGfvTdLZpSsiEAoJYSdZhdNBIKrbQdVLaPD2b8ht9RStFZdFA73g2b5RHvh3YmLZdgcTZUvoO72dPSJJ2qlidLECgiQAO1h3yhRPWsMeXj0BCGvrcKNXfdEgMr7mFGYqxn7J6WgEBn6DYIPs2y+UBiB+ng/9rrx71FbgQgzzV7+yNsgFY/oSDH5kUBwRuKIrso+4bftFQGUiml3M9gc8s7TP1a9KZomg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ab4l3n6rAricfUg7BZy8N6NQpjP9NTqC5ViGQw4g4Xg=;
 b=fTsKLlBHUMv8x/vcQLHjFXwU0q+2UwZw9IGF4lq1+nx7RfJmAy+e34aAsdfkeUwlWb15UlZ3WK9N3njk2Dl1RtPs4k+2PVeSIh8AxpJw+ybgWoSQcPnUOQ9DULizaCAbBHqn0T4kVeFxnouW8JuR1/kumM/CCSAcRkisQU5sU+E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 22:41:14 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 22:41:14 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 11 Jul 2024 18:40:59 -0400
Subject: [PATCH 1/2] watchdog: imx7ulp_wdt: move post_rcs_wait into struct
 imx_wdt_hw_feature
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240711-wdt-v1-1-8955a9e05ba0@nxp.com>
References: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
In-Reply-To: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ye Li <ye.li@nxp.com>, Alice Guo <alice.guo@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720737668; l=2641;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=uEiuhLf1huRMmyUKhJdKb9SI28kHXbFCt0l/dZKE7cc=;
 b=OdsQgIoFHjogQZwqSZr7Kb3UILPxxzhHcotxGri/G9JF21o8a2WRldW3M5shDp45jK/yn1tZT
 jwwI1YCp2LDAXH1Llh7C1f5JUJn1w13eFKQAOQI8qLkorSQUNv9W0nN
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR01CA0024.prod.exchangelabs.com (2603:10b6:a02:80::37)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9519:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fe0f9db-b606-4455-b5ed-08dca1fa9212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amltblFDaWt5ZW5qNUdMOVVSVkszaVF0N3R0UnlnTDdrcnZpSkxMSURlSlNW?=
 =?utf-8?B?bHBuTURHajdGckFiSHMrdVRaTzJnci96QW8vZzcwNHZLVERmcEpqNzBlT3pQ?=
 =?utf-8?B?RVI0dmNCQmd0QUI3b0JYZndRNDFZNXU5Ujk3Qnp3Q3E1enBSR0JNZVpFd2pM?=
 =?utf-8?B?d2Y3ZjZNb0NrTFVjOE8xTkMzcm14Mlg5ejJMdW8zNHBPb0ZkQmNmZWxuTTdD?=
 =?utf-8?B?VDNXMElMcGNUTm9hRWY2N0xVSm9VQ0M2Q3RDMVltQjJybWJTdElzVFdiL1ov?=
 =?utf-8?B?TUl4OGg5MVhaRzg3ZWgxUTQycjZXKzFRVjBNSlRHNG9lamdveVJtZUlsTVVG?=
 =?utf-8?B?bFhYSlJkZVp2T1JMUHl2RmxtRzVVdlVzVFhNYUZ1SG83UENTcVh2NUpEUmdt?=
 =?utf-8?B?SzZHZEM5NGczSnE3NHRYb3J1ZnhEbDBwNlFDcy9sc1A3TmFWcGJaY1d5b0tm?=
 =?utf-8?B?azBoMW95ajRvU2s0aUFWays5dWRwT250eHZmb0ZsNW4rNTE2ZGl6aHptOUdq?=
 =?utf-8?B?T3JnWWRZZ2JLMU84NjlSRDhXSWQxaHpEMlJkK29sci9XTHFVcnhYNnEzZ0NT?=
 =?utf-8?B?dzg1bjlTSWR5UGlUR0NoQytjMkh4WGxaZnk0Y2dUL2VjbHpIeG5uL3hoUnBz?=
 =?utf-8?B?WjdhYk9ZR0JiODVSM2RTV24wR2JlUlhjNHVjNmVMUXlqa2FQaWU1NGlyU1lL?=
 =?utf-8?B?MUpqQXRPVmhpTkRaYllwNFR1MEpaaXpxWThsaGI2SFJncUhrd2RLZ0x6Wnp4?=
 =?utf-8?B?SzlMb3ErOE4zOVI0a05TVHJubm5pRThUVjFtd1hGY3R1YTY2S3I2OE43M3ky?=
 =?utf-8?B?cGFmalh3dUpEU2UwbGY5R1BZdGVraWg2VEF5SnhjNmJnTGZzcEQ5c080R2to?=
 =?utf-8?B?QXdVSFlzZCswUnUvd0dtZktLd1ZSWmdlOW1hWC9nU3NDRjN0NmorbS96UzFU?=
 =?utf-8?B?VlIrUVN1MkJ6RHZXb2FFMEFRSWZhU3BVelFVbStjeGI0ZXh5eC9nOFlaekZV?=
 =?utf-8?B?SFZxSS9QRUFwcWxZY2NBSHZFS09Tem00dFlScDlxVkdzVXRYNHJmOW1Tclps?=
 =?utf-8?B?anF5aERkMS9naUxhWGZGWTFLQnFUOGt4N2dGM3RqR3NXbzFJM1QydkpoOUE4?=
 =?utf-8?B?TUEzd0pLUXlPc1VJajhqKy8wemdHNGIvNEJaUFlNZ0ZSbG9XeE1ZRVNMcGlm?=
 =?utf-8?B?TndXYnNGZEVBOUs3eEdJcmtuWjFzNzF0TTU0TkJzUFh3djhkbFcvR3VPWUxj?=
 =?utf-8?B?R2tNWlRJeGtkOXE3V091LzN0eU9jeElSVm9rTFFOdDdFc3poTmdGVFZHcnQ3?=
 =?utf-8?B?RmFsWEo5ZTJmb1VseGYvd0Y3S0xMaTQ4a1lQbC8wTXlKNzRrMWsxRGd6QlhJ?=
 =?utf-8?B?MnQ2ZDExVklQanYxZmZGc0Q2eVVVUElxanlWS05LS2paNWlIdzZFU2pLcDly?=
 =?utf-8?B?V0g1c0Zac2ZBSForNTdsRnRjc2dzUUxER1Rvd3RoQnNBNmxsY3h0U1JCL2Rl?=
 =?utf-8?B?R0dpSUpGMy9hRFV5ZG5CcHZsK1pBb2ZSUnZiSDZXM2h0U0JmV0JpWjFLOFRI?=
 =?utf-8?B?Y2Y5MUZVdFNzeUFFZHhiNUhlN2JPMmtmNUhGdHNaSEQyUnR5Zlo3WEN2d3VW?=
 =?utf-8?B?a1ZXcjFOdXdnZ1NGZkhjalFPM3ZTV1hPdnlDK3ZiKzN4a09LSERNbUhzMXhV?=
 =?utf-8?B?eUk5SWZ2L3VZaGdOMVZJbUlwTHpNcnN2cXJXWWp1dlJHUFptMWFzZ1J4NEhL?=
 =?utf-8?B?MGU0QkRSaktLMkdLSWdEckMyd3M4VlZQaW5pTnFUUzl5OHB1dGs3Ry9VR1dy?=
 =?utf-8?B?QlFYTitHN2RXM1VHa1gxeWNUS3Q3OHRNZlphYUZuYngzUENERFpVMnQ1Rk5x?=
 =?utf-8?B?eGJ1WjJITS9IZEQ2NEh4MkhVdHZDbEFaSUYzc2JWTmN2OEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NHFxMWo0NndmallCMXpSZW90amF4ZkJBRDBZZzd0ZVo2MjZnZjB3WUg5d1BW?=
 =?utf-8?B?aGY0SjNWNE5wa2UvMWVCRzlSVUhCVDV2SnAzOWJlOXhMTHl4Yzh2eThwV2I1?=
 =?utf-8?B?VGdwajJqT1ZqdkRBZlE4STdSYUN6TzJ3bVhPY0dTN05TTVNTNFVBR1FiODFp?=
 =?utf-8?B?MURqVGtPSXdadlVjbGpjcVZqZTl2OVpuRitPUVdTa2lvaTIyWTRTS2tmMC9R?=
 =?utf-8?B?YVdqcHEzRXJnMHA0eXdxd3pDb2kvcTFieG1GdmhBWXNURmRMdEhlZU9SNC9R?=
 =?utf-8?B?UUY1amdleDdORG4wOW1oTE42L3lDT2hoTmpnUDlGMUNRMFpEUXhSei9aNGly?=
 =?utf-8?B?cjJkQUdrRDRtbjE5alNUZjZCczZzMytlOFQxWm95cXNDdTRuNUU2L1RBQTlI?=
 =?utf-8?B?aGJNb2w5R1Z5Rk1xaDdnNWlYTENSeUwxemUva1kwQnVzeEVRMUs2emlpdTZU?=
 =?utf-8?B?eVBOTzQrYXlldUdacWQxZkhOaTBnNm1tNGVrZFZlSm1LZitPUGwvSVZLR2x6?=
 =?utf-8?B?T3BPVVIxNHZHSVRFV2dtUUJwVmVyUzdhQnk3YlV2YnJsdHJrRWlUcC9VbFdT?=
 =?utf-8?B?RS9NdWxUZlBTR2o3b1BaeDhNY2FTQ2tYa2pIajJMbzhEWlVlRi8xTGN0MUhM?=
 =?utf-8?B?Y0dldmtnMmVTMlQ0RDA0UUM3VnpQSFhQZDdkdkIyS0dMeHhhZTBsRmZWUHFG?=
 =?utf-8?B?RVpUc0dDU3pKem8zdzVHNXdFblI3ci9zMk5ORTB1VnNRV2wzNXhENzkrVVBr?=
 =?utf-8?B?ZjdGcDU5WnZkaGpXeGh0MWo3UmVuSm1Jait1NElldm9OUUMrclZRK1NNbHZa?=
 =?utf-8?B?THdaaHhKR3NiK3hUVmZDQlU1anpKaGdQUTFKUnBFdW51UERLV05pWlk5VDVM?=
 =?utf-8?B?R2EvSjduT2NLWWRKOVMxdURZbm9KNi9DSjJoRjNCc3BCYW1QRGxaQzQzZ2xR?=
 =?utf-8?B?NzkrSVp2blIzSWZpZlMvYS90QUxYT3hjc2VWZU9adGVmS3Jwdk55MGtLakpn?=
 =?utf-8?B?UFBPRFFkL3Q5eUxqcXdXS2s4c3lEQmpBSjZMbEZsYStVTXBncFBWaGJWMGp1?=
 =?utf-8?B?VmhlSkppVTJUNVoxNlVUd3lCSGc4Wmh6Y09ENXlRR2tSU0xVbjNXNmJUVVE2?=
 =?utf-8?B?T05MUFlmZTFONjFMTU1BTzFHT3pJc2ViQyszRkdUb1dvOVg0cjJLYlBpTm9E?=
 =?utf-8?B?cjc1RWFiNEZXNU5xSzhKcUUyd3d4Z0ZUVVVDWDJUQXdZVUpUUjNXVFR1bUlO?=
 =?utf-8?B?YnBnYmJhaVJyVXlxSEEvNDJRSk8yN09ReGt1S25TTUtBVFFSWUtoUUFyU1BB?=
 =?utf-8?B?dXBPVnI0UnFsbmdsRE9oOE9sSktqMlVDandIMDVjYVc4d0JLYzNpR2wrbk1s?=
 =?utf-8?B?UHNNemVwd21YNkwzSHFRa2VUeGQ5UTViUVA3elU3c0FLQ3E3cy9WNzAwWmZP?=
 =?utf-8?B?TWxuV3dTbDhnNXgzekpwa2hza2U2QkpZNkwvSkpEWUl2UHIrZHB2dHJCRGsr?=
 =?utf-8?B?MDJScGRjazVITHliQys3UU16Y3ZRNFcyZ3Jwc0FDYXE4Z1JhUEQ4bjNwSDIx?=
 =?utf-8?B?Y2lNWHZvLzZSa05FbDFZejkxSmZUVDEySlc1b1grbklkUzBmN0xrOE1mYVNw?=
 =?utf-8?B?eFVhSGhYZzFNVmhSYVhHUFh3Ylg4QXlrVkRyYVFMZ01ZZHhIYko5WDdySmdl?=
 =?utf-8?B?RDhpNWdsVnVQbVJsbFlhcmJJbE9HTFh4VDBjY0lqSDRGK1U2ZTdQMkg5a0oz?=
 =?utf-8?B?OEhBcExLQzQvY3BzcitWVFIvbmJnUDM3UXo4OVdESlZENElJalJnTi9LYnRR?=
 =?utf-8?B?aEY3cnFGVFdLdnRuRTBFMWg1MXFEMCtteDJBOHhiMEpidnhCeWpGanR0azBs?=
 =?utf-8?B?VGVocWNpck9HRnpCS0l2Vk9xNDVzeWxadm1MNjlwalVVWTIwaGk3TGY3emM0?=
 =?utf-8?B?aHVwaTZ5UXZEVk5TZjVsRHd5WkNCZDZVeXk2T1VpRURYdmNUWmVIMWZqMVJm?=
 =?utf-8?B?MkRHb2xqT01hSFI5TlZkNSt4STZMcnZWcWJrbVZ1emp5M2dLMnE0SCs5d1BG?=
 =?utf-8?B?a2piWnV2TXJxUGtsd1pSNUE0ZjdocndkYWJ3blM5MmZ2d25rVVRXcTNDbFN2?=
 =?utf-8?Q?Mh4j05oz4mLsAqGV0fqGHPcKx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe0f9db-b606-4455-b5ed-08dca1fa9212
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 22:41:14.5194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy7OdRoY9WL2ebK7K2hYxAG8XXTOGyYn/KF+NllTwTNZcYc7w7ZYmhn2AvFa33SYR4k/VCOeUOxApR9s9QY1VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519

Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
difference compatible string.

No function change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 94914a22daff7..904b9f1873856 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -55,6 +55,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 
 struct imx_wdt_hw_feature {
 	bool prescaler_enable;
+	bool post_rcs_wait;
 	u32 wdog_clock_rate;
 };
 
@@ -62,7 +63,6 @@ struct imx7ulp_wdt_device {
 	struct watchdog_device wdd;
 	void __iomem *base;
 	struct clk *clk;
-	bool post_rcs_wait;
 	bool ext_reset;
 	const struct imx_wdt_hw_feature *hw;
 };
@@ -95,7 +95,7 @@ static int imx7ulp_wdt_wait_rcs(struct imx7ulp_wdt_device *wdt)
 		ret = -ETIMEDOUT;
 
 	/* Wait 2.5 clocks after RCS done */
-	if (wdt->post_rcs_wait)
+	if (wdt->hw->post_rcs_wait)
 		usleep_range(wait_min, wait_min + 2000);
 
 	return ret;
@@ -334,15 +334,6 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	/* The WDOG may need to do external reset through dedicated pin */
 	imx7ulp_wdt->ext_reset = of_property_read_bool(dev->of_node, "fsl,ext-reset-output");
 
-	imx7ulp_wdt->post_rcs_wait = true;
-	if (of_device_is_compatible(dev->of_node,
-				    "fsl,imx8ulp-wdt")) {
-		dev_info(dev, "imx8ulp wdt probe\n");
-		imx7ulp_wdt->post_rcs_wait = false;
-	} else {
-		dev_info(dev, "imx7ulp wdt probe\n");
-	}
-
 	wdog = &imx7ulp_wdt->wdd;
 	wdog->info = &imx7ulp_wdt_info;
 	wdog->ops = &imx7ulp_wdt_ops;
@@ -403,15 +394,22 @@ static const struct dev_pm_ops imx7ulp_wdt_pm_ops = {
 static const struct imx_wdt_hw_feature imx7ulp_wdt_hw = {
 	.prescaler_enable = false,
 	.wdog_clock_rate = 1000,
+	.post_rcs_wait = true,
+};
+
+static const struct imx_wdt_hw_feature imx8ulp_wdt_hw = {
+	.prescaler_enable = false,
+	.wdog_clock_rate = 1000,
 };
 
 static const struct imx_wdt_hw_feature imx93_wdt_hw = {
 	.prescaler_enable = true,
 	.wdog_clock_rate = 125,
+	.post_rcs_wait = true,
 };
 
 static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
-	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx7ulp_wdt_hw, },
+	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
 	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
 	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
 	{ /* sentinel */ }

-- 
2.34.1



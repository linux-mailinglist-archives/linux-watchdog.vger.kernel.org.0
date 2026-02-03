Return-Path: <linux-watchdog+bounces-4878-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MB26GxesgWn0IQMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4878-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 09:04:39 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A466D5F87
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Feb 2026 09:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62B8E3010B60
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Feb 2026 08:04:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A64B18C33;
	Tue,  3 Feb 2026 08:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sQKUP6oP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA48A1E868;
	Tue,  3 Feb 2026 08:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770105877; cv=fail; b=gdIMtiusdkOUq31mpRjfQJUbD41nqJwNW1RrMAnUJ0qlv6niBt/8EaGdn/W/5fFfZA8HO5Kdlzz/Oy8e9iqOBSFLxu1qZgsWo2IMlQrCVdEWKGchwgh5LwsCsX9EhadYYKsG8vhrz+gvQWb5JstUXT+r4qn3Yyp8202y8cP+jEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770105877; c=relaxed/simple;
	bh=Q9ARx0Pne750NtbD7vXW+GFj2WAM59F3cbK0OHNKxAQ=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=SolBbE2QGo+Z1drLSJhnZuR2XGK5zNApEXEXSuwTbtWF5dqe2+JckUMfyQ065FRfJJoYPH4+RWuqmAsz4hVXWPufjoXGUShHsDJMZJRyk/GqjvC0halVdy79N3RPC4CMFgRT1dj5W5LuqXro9ogg78dGgQHwz4rWD5Z2h2rxJ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sQKUP6oP; arc=fail smtp.client-ip=52.101.72.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7Qi+A3piVevhMVo3LVPUzdQFLy59se9w7CYcqAKfSIjKrO+okZyC1yLFfVeilyyjoefMsx7I9i5P5ooGXKI+eyoFhD1pjYM4hnFrMhMKW51l2o39SR9hukVvfzluBdBNZavgM3V3qvxFi+NUE4Oyi8+vjV/Rl/9nWvARaTHsEZCGsIdmQfW2+LnN0iylUH70FdWzEIoaq/xUXlX7+dJwa+nSEMPjorARoohW11nVEU03HySga8OnOPktJHdVyzwDalOkBe3LVJDJYEAt9BwRffHaZHbzdBTgVH8EqFMlUP64ziBlEzLiQiNSEifNPZEP18NnwXleVuTQChnJ0dUjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrDmHxFpnZ6lpqL06IVLziajvF61Ivoo0HG5VxIW3RE=;
 b=bcN5wz1sLDdOZ3wQkY96N9ognVmigETWNoYVdzNUW0i9xaZx+MyVRxXYIhdus588xNRuTWmax2lbarM+SIjOLaKC8bS49POxc+BBmWURYwOMGsXeKBk0SfwHbIyx/wDAv9nzBHvD/uhOUHJyD7FMQ0tMW8OpEafoxi0/ZCXte+qGjfNNSCfBmA+6TluJFwmB+Gw20KOZR0oJDHEJoFBBMrZnnIQaU1zbpROR6tf1k1brIekZCXJ2l/FfmsRODauCvmeWBoigIaVYjhikPlKilgi/Qb/ikYIfA8UnJDkr1NSgTNEled9VkXkqfM9nYxSpvPFGI/enPTc91+4kOzC5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IrDmHxFpnZ6lpqL06IVLziajvF61Ivoo0HG5VxIW3RE=;
 b=sQKUP6oPsBFst/2QkTbeCJTdvOr/coxY7/RjWfR4RkCMuL//dwQ89Uh32Dhifb0ze1wBx6YHB2+Yn1AeWFHcB1R0BBnQ9EaHrqG0KFkorKuVaQWRc7aBU8yNzxM2u8EK96U2zine1Naa4szPpVbEAYqHp9X3On5shUW7XSBb+YiokAvMGsISedoRl9ncUWv/8Z0O1bip9qRr+XabKndGtJgckXac2fQNg7L5/1SAmlZS0mjju06hTuOz7+CUS/uQlSuxARgu109D1LjSs8sN11nCH/2axtkuhE/Fit4fGdY8GxxNVvMXWe00Y+GldavZk7YCe6WNkChEKUaBGuUtMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11780.eurprd04.prod.outlook.com (2603:10a6:102:522::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Tue, 3 Feb
 2026 08:04:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Tue, 3 Feb 2026
 08:04:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 03 Feb 2026 16:05:47 +0800
Subject: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running until A55 enters
 WFI on i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
X-B4-Tracking: v=1; b=H4sIAFqsgWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwNj3czcCksT3fKU/HRdw1SDxERDkxQzM8MkJaCGgqLUtMwKsGHRsbW
 1AEtj19BcAAAA
X-Change-ID: 20260203-imx94-wdog-1e0aa14d661b
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2P153CA0009.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11780:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5c8bea-1e4f-4e32-535d-08de62fadc70
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2tkRHZ1MUNkajRSa3k0ZjV0ZnRiUUdiTms1c1gvYWJvQkY5NjVJYmFmajFy?=
 =?utf-8?B?SWNYV1Bkd05rUnVhOFRwdllUbkdiREE5NDd6NXd0aGRGOE1zSGlMMHVpOURi?=
 =?utf-8?B?U3hkWkU2K3pnWUVpVzJsSHpMdFZkVk5lbFhZZ2FjYTY5ZmpGRWUvOEplNmJP?=
 =?utf-8?B?MFBldlhxcXpqdnp1YkRLL3gzNjdqWStiaWV1cjZsd2hudllSTVFTeGlHZ3Vz?=
 =?utf-8?B?MVRPei9sV2tyN0F5NXdmWE9rcHNDMXdLSlUyZlNBLzFPK3doNkM0N2JaVlpu?=
 =?utf-8?B?dGVTMUZYdExnbS9hL1J1L0FVSjJvQThJOUREWXFCQkI3N1ZBMldEZXJuMXFh?=
 =?utf-8?B?UDF4NWd3dzFZWTNBb1NQeFB3QVlxWGpPS216THVMMVdRMElVQTQ3SXhjVzNX?=
 =?utf-8?B?Y3VIYnVNNjZPV2N4ak80T29qQm45NnBXWlBjWEhOTmR1b1pyM3N1Wkl4R01H?=
 =?utf-8?B?bStYLzlualNMU25MSVFRQnJSN2ljaERwNWt4ZXJQdEo0YThQeXo2WVROR1ps?=
 =?utf-8?B?QXV3L21MTzBlQ1VaS3VBWWZ5eG9za2ZTMGdDQXZtZTNpckFRS0RWVlJFVjR5?=
 =?utf-8?B?NXA4MXZWUy9Eb2dGQmxaQ0wzRnlmY2RnUVVTN3hJejNOV2dKUWVwM3dQa3BD?=
 =?utf-8?B?Y2U2bk5jWVdUb2RtUzVid3E4NEh1TGZ0OHRGRGF0RFc2Q05aaXBiaVBiMTVV?=
 =?utf-8?B?bEk1ODU0K1JQQ3VRK0hkc2xSUi9KRzdoZTB1UnN4ZUVzaCt0ZnMybTRhNU9C?=
 =?utf-8?B?VUd0ek9LYVRRenZqdkZhbG9IWWJyeTZTQ0kvNEtOSzFtRlY0SjVrZE1XZHlC?=
 =?utf-8?B?bFBBS1FxZW5yTUVMd0NoOHcrZmV5cGlMeU5tUEFBcTBGMEk1K1REV29aNzlt?=
 =?utf-8?B?STdVYll1UDFpZ29BV3c1YStia1I1NDZCVkw2NFh3OEZJWXIxL2FQQmdGR3h5?=
 =?utf-8?B?a0MweGVRVzVrcThYelBkVVNBUi90c0k5ajVyT28vaTJLWkc0dkNKMFFsUjNa?=
 =?utf-8?B?NFRwTmMrbGpaelZjOER6SnAvbUZVMEVqbllZU3U2bmJkZWgrREt5OWJSdTdN?=
 =?utf-8?B?UStBRUVGY1lwQzVuME4wRC9DWlJNNlcremt0ZTQ3WVM3SGhBeksvd3cvQjg2?=
 =?utf-8?B?NHhpaXlLYjlUU0N1RGNCdGc1RXV5ZnRKL1lHUXdTcmFTRGZadWlCZzJURjIy?=
 =?utf-8?B?S0ZlbnU4SW9XeDZ5R2FIRXVnMTdYU3Qra2Q5R2lOUEJYUVM5TFpmK0N1TEli?=
 =?utf-8?B?QTNvdVgyLzNUSDlVM3NVT2lHK2liTEx6OWZYcklVVi9VYy9rckR5UUd4WTkx?=
 =?utf-8?B?WVc2eE9qM29SSXd1cDYzaVl0ZGlMdzdoYXJYQ0Q0aWkzcmdNeEFaNEhrUnlH?=
 =?utf-8?B?di81OTl0aEptMnhwZzlNcGRYV1MzOXk4cGZweXdQV1EzbjZjdjgzZ3hMd1I1?=
 =?utf-8?B?ejhaZ25ndEF3Zmg0Zk9XVVh2djlzMS83V3NOOXhMbFk5blhvSmxkZzd5TU42?=
 =?utf-8?B?Y2hpUU8xYmozTzJReHRPYlFKK3QzK3kwc1Ewb2ViZTl5NXhXREl1KzlSZ0E4?=
 =?utf-8?B?VUQxNFl5MWM5bWtWUzVmOWRHcHFwNGp4aEwxTm9rVWlhSk9ET291YXZLdmJG?=
 =?utf-8?B?L3VHL0lvNmN1Q3VGSTVla1ZvYnBBeHg1NFZmVWU4NGpBbFQ2VDhTbWJxVlVO?=
 =?utf-8?B?YmVUbzg3ZmE4WXMyZFV2L3YxOURjelMxNGt1Slhub2lDN0RVR1hqK3lGRVE1?=
 =?utf-8?B?SHNHN2U2UU5ob1crQk1ibEt5RmFtMzBUTEFuZ0FPZEFBUzdmaU0yQS81ZktW?=
 =?utf-8?B?WDRna25WNjVGcm13NjJJY1A4UUIxTy8zc1pwV1lobGdRSjZicWlUcjRtTXlT?=
 =?utf-8?B?QkMxcjNXWFlHdjNtTThZOXNMUkZ4MWpDMTByeVFmaFVXMGFJWUR0QUVkb0VU?=
 =?utf-8?B?MlducmJaTkl6MlpRd3A3K2hnYkhHZktQRHBxYmhjaHZUY3RLUmlPODBCdnBm?=
 =?utf-8?B?S0xGUmJGVDNodmk2Vmd0OVNUUXBXUGJEakVCZTB3RlViK2NvSzlpMkFoTkh6?=
 =?utf-8?B?UC91ei9GVzRvZVBYVWk5aVVkNmhCaEhxcENDMklkclJqQmlTUW44My9yVG9o?=
 =?utf-8?B?d1NaUTQyODJYZGlBREZtQnlXMWN5NHNFN1NxV1pwRVhUUjVCeStNaE4rSkdQ?=
 =?utf-8?Q?3xcU3mYBKeucmKRsudS1eZ0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akh5MmN1ZzQ3L1VsV3pqSk1VYUp1OWtmbDNVUW9FQ3hEd0RCT2pBK0MrODJx?=
 =?utf-8?B?TlE0QTZyRnpkdVlGejlVYm1Sb2dlVms5c0tQeS9Pa1IzaytBM1lBb0VCNnBI?=
 =?utf-8?B?TGJnUTc3dUw4eEIrdTkvNnJxakZhUzh4RUphUThGUXozRU9UV1ZTMGlHUW1a?=
 =?utf-8?B?SUduZTFEc1prUzhONjZJNmpWdW5qQTNodk1scUZmVHJab05tZVZ2UG5VT1FM?=
 =?utf-8?B?N2FYTU1VN2JIS3FNYzZPbmZIdGNqV3daYUk3bzBJeGdVbjR1TlRQSlkxNnJ2?=
 =?utf-8?B?SVNicEV3czl3d2QvbXk1SS83NEVvTms4czRxRVEzdWpyR0tNaWcyRGE0bGZC?=
 =?utf-8?B?UHBJUjJBVFVFN2Z2cHZlN0w1WGpxMDlUNk1mTThYQnRWbmlrV1RxaUJMSVFM?=
 =?utf-8?B?UFJlcWplWC9vQVh2eFU3WmJmK3llS2tDa1VMWk9idVJPa0tmaHJJRGxrTFQv?=
 =?utf-8?B?aGxJNDg1amdVVC9SaXRmZ3ZGVTRxSDRLdktqYjk3Q1lPSXRvVHZ2aGJmazQ2?=
 =?utf-8?B?a0N2R3dRekJZY1VnUFBVQldhRVliTUZjelp1U0dYWUhScTQwWTZRVXYwY3VL?=
 =?utf-8?B?TWtTS1pFZ1pWeW5NZEdyUWhVVHkvbWV3UWxleG1waHhvT0U3TzBmYkYyR1Vy?=
 =?utf-8?B?WGFYem5lSjN3QUs5L3h3TTNKVlU4V3JhNXRqazVFVGxkL0gxa2JqVUo1RkJQ?=
 =?utf-8?B?RUZMeWtWY0dEQWJWUC9zTDBrMUZuMEk3cmlmMm9aZnJrbFBnK3RMWHMweUty?=
 =?utf-8?B?TDdkb0RvRnl5QXlEVjBONXRZdGRGQ09kUzJhZ0xoTktnOTZlWVZrK3BURzdR?=
 =?utf-8?B?TTM2L3R2a21YeG56bSsvZEtpelFXVGNrb2wyTmNBbHFJOWVvTyt4cEI1Vk1M?=
 =?utf-8?B?blUrVG43aGtVS29TODlaSnR6QmdXZncvSkVvSFdidnR0RDFpNDF3cmhoTDFE?=
 =?utf-8?B?UXF3RW9ySUVJSGJxWURyRHpEZHc1eDBjYm90SURsRWM0QVgyakZmYk5vRVN6?=
 =?utf-8?B?bFFGZkUvZHh2YlY3VzNqaFBWdURnY1R5YjZKY0ZOTHdrVlNyZ3Ezbk9jek5n?=
 =?utf-8?B?NDlwVVNUNlV4enlUZUtDV3ZSbXVHSmZGTmVUdUxVVmJHbkpNSElQVE1DUWx2?=
 =?utf-8?B?ckxmc2M3MmNxUnJKOS90OUhsMmhBejNKMmpjVnZWZ0NZQmxRNG4weHNwcEQ3?=
 =?utf-8?B?NkpTcFpqaDdzQ2w0aTJTbXRZeFlwbUF5ODR6bUZVcWpSQ2VrVGJIMDY5Sk9t?=
 =?utf-8?B?cUozNGwwb2VoN0RvMllaVTRRQXlNOU9HNXRvRDBuajVtcGZWR0ZKTnQzUjU0?=
 =?utf-8?B?UGR0VWVJdTRRSjBqV0RhTDRZYWZjWXFWZVhITWRmL1RaNUJ5dG1tQ3Jub1pS?=
 =?utf-8?B?SmhRSndZTGltcXMxYlNGYUIvSHc1bWZvWjRsczdyM04yd1VxYmg5UW81OHF0?=
 =?utf-8?B?elM2S1RWK0d6d2E3YXJQQ3hraHh0YVdjQ25LV01EdGRqRFF3aTd0c2xiRi9j?=
 =?utf-8?B?MVRlVjU1QkxkcVkzNmJqWnlUWFRyTFhMbTU5QURxVGxRdHJ2aU1QeXJnM094?=
 =?utf-8?B?SWtHNHBUMTRqVVorWE5kWTl6WDZTQVg3aXJFVEZEOUdxbURBYUVCaXQ5SW9I?=
 =?utf-8?B?T3A0YUUrY3pnS2RBUG80dVpZbzdPaVM3Z1d2SFdXSUdYaWppcnh5SnZ3MkdL?=
 =?utf-8?B?aHJqZWFTZUtiK25DZWNlTGZ5Ym9zcTF4bGRCbmZTM1VPQmk1dWJGOUR2emVD?=
 =?utf-8?B?NitKajIrbmc4YVlhcjNhMHBGc0dsVnFQc0VyTGhxTkFDTVBxb0NKcFo3UTRr?=
 =?utf-8?B?dTNVbDh5aE9lWUZIaUNiV21RWjNKYVZmNkVzK1pkaE9paHJzK2Z5OTkxdUVm?=
 =?utf-8?B?QnlkOUhIbzN2L3FWZHF3eVFHcmk4OVdFdk4zOEZOaW9rLzFicWh5Ym1zQXJM?=
 =?utf-8?B?Kzd4Sm44WDhZdUhCUUZLSVpnaVltMFphOGN4Q3l3K01sc1VKSTdXdG5zNHFx?=
 =?utf-8?B?RmgvbUFzcU5XRXFQK3R3aXU0UXhJbEpnUmFIMms1a2RZZHZqMUVpaCtNVnBa?=
 =?utf-8?B?T2JvWVFwYkhyN24vNlI5dDhZYkFGdVMrbkljQWxlVzZvOUEvaWljN2FWWjNl?=
 =?utf-8?B?V3FzQmRJSzg5TTdJOHptS1hjWUdKenZ4UFEvdDJYZ3JjNU1WRG55VlFnVXIv?=
 =?utf-8?B?VlZ6dXNRQjUzSzJLUUM3bVlVbWRtOElobTBUZGJWZXpBTGdZRURVdUtpa0NJ?=
 =?utf-8?B?cXdYQnloWC9VZG80T1NGQ1ZLUlVtdGpMZ1Q4bWwzck9ncHViOUIvcUVMN1dI?=
 =?utf-8?B?R1Q5YllHUFRJU1FXRlVROFdEMUNrUjdFdytGVGFNYmNHd3VqQlVqUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5c8bea-1e4f-4e32-535d-08de62fadc70
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 08:04:31.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8XKjdjeZUCcFwC+mtwYgTEx9YLZT2I0MJh5KyJg5lvas5iNIdW9xOMhSqnuayvKkGmhxUX0+3y0EnZUGgSHR2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11780
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4878-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux-watchdog.org,roeck-us.net,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 1A466D5F87
X-Rspamd-Action: no action

From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>

On i.MX94, watchdog sources clock from bus clock that will be always on
during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
between the bus clock and watchdog, but the LPCG is not exported for
software to control, it is hardware automatically controlled. When
Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
gate off the clock stop watchdog.

So watchdog could always be alive to protect Linux, until WFI is executed.

Introduce a new hardware feature flag to indicate CPU low-power-mode
auto clock gating support, and use it to avoid stopping the watchdog
during suspend when LPCG can safely keep it running.

Add i.MX94-specific watchdog hardware data and DT compatible entry to
enable this behavior.

Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
[peng.fan@nxp.com: rewrite commit log for clarity]
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e89854f14edca0fd5fa84591c2d2 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
 struct imx_wdt_hw_feature {
 	bool prescaler_enable;
 	bool post_rcs_wait;
+	bool cpu_lpm_auto_cg;
 	u32 wdog_clock_rate;
 };
 
@@ -360,7 +361,8 @@ static int __maybe_unused imx7ulp_wdt_suspend_noirq(struct device *dev)
 {
 	struct imx7ulp_wdt_device *imx7ulp_wdt = dev_get_drvdata(dev);
 
-	if (watchdog_active(&imx7ulp_wdt->wdd))
+
+	if (watchdog_active(&imx7ulp_wdt->wdd) && !imx7ulp_wdt->hw->cpu_lpm_auto_cg)
 		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
 
 	clk_disable_unprepare(imx7ulp_wdt->clk);
@@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature imx93_wdt_hw = {
 	.wdog_clock_rate = 125,
 };
 
+static const struct imx_wdt_hw_feature imx94_wdt_hw = {
+	.prescaler_enable = true,
+	.wdog_clock_rate = 125,
+	.cpu_lpm_auto_cg = true,
+};
+
 static const struct of_device_id imx7ulp_wdt_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-wdt", .data = &imx7ulp_wdt_hw, },
 	{ .compatible = "fsl,imx8ulp-wdt", .data = &imx8ulp_wdt_hw, },
 	{ .compatible = "fsl,imx93-wdt", .data = &imx93_wdt_hw, },
+	{ .compatible = "fsl,imx94-wdt", .data = &imx94_wdt_hw, },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);

---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260203-imx94-wdog-1e0aa14d661b

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>



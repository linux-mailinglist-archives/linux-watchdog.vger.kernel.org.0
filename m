Return-Path: <linux-watchdog+bounces-1358-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A991E92F228
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 00:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAAD11C220DF
	for <lists+linux-watchdog@lfdr.de>; Thu, 11 Jul 2024 22:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD7F415098E;
	Thu, 11 Jul 2024 22:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="d1KhXhOo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013045.outbound.protection.outlook.com [52.101.67.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CA16D4E8;
	Thu, 11 Jul 2024 22:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720737676; cv=fail; b=KLDQKbgON2GLUTUqJgERnWFSMHbq0dky36Eo9UIZmeUeRG+mxRjjLp0XA0ZkVY9Ok04CuDx0cbs3AU1kGnh/JqAH2OIfEo18IMrdjUEu91GwE+MnCuMYyq0DOsdzZ6nP3vwkuKzFGKIjz3YRROkSewUo/Hbf1F0r5Nez+MPnKH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720737676; c=relaxed/simple;
	bh=eMxiJYRzG2oeYy9cgIhgrN7YYTlnJLoU2yZ2scK5KuQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=PPVkZ/b/214jD/RiYhhfmDMXJjt3ku+tedjCfAl2FxKR9CwOrzde1uq3NJPgmC6dR1eUfS9obxsYlcV/9QnTPbPeNf4RslxmKjAobhkRLGrOgQV0ItRVObrndVhoJBvr5y7HV7HDWUs3e2s2Emt3XcYKOYu5V9v3gq2jxOPNFEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=d1KhXhOo; arc=fail smtp.client-ip=52.101.67.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elnkVKEi2jDbL9y09moV1CKDymc0hUwgvxws93JqAgb53JVdeLlv8AExURzlJqRGg6WUIsKGBC3dJn+LWMSFthFPLptHuM1jk2k3vYBIl0LnCyqWZLDfTYDfwpp4zPXIAfldSdwdXBiEzRI9wdh14zoMlEW9NHWG14fahERa8vC4Jf+8Y1Gqj+T63GhDOdV7ezoKqI+xxlzghYr22ssrv3uQtCvlSH/4hQhARbCvXYGPnnf0JkyOVQTwIh+tIgvGv5EaEnbHh6HP1DQh0x08a6rcJh1e9sGXJiP06G/+dY1z5U16gDePG2lujXCyh4eOHbBc6GKJ+wDcOEFYaorxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EyW7R+NLChVjWfDOtE/FeyC1Gcydb0gO8LOLQaOwlk=;
 b=YktL5d9C2NJ0pOAVzPEM0Fw4kJiXdRpYzO3SDuMUDoMGL5gpYSWM5OG/sSi/Vj7dam1aX8oU1Z6bNGEwTe0L79Xpz/k0dyEdc9weqQhj6bZpfRwh5Rwvz7+EaLVnaKZKqANepdSdZbBrj96pB2J1aC4VPa19UxAaZZ8r1sP/A6XHDf8b80Qh+NqRiEesWnhdagvtrFl0W9p9V/+JVseeecKnINpW6wzLQuIUPlR6MZ61OWG8BFwWhLPzXEVIl/FKJ6EG58kqDlnxw02wesbg/EvnJs3UK1Ve38fC8FnT9Py1oheknsSx4cmHhm2xygD/rkyAeZyVMPg8bczZ0ZSt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9EyW7R+NLChVjWfDOtE/FeyC1Gcydb0gO8LOLQaOwlk=;
 b=d1KhXhOolTyPDd//vYzUDLK5+e641QM4H9PNZQMMmcDl+Lcqkq3db3SW2PZ6e4KRnyu8j+qY5VLM1Pfknturjwmf2bMO1IwwUQqpLBBF6TAngedGtFn/56Pw4H6PQwl5kiSCnwcYgPSsoMrU7ivlSH15M/Bp9M+JkzOqAzBicdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9519.eurprd04.prod.outlook.com (2603:10a6:102:22e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.22; Thu, 11 Jul
 2024 22:41:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 22:41:11 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/2] watchdog: imx7ulp_wdt: needn't wait 2.5 clocks after
 RCS is done for iMX93
Date: Thu, 11 Jul 2024 18:40:58 -0400
Message-Id: <20240711-wdt-v1-0-8955a9e05ba0@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHpfkGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDc0ND3fKUEl1TM4MkizTDlDQjI0MloMqCotS0zAqwKdGxtbUAOawTkVU
 AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720737667; l=1046;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eMxiJYRzG2oeYy9cgIhgrN7YYTlnJLoU2yZ2scK5KuQ=;
 b=j0yB0/G/AYxUtvCPB9MbvWc6qtsC/rHr99rBYUxgOF0TDKgnGPjbAsw7/5kGGYo1ocjA0AHuJ
 8coj4hRKyAKAvrT5KG/WAUzzDEGt/OUruejRxMp3Fml7h7+CmDTBq96
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
X-MS-Office365-Filtering-Correlation-Id: c0d54385-66fc-483a-e9d6-08dca1fa9013
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZElNbUt5Z2YwTlp6cFlYMFE5YlU2cXJvclMwWnVsV2xCekNpKzh4ODI4QlYv?=
 =?utf-8?B?eWllSU00K2hvZ201OC9IRmdHV3NTVFZuMDRyenFhdnhzSDl3MzNMRTVjZ29v?=
 =?utf-8?B?NkhKeE5nTUFDRm9uSUh1ajV0K3JacDk1MkRERzZ2NUxLRlZVa3JBbng2R3NX?=
 =?utf-8?B?eHd1YzhBOU1TdmNSRlJ4ZndBdFgrYnRXbkxNa0RyMm5IOS9zcHQ1Tmh6bFht?=
 =?utf-8?B?eENCb2hjdFhEVVIzUzd4VlZveUtSQWJTTnZocGdNbWYwTmNrME0vSUlDZHdD?=
 =?utf-8?B?SVZkWSsrTjZ2cjBuWlhGNU5WVFo5ZVphNU0wanpxcm5EQi9HUjEvY1NxT2Zo?=
 =?utf-8?B?Mlplcm1oaUJpRjR5TTlOaU9Xc0xUVjFjcUx3cVIzVll2Q3htSkN0WjcvKytI?=
 =?utf-8?B?K2k5bUtPT1lPbVhueFNXazM1K3FRRW44a1hqQnVCR1pIT2pDNWsrWlFvaGlO?=
 =?utf-8?B?ZC82dmVmSmRhYUdYb3lrUndLYzhaamNWWUVCbFpTNU0ra2Y4NjFzQzdYUC9v?=
 =?utf-8?B?MlFmVHJ5ajJURXlVNmhQenYvR2JJZ0ViT3lpc2RhOVVmR3NEbHA1dXZyNkVT?=
 =?utf-8?B?MmRCKzd1R2tDY0dpTUsyTTltTW9NMXdvS2dUQXpxdGV1VG5URTVYME1rYWxD?=
 =?utf-8?B?emRMN0kzMTBVdG14Q0hHSnc4Ui9WV3M3ekdvbkRqNWk3bHR4cHNoandrNlFh?=
 =?utf-8?B?by9NdHNlNlBYNFQ5ZGlXMVd6aGpBQzVkaEpLZjE5dkF1ZkdaVUIyWkI5MVJD?=
 =?utf-8?B?dzBzY01lVGZpS2pIM3hnVnRmd2VSM2FJODkwaTVvWlBvVHZkVVdiVUxFNEU1?=
 =?utf-8?B?aVdFQzZTY2NtaWhUTG1iQzhiOVVJUTk0dFZwL3ZERXpSTFFjMExyUzhSYStZ?=
 =?utf-8?B?WG5XUmZUYWpid1FaSTRjb2w3OHFwRW9NN2FrcXBUV2hlc3daL2FBeVFMS2x5?=
 =?utf-8?B?S1U4eDR5N3hIazUrRzYvMmlTdUlOTmhSa01MV0gyZ082WlFycit0SkJJcXRN?=
 =?utf-8?B?cFJheWNwYW8vMDF5bUhHL2RjWStLM2V6M0VIdUxPNDNkTzlpcklLV3JqS2VP?=
 =?utf-8?B?cVAvUlFpVG4rZCtTaXQrczlsNnFWWGtqRENXYkcyL0x0R0VzUlRveXVucWVM?=
 =?utf-8?B?TUYrRW9xM0lXNmJVZTVqSGgzY0xMeE96anVUTVhvTkNKRXo2VmxjazdaT2hh?=
 =?utf-8?B?UXFWbUV1ZkVkQllTWk5VMDRuT3UzaFNCOVk1K29aMXc2OFhzZHNyKzI1SGNu?=
 =?utf-8?B?RjBDUlY0cExYamRvcGwvU3BRV1NOR1dlZmhibC94Z0RydXZrVlRTWG5lWVk4?=
 =?utf-8?B?emRtdTdPenRhVjJubTVkZ3lTYUNQZHp1cVlTQXZZQnlqc0tYRlkyMVFkcmlk?=
 =?utf-8?B?b2FRTStjbGE1Qi9ZR3lJY2d1NkRWYUlBN1lyYkVITmdWcWhwS2lEbGVhU2FT?=
 =?utf-8?B?VnRrUi83L1NtQi8yY2hTTXFaR2lGQ3BYZGc0eEZ5OUpOUklrMEhHbWZMZVEw?=
 =?utf-8?B?MVdHd1VoRFEzK1VTaHJrZ0NQWitnWVAyNjlwN2VxNjJpTGZLL05qa2FzMlhw?=
 =?utf-8?B?NkxwL2ZTY05sNEdldFNCZG9LUklzWkp5R0VETUNtR1ZEaXJJRERrdkRIS3l6?=
 =?utf-8?B?TmQ5Z1NWTGFvZkdOdnJPcHRSei9UZE8xN0xleVhseWw5NWtkNDN2c2JxNnJY?=
 =?utf-8?B?MlhkRGNyek9lakRzZUJGSWY3NGxmaHQ0VWZIOFhRNHpybXpIamdIUE8xVjVj?=
 =?utf-8?B?VURhUExzT1FjUnlnRXpJVUp3STE0SnBWVzJleGIzNjBndTVuTjBIbWRMY0FJ?=
 =?utf-8?B?S3ZGOGVlazd2eUc5MXRDOHdRaUp5NVMxVFZ5aE9rSytES1AwNFd3c1JIL2N4?=
 =?utf-8?B?OStxNEdGbjUyM1NRYTVkODdrRDlSNUxTb1RCaFdqYVUreUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3pwVEw4K3hxODFIRmU4UjVNUEh4MVNsTk40M2F1SW9BMGJkK0o5eXFRa0Jl?=
 =?utf-8?B?QnRyUERVVjlZclU0TzVXU2Q1L3lIaFlZZDRmcDdFN09vdExxMWo3c1g2T2RQ?=
 =?utf-8?B?aU1oay80N0dkRzk3MUx5bTM4a0l5b3p5bXVIdGxRYmMxYzM2RGZ3WXdjT3Jn?=
 =?utf-8?B?S3E3WXhaUEJLb2plZGN6WncxRElpVnNDakpKR2R6OEhIbDlvQWYxRlBuc0Z6?=
 =?utf-8?B?RjdLUkduN1BpY0N1SHVrYmREa0lSS3U0S2wxZ3ZPRFNkMlZaWll0SnRnQUg2?=
 =?utf-8?B?c1ZRdjM0WWw2VnpWdGo5R2E2aHFHT0xRL1hzVUh5WGxGK2wyNUQ0dWtJbHlj?=
 =?utf-8?B?S014WFBBS20yZW1Ea0pnQi9oR3pmeUF6aDM0L0JiUlpzN2RFeDNOMjYzc1pv?=
 =?utf-8?B?YTZxZ0kwTzlFLzd3TDFSRkxpMDVBQ2RBcThWazBncmdTVHE0Qi9vMEpobFZ3?=
 =?utf-8?B?WXBXOXEzVmplNStoUXVWRm40UW1YRWNGT0poL3pyQVJqSlNWSzRwRzB2ZVlu?=
 =?utf-8?B?c3FlbEh2MEozMVFJbHliWFF4dCtvWnJhNHFaVjYxc2kxSzRSb1pZMkt3RTAx?=
 =?utf-8?B?dm9FdStabDV1MWhPLzBPTmpDNTJDZ2FsSmh6Rm9NOEtyQnBZN2R3SWJkcytG?=
 =?utf-8?B?MXBjSUpVQVpFYWJqRHJ5V05JUkkxQzNicWpUU3hZOVFlanBxVGd5VXNIcjFV?=
 =?utf-8?B?VVRjSUtLRzBHbVJ5VWFTbzdyWERwS3U4c05nQ3lxYzA0RXliWVRoU3JJdWtv?=
 =?utf-8?B?NEtWNE1iMXlhVktvQkxXcUxlR3JKQlhVQVo2UGpZU3JZbHFnbm1XWmo4TURr?=
 =?utf-8?B?djJpWlQyL0cyTk4xYUprSkRRMEhkOUdBVmFETVJnUktaUmVSZTE5dUNmMkRP?=
 =?utf-8?B?bXllcEJQOTFjS3NFNlllU2liWHFXV01JQjVBcGFvbHZJY3lEcFRzb2FWRFV5?=
 =?utf-8?B?UktMRzB4ZlJrUHhDYm5vMzJCZWZHMTFWV0d1RUh5eXJ4M2FGL3Yvazl2cmVh?=
 =?utf-8?B?WFRCU2VLYm1xcEFSWVZxbDM2M2wzQkhTOFJPeW9KV3A5RmdZNENKZEVqVWpP?=
 =?utf-8?B?YXhMMXlXYlhWT1h1aWkwc1FBaTRFbTYzbEhqbk9PRkxJajRqV1hGNVNmOGQ1?=
 =?utf-8?B?bXRYVVdNYWtwOFQxNm53b3NkYUpxalBWSGJQZWFXVDFhTGI5Q1BValBvaHV2?=
 =?utf-8?B?ZHhwQlNRdXVyVFExTkZHNXB1aUdNSGlXbHpaZTcwaHFIVktydm0xUGhWWXRm?=
 =?utf-8?B?aEJTVDlld3NrUzJpbzV0dHpiM2x6bG5wUmhpdUlHMVhVL3cyNFQ5a0hTWm14?=
 =?utf-8?B?akZiY3Y2S3IvTVBvYUhwYzU1QnZWOXBrblkvS3hRU0NXaFZGRm42UUQyRkZW?=
 =?utf-8?B?dnJmeWt5aHFKcHNMUjdSa0FiT1RTck1nQ0ZHLzAxaFdkbE5hSlZCeU9OdDE2?=
 =?utf-8?B?aks4aEdXaDFmcjQrUXpMOFg1VnhNdnBKRmo2RjZ4V0JMQmRQMzJkYWVDcmY4?=
 =?utf-8?B?Q0Q1bFFYZmJQUlN6eUhOSWNIcmdiNThlWmJnQ2UwZUFKU1l0a0grN1M4ZlJn?=
 =?utf-8?B?YUp1T1ZJOVlBMWRCaW1OazViSGxuc2Q4eGdFN2hRMERER1FzZDhtdG5HNHAv?=
 =?utf-8?B?YnVvT3lOMVlFMGYwbEExTlhEVTI4c2RnVHE2cmpuc080M2RGVUhvaGpaYmc4?=
 =?utf-8?B?VjcyZlVQNUF5SlNTby9ia2FnV0NtN2hsY3llRDhyck90REovYXRGaE1OMWZi?=
 =?utf-8?B?R1k4TWJVNHZrRTFoQTAyZWs2TFpFTEtKUTluYkhaK3dxK0h5czlKU0NWMHRH?=
 =?utf-8?B?QjZxMUkvUGQybHVXTHFuajgrN29keU1ualpOU3ExdU9GNUprN2xUR3pVZFNF?=
 =?utf-8?B?TnN2L3hMRmcxYUZsQlNiN3ZrZEpBZUY2QTJxS0RiVHhUOUg4emlUSWpuOGU2?=
 =?utf-8?B?UXFKZ29JdkpIM1F5UEJwcDdQd1l6RitXUFVudDJsVURQNFZodU1OSzFKTlRC?=
 =?utf-8?B?VmtoZjVLMXBLbmJ5aTFwbjFPRnhxeEdYbGtKY0hwdzZPMFdHRlBvaVRIYkdy?=
 =?utf-8?B?a3p5K3U3c25TOEtNTHRxemUvSTl3a3g5SFNQVjQwUysyMGNScE4zQW03SHpM?=
 =?utf-8?Q?BGvo3fscfocvZjrcNTDGmIdzm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d54385-66fc-483a-e9d6-08dca1fa9013
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 22:41:11.1925
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vajexgqiy3u8K6u4gFlwCwrCYNjbgU1hc2PB7pGfovBeXMP7ZSe4ZTOds68QpAb+4Uwh2avYgg/K1NYlr6NQaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9519

First patch for code re-organize.
Second patch remove wait for 2.5 clocks.

To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-watchdog@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Ye Li <ye.li@nxp.com>
Cc: Alice Guo <alice.guo@nxp.com>

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Alice Guo (1):
      watchdog: imx7ulp_wdt: needn't wait 2.5 clocks after RCS is done for iMX93

Frank Li (1):
      watchdog: imx7ulp_wdt: move post_rcs_wait into struct imx_wdt_hw_feature

 drivers/watchdog/imx7ulp_wdt.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)
---
base-commit: f477dd6eede3ecedc8963478571d99ec3bf3f762
change-id: 20240711-wdt-560b8f1df221

Best regards,
---
Frank Li <Frank.Li@nxp.com>



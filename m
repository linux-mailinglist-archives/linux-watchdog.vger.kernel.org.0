Return-Path: <linux-watchdog+bounces-4908-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHmzDkY0hWlf+AMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4908-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Fri, 06 Feb 2026 01:22:30 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A57F8964
	for <lists+linux-watchdog@lfdr.de>; Fri, 06 Feb 2026 01:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87E9D3014C0F
	for <lists+linux-watchdog@lfdr.de>; Fri,  6 Feb 2026 00:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A6C21DE8BB;
	Fri,  6 Feb 2026 00:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xNIBCSQ2"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C727E1E3DE5;
	Fri,  6 Feb 2026 00:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337334; cv=fail; b=JdbCer1NvtOBrRK4YhKeve0uFytROKVZM6m4yyybYRTcrl1bngJD0GCXDeNOfzDHF+fCigVPiqXPhko+XnKNYHRfR7Mpp9T7bztbpeyjtvYXcZIPDzuGiGBGoAkYyfMzpUkbFEXS+juusNRt5kReX9syFJHpoO0AIGwWbbU6ius=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337334; c=relaxed/simple;
	bh=ow+qRekAT3R1LNViyXSZ5fsjwiRHIHZZGd1jO3MEmQ4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=mnH9HK0Ezxh5d4+U1FKasXJTTUwLTyxbTY0JZLVWm8mfUczTf7SJLQm+JPLSpKzXQwRFVS9BZ3oS7JEFepEs+seEI37/XHO4bEspva8fRtYFVAh33AFgaFbNzYILf5GIZrPQfEEoevMgXVipUpGklkM1rVoS2DpmTJ+Ibl1IIdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xNIBCSQ2; arc=fail smtp.client-ip=52.101.72.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aE/mimigpxl8g020J2lmHQWZ9gEDeACzp6IdkA4rBqAWmMEx+egRUz7aGUcqUb8O75eKtB7idEUDvZn1Pt2SzF+OnwGCL1zS5HLxiJOqjoXXsZb1J7H6Y7U5+RUPu1Vd+Yo/CifShpZ4XPEV06pY9izkcazhM8dGGM51StMciRZDo6NfS6Nrqem+UWSz90dpkPqm45ucvrSjpo0+zW0KoVE1n/L/PTJEn1PZemY9ebgjF56m3IHYP0WQEYehGjTgcFEV0GBOhI/9YFxRkRZYhIUyuhVzo0ugbiCUDeKiaKARBM4DywDHLxsag/g/8N+aeFNVJwGwLm2GjUBFnsFvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBLJaQUyPth3SVJlMxxfMY/qem6n9R+0cRvijdwAQmw=;
 b=jPDzDpJSO7IXlioUnczzBKokMLQWxyd/sXa3cnNj3sUlNPazBGPsxFpu7wc2kJWzxZMpvyRhri/q4X3FzB8RwMXDvLJvWUNCqpsh24+9kAo+Rhurcid0twWmotOD/Qj7qPawCkOcG9IfhGzTMS09S8H3ii3XOlx9N8ScJVHC5GpPGjNM12PP22xcF+N2fKESxeglVaLoXpAslyYJ7hupmvgY5uiES0XndBkIVU1lCdhfmgtGhYModenpaTfmbfwZhSsM0zzYZGN+030xZn8MtX9s6SGYDW38aax+etLDFU8axQEVWjH3/+tjTQka3i2zUw66X19E1gV9Oun2KeOt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BBLJaQUyPth3SVJlMxxfMY/qem6n9R+0cRvijdwAQmw=;
 b=xNIBCSQ28UWchkaJ6qY6AAsdBGzO2590tfBkwK5TyTTeEGidqTxOjhBmwZPGRCq39dblkpvjFvbvc06v4/B4AVoGUMo4sy+CiQ1tuvI8HuHynk7tfxq8v309gNzdQrrFQi6edJ2175GVixdj2k4ExSO+HMk5NRfwxHg6c7FnPuwJF5Xh89V887fMUbo5z4hb1BuBYc5VWu4shgZd0BOoaYXQBJtD/7tDyL8iItPiDlp96Htxs3YxIeoQNWCntR8woXT4NwZ7UA2HAE3puFFREY51ywTBt08lyq9aSwP/7f3KelVw4nKFfLwcjYZIBESb1RYqBw5TfPwFezCbKYiUnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9852.eurprd04.prod.outlook.com (2603:10a6:150:117::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 00:22:08 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 00:22:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 06 Feb 2026 08:23:32 +0800
Subject: [PATCH v2] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-imx94-wdog-v2-1-4dd725faec1f@nxp.com>
X-B4-Tracking: v=1; b=H4sIAIM0hWkC/23MQQ7CIBCF4as0sxbD0EqjK+9huihlbGdRaMAgp
 uHuYtcu/5e8b4dIgSnCrdkhUOLI3tVQpwamZXQzCba1QUmlpZKt4DVfO/G2fhZIchyxs1qjgXr
 YAj05H9hjqL1wfPnwOeyEv/Uvk1Cg6C2ZXltD7UXeXd7Ok19hKKV8AfNIX/2iAAAA
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
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9852:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e6370b7-3d27-4c64-9d36-08de6515c34f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cFpTRytIY1c5eXNMT01MSWJBN0ZPSWV4S0xpRjlPVzIvSloyd2tiVG1haGVl?=
 =?utf-8?B?Yk1lNTYwVUJSTml6T3Q3cXJZUFFCdjhTYk04K3hKbmk2d2RDZVplSnlPRWNh?=
 =?utf-8?B?RjhPNHdBVFJDeW9ZUzIwZ1NYV0pJTnZ6T1ZHWGtKcFB6RVJmZ3R4Z3Qra05L?=
 =?utf-8?B?QzEvejFubDZlVVExUVJ1S284WnU0aldjL3ZDN0M4eW1BU296czFDYjM1QVYy?=
 =?utf-8?B?ZDhsb1QwRk5jRTZNL3BaWVZqYXlsNGpEekFHb0JwcmlUb2d4SnZQQ0lOZ1Ez?=
 =?utf-8?B?WThhZU9Xck92Nm05NVErOURHQ0h4VXRNTmxhK3pNRmhlU2tpTC9tem84MzNO?=
 =?utf-8?B?bThRdFU5WXJ4aXJhT0lNVU9RR2c2UHR0bVRKSkttb0pYemRnZ3NvajJtU3lp?=
 =?utf-8?B?VzRrSWNRU0hBZ2VPSTQ4VjVNdnk2aHVsaUF3RXZYV2lENWRreDAzTHM1Y2Fx?=
 =?utf-8?B?NG1wQ0dkRVJxZmlHNTVYbGl2MnRlYWpWT2doSlZMdjRlL21YNk1sVjEyQi9n?=
 =?utf-8?B?SjBjZDdUdlo5OFRlcm5XeWFHNGpxcGxDQTdIejBUSlJPZ3c0ZHNZQmViTUdq?=
 =?utf-8?B?ZDhmOEJRS3M5eERmUTYzZzcvS3RTcnFmTWlHZFlOY21nL1JTcldyS2Y0ZWQv?=
 =?utf-8?B?QjUxbEZ5T3F1WjBKcTBxMk5hWlVaOTZUNFJUa01GQmZ0RDFVeHNXdHhmNTdx?=
 =?utf-8?B?VWhkYkM4cTdpQlRRY0ZlRVRUd2lCYzN1WXdmUDlzV3J2TVBCQ1hnWmd5U1A2?=
 =?utf-8?B?VGxpSTg2MWJLMDA0UlBBbWpMcnUxZ3k5RnpzRjVSY09MTmY4ZEdVVkw4QzN1?=
 =?utf-8?B?aGhzOTRvSVdoN20rY21ER25xT1lWY0lwaFRpQmd0REZ1TXptSlltVzd1UnBM?=
 =?utf-8?B?c3VEZzFvTkE0SjE1VG15Q3JyY1FmZTVNMEg4TCswN09lNndsa0VjQTZxZVNZ?=
 =?utf-8?B?YTdHSjZpNUE4dEFwMVRVSWhjZUR3NXFZVUc2Z1Q2N2FBeDZscHh1WTlub3BM?=
 =?utf-8?B?eElpUE8xOVVYMGd2SjVTSjlBWkI2SGRKblI5YytIZmZWWDRkL3JhUlFKRXdO?=
 =?utf-8?B?SERXWGJtZmFyVDB5OUdXUHhteFIzZXdpYkw0V1V0TEtNM2V2dHBvWkdSQUVR?=
 =?utf-8?B?S3NZblExVjA1cGlXWDcrb3hHeDFwU0JzU2g3ZTQrUkw0eVBSOG1oZzExZzZQ?=
 =?utf-8?B?cXNwb3pRUDc2QWMzdEpKb1dPYkFFSmJweUJFa2JIcXZaUmJGZ0UwcG5tMWow?=
 =?utf-8?B?SEFmazhXVlBIYnBkdjJTcG9RZXhmMXlBcTNBR3hvTk10K3ZwL21idHZqeUlP?=
 =?utf-8?B?dkZkSmU1ZEJLUklBRUY5YVNxV1JRUEdIM1UrYktQYzVLUDZucnNjY1BCZ2Vo?=
 =?utf-8?B?U3B5TmJkMUdKVm5BVDZaSUl3Uk1ZNG84S1IzOE9GekpNcG41U0phR1F0SGtY?=
 =?utf-8?B?YkcxNnl0T05abXZrcEcrb0F3U3lsQmRrWUpla0ZmMkgvTk9TNEdVOE55Zlph?=
 =?utf-8?B?SlU5S2ZjUU1kSUN2a2NZNU43Nm13dlJpbXVBMmxUSHdEMXIyd3ljS1oxR05l?=
 =?utf-8?B?aUkxalpqTjVSR29Cc2ova3NhN0k2RlFEcWJ4VE1Hb0I0cWpMdWRGOTVZeFUw?=
 =?utf-8?B?NVI5NkdTRUVuK09PZm1sSFc0Z2pJaHhlZjBXKzRRYW1jT2Q3Q3NhSXFsemZP?=
 =?utf-8?B?c2ZSME5Db1liR1NkenNUUDlSK0FuRnBvbUFZSitldlZudjlQQ0ZSZjNhcWZX?=
 =?utf-8?B?RC80RjZ5U1BlbFZHeWhmK0R5Zk81MFhUWENFVU81TkNvb2l1RFRoOS9NT2hZ?=
 =?utf-8?B?ZG9FQnA1V05ibTc0cEpPc0ZOUWowYTZpRzVWbDFNY0JvN0NJQ3NPRGNkWE5D?=
 =?utf-8?B?aVpXSXFqRkxRMWlUNUNVcWkxdzNDWnN0cFZLODFhdGJNSlpDRkFvQ0h2WWNV?=
 =?utf-8?B?S1N0VlNQYnNyajY3Q2Vld3k4c0JvTlpVMTlmV3g4eGxON0cxN0tFb2JCMVI0?=
 =?utf-8?B?WnRXUjVlNFd2ZVg3allidVkyZitkMWxMOGhIalZYRHpObnNFTlV0Nzg4bGVZ?=
 =?utf-8?B?OEhTaVNuaW94UHNYbk9PY2JtbEYyUk1jQ0tuZWxieVl1ZUZoUlk5WTNBd3I0?=
 =?utf-8?B?a2EyNE5UY21PS3kwRkxJdXQwcWVRc1lRZ1ROZkF6KzBPRjViM2NMKzRyb3FV?=
 =?utf-8?Q?ScJtrxxJOw5dhy1VxNcOiKQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QkhJTTNQV0tEK2xibEMwLzF4dVlPYXZ2d0M0ZDdpb3BmMGdtSTFxOHMvY2NK?=
 =?utf-8?B?cDUwNXdqdlVHWGNvN0duV3ZNT2dvcDZIVVpCN1JUYkdYbWJVek5uMldldGQr?=
 =?utf-8?B?K2NBZnlZUEhNQlI4dlVWUXh4SkRqTC9xejJ1SWpnR2ZBaWpNVXpHUElXKzNw?=
 =?utf-8?B?bHdzMzloQnNDa2RiTUYycXdUTzFTZkZOb2tvQWJ1bEhJVTMvQXpwM0x3VS84?=
 =?utf-8?B?czQvSTg4KzNYUS9IaG95eDVycGxoSDNWTnZTbEkrcHhIVGpVMHpuTmZ3UnlG?=
 =?utf-8?B?U2Q4eHp2SGJQN2VuTExmbVltUDdjU2Noemg1YVoydGlJcnNUTjVVMUtLRXVq?=
 =?utf-8?B?aThraU9VeEllZVB4amNsRkVXN21HemU4Z3l6KzRtSk1PNzJrNXlxWUhHVHNN?=
 =?utf-8?B?OFlObXdKWXpZa2FqSjdnRFAxbEpOcVdialZJckNPdUkvdlJKbTdkcEVtTytV?=
 =?utf-8?B?cW9QMHFOMi8vNUUyZjh3Qnc0Y21rZ3lFY0pTMmNqNHNRTUZuWFA2d0ZNcTlD?=
 =?utf-8?B?RWhYeTkyUEJrVkwzRHRPcUk3QjJiajhOajB6MzFWMDNyNXhkdWhVZjhncVNE?=
 =?utf-8?B?c0gxNFpSaElNb0lTQkZLQzVUek5uakxvenlwUEFYQ2ZJL1hlbjEvZDN2YzRI?=
 =?utf-8?B?bjQvNXpWYnk5VHBlYVcwbndrK1B2UXBwRXhwZVdhTWMxcjBrd1c0bHZnVnY5?=
 =?utf-8?B?R1Q2NkxPSVlqOSttdTAwOHFWVVYzcWdPcXZNWG5VTVJyZk1wZlVCS2JiRWNw?=
 =?utf-8?B?bTlCV3BKaTJMSVNvc3NtUlByek93VDhua1pUVTM5UUxVdWc1N25IUE1Eem1F?=
 =?utf-8?B?elBMbGlDcFlCNG5jcy9YdHhnUGFRSG9aZ2o2aHAyMG1IcDlOUEpSdWZONGtr?=
 =?utf-8?B?QWtIL0lrYVkrSmxCTkVqQ0EwdVhqZzV5QlNBVEthWk9Jb2dyT1YwOFdzK3FN?=
 =?utf-8?B?OXRYS1NUM01qbDdPeGNISll3RGJjbHIzV3BNNWRJYzFuRFNvbVpHRU9lU3ph?=
 =?utf-8?B?MjEvUFVxYXlyeGIzM1pOQlR4WmhnZ1JGWjJwWFZCQ0dyKzI3eDBCZ2VNMlVV?=
 =?utf-8?B?eFFDdm52cEM1NXFmcTVRSU84MjJHZk9yeCtNQ25TZDZFbjFzUndqN25iVmdB?=
 =?utf-8?B?VnAxRzkvNytIN0lkdWxQZlludWVWTVJBdzJkWjBGZjhWcjlJYklsMTM1LzZF?=
 =?utf-8?B?MHlHUXJEVHY2b0QwUGpwQUVSRXRKTVl1emRpdjZIWWJwZkgvZTZhQ3Nta0hH?=
 =?utf-8?B?YUdhNnR1ZStQU1ZLWDZZbDlYVEs1aU9wclZmODRMTWo4VXAwMUVWa3ozajE2?=
 =?utf-8?B?ZG81T2dEWkIrNGlQUHV4UzlPZG5mY0t1YmxsbmpVY0RET1QxVFo0UitELzBG?=
 =?utf-8?B?dFVNclh0Z1U3YUt0OG5kazRsRHNzNFFtNWp4S1lIdXZkTjdaOHRxUVNYNzhG?=
 =?utf-8?B?akVwN3BIQ1czbVdmUlFTZHNJRTJERTZQcmdGNmUyemdFNENveW5VNW5naSsy?=
 =?utf-8?B?QjE4dExDdVhCeFBlcFRFL085Z0hxVnBtY2R3T0hjaSs3V2lCZ3hTMFRBY2Rj?=
 =?utf-8?B?QkJYWERtQTRlK3FkdFFYb2pmUjRuMXVPaUhpTzZVZDF5Y1RtRXBTZit0WmJn?=
 =?utf-8?B?OFBVdU03a3M3enF0cHBzaFRVdjF1SDM3VVk1bzg4Tk9NTHF3RmlNNklZYzJE?=
 =?utf-8?B?cm1yaXlLUEQzZWQzWDlMak56VjFiMDhYYk1rNTc5QzJCYk8wcmxGK0JKc3Vm?=
 =?utf-8?B?UXJVUHJ4bm5hMTZXYjdYU3dzUXhhQ2t5aFJUNDNFNktHUXJmQ0FuUGF6K3lH?=
 =?utf-8?B?M1lwTnhIbE5Wa1B3Nmovb0RxWkRxUzk5S3N3TkFQYzNMc3JnS3IyL3NxUWJU?=
 =?utf-8?B?eHdsTitWcUMyUklrRTcwaTJhWWEySTJGSDg1TzZQREhDQ0F0SXFDWkdLTUNY?=
 =?utf-8?B?VHNKQ1UvNC9QcDkwS1UraDJDV0FkemcvM0x4aml2b0tFS1hoTnVPU0I1Um1p?=
 =?utf-8?B?ejZiWW55ZjlSd3l3bVpORmxMekxpRlNHWjdQaU1XUFRVRk5kUVo4R2hnWjE3?=
 =?utf-8?B?SW1iK2oyY2luK0doY0xoS0lDL056Z2N0a21ha0FWUUlDSWxTb3dQMzE1VnhM?=
 =?utf-8?B?QS8rZ0dwK0FWa1BBVmdSdUZLTk5YVms3NnJITGNRMEJkRUFmd1FJVityWWgz?=
 =?utf-8?B?RmFLZTZUYkVMNEUxM1A1T3hadzlIeElBTldWWENuU3lsZDZrQjNRSW90SXJr?=
 =?utf-8?B?WWRUTFZxY3B0RzNxNTdLWmE4SmJicXkremFHb0sweHZzdFdWampOVWRaNUtz?=
 =?utf-8?B?QWErZkhuVDU5M2lSZjVpaytJVzZNU25iS0d3eUw4bElnVVBRN0NzZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e6370b7-3d27-4c64-9d36-08de6515c34f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:22:08.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nBqqr7FHLHZJFpJ1z9hKe5HGWVbcsInEXUBUcNnLaTbxLlTZC2Ch803j9vHt/Oy26JJ7AW8NcyOueQvo8UhLdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9852
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux-watchdog.org,roeck-us.net,nxp.com,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4908-lists,linux-watchdog=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email]
X-Rspamd-Queue-Id: 75A57F8964
X-Rspamd-Action: no action

From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>

On i.MX94, watchdog sources clock from bus clock that will be always on
during the lifecycle of Linux. There is a Low Power Clock Gating(LPCG)
between the bus clock and watchdog, but the LPCG is not exported for
software to control, it is hardware automatically controlled. When
Cortex-A55 executes WFI during suspend flow, the LPCG will automatically
gate off the clock to stop watchdog and resume clock when Cortex-A55 is
woke up.

So watchdog could always be alive to protect Linux, except Cortex-A
platform WFI is executed in Linux suspend flow.

Introduce a new hardware feature flag to indicate CPU low-power-mode
auto clock gating support, and use it to avoid stopping the watchdog
during suspend when LPCG can safely keep it running.

Add i.MX94-specific watchdog hardware data and DT compatible entry to
enable this behavior.

Signed-off-by: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
[peng.fan@nxp.com: rewrite commit log for clarity]
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Update commit log for clarity
- Link to v1: https://lore.kernel.org/r/20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com
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



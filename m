Return-Path: <linux-watchdog+bounces-3862-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9ADB03CAE
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 12:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7FBB162F0D
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 10:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450B524466E;
	Mon, 14 Jul 2025 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="XXXuJAwX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022096.outbound.protection.outlook.com [52.101.126.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75C01FBE87;
	Mon, 14 Jul 2025 10:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752490585; cv=fail; b=LBv3vYELT2+B5PT2yQcWBU1NL7zfY1o77UgTbk9Pz4igOkUrtM6AFWMijJ/W5csnrVPEuMQ6BltozcbAQHidy/NKwzcYqoTV/Rp7LHxTwraSk/JMV0e1QI32ey1QD3r/PnLX1MlV+a06dkpQzoVOMVhy4jO1bV2OXLmukSi0ULY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752490585; c=relaxed/simple;
	bh=sRCZdmpEyQfNG9ysfsQkISHINjxP6wPOBh1yBLHCGDs=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=iXdHuexd67NNa2H0WpG+HHGQvxuMF7RXs7u6p5zjNM6D0VEoVWHABfbtTVVXV3pWAw4qqeyFlCnNgpKCABojEMTSTZ6Fm9cpYxG1OXvE5E8jJwlAuiHDHmmEoW3mh7F8AkF9nSweEGUy39cm7GJujUQxEgf10RbIWVzFp1eYKKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=XXXuJAwX; arc=fail smtp.client-ip=52.101.126.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrFeu8yvvMurQ52eqkspHQ8B4tzbUfS8sJX2j350sg+pL4F6JGvAdVyChhMyUP4wSvqyOq4vxkdkoj3ZWtKSJCJ/nfLvQYJJErd2Y++MEVSTn+wATm2dbpNwmVKlC+p5yGPMaWPnV7C5slyS8Rb55Q8c4nqTIUFJ8k/oR/w7iVaHUGwzHXDg8L+sQOLqz9ixnYAj03TLIooV6H4/YHRDjTGIDIAUTC2YafUp01q4pIvFPCTApukN6iY+DwV2VsawSXv+vC549CAMVZc2FGDc3WZeZTxvr3bOLgFzSewLnJERhtiGa8/EeJ2owg+Y74orsCQSvMGmoJmMM24Vil7Qcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTVYAwxC68qZtGFcgDkcEBuiDULnDnWJ2ZaWDnj9jLg=;
 b=st20WM2uPmFJvAmqWlyHd6FnMLCfU6iOdbev5zHAKjQKszlDccEgy0MDRkyotMz/cQjQcykdaOAv0aFc5+5souA8Yfp7ebqdTde3667nh0CW+uEX/OnRUG9xtpDlA8zkLilIdN8tGvHL5bLHOeWuLE/ovnFgJkoT8AkluTuC2K7hbNniSbu9LO4p1oAQqkbNKtTbl5ufFhUFJo2LHF+2mUqTVj8jZb7VVEmCacqjQUn8ukHmZiXGgU+zERIhr7NHiObjvbZwfg1ib39BdwmFH/Z4ocJxGpXEFrPm771rDf21RGAHJgvwecn8fUOIxGXQazAdItAQQLFU/qhtsPhZZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTVYAwxC68qZtGFcgDkcEBuiDULnDnWJ2ZaWDnj9jLg=;
 b=XXXuJAwXy0omctLUcFzlx2Xrl2wbH0rsasN/RJ5QRdk0yrGVA0+4sm5DGDUHtR4WzTaJIVsOcp8Z8kArJrUbDTr8srPXxL/cHoh7IXCaH+i8LMyKx78gjVqOGpf1i3Pp7SOqk9uyEqssKHmLs6N/IF2t4IoBa4v2zdYjWmTzO1v/vlw3x4pakAoBTJIUWvTwQW3J8vtHVRENqp+XDU3BswZW2Bol9G33xHGcw80Wzuk1KY+9ocHDA+1EFJhY+mHKSJqrolBUadTul4VrrzP/gkkGcb3pPXcjIrf01heRI6xvMUdwQ9ZvNaCFQooMwRWcO+rew3CGv1aof2vL+ztoJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TYZPR06MB6991.apcprd06.prod.outlook.com (2603:1096:405:3e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Mon, 14 Jul
 2025 10:56:20 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 10:56:20 +0000
Message-ID: <9592afad-029a-4098-8625-4def3bf41093@portwell.com.tw>
Date: Mon, 14 Jul 2025 18:56:18 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v2 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0001.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::18) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TYZPR06MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a26168-308b-4e5c-9dcc-08ddc2c510b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXl5N1hDY1JGS0dwTzVoWlVlLzVKc3pQOW8rendwWGNoSXNFTTEwSVp1SXV5?=
 =?utf-8?B?UVZRMTdOeTZ2Y2Z6TkpoUVZmbWdGbjh4eDI4TExDdm5UTHRvUmJnTDYrWUU1?=
 =?utf-8?B?U1BXRUxmTW1ic2hGa2M2YW5sT29pVXpWOS9FcWIvUlBxYlZLN3BPdGhaWmFk?=
 =?utf-8?B?T0MxR0t3dzNQT0FBbTNucWFhNURNaGxGYUdoeWhtbFJDNmUrL1BvVXJnZXRz?=
 =?utf-8?B?RzRwTEZnVnFkVi9xWk1EZ2NmV3oyV3hIbnE5cjJpOVBhMENDYVg3VGRpVGVn?=
 =?utf-8?B?Zks3ODlCM2RXcXN4bFE1WlRyNm1MS2piREEwOGJXcjdmaUt3Wnc2Qi8rTjhC?=
 =?utf-8?B?MWU5bjlSaWdNYkFXNUZ3Mkx0TEZ0R3hybEJTeFJDbW45Rnlsb0RwRFpkSFJj?=
 =?utf-8?B?eHBQVkhCdmRHSmZRWkN0RWkwNy8yb0FSU2RybEM1dFEzMVVyTm9oRnNtSnBa?=
 =?utf-8?B?RlR0VlJ5UEVmY3R5WFAvcGkvVDBFNU1yQ05WWGdTQjZRbHdFRUxxNEZ0azND?=
 =?utf-8?B?VW5SRE44bFZyYTZ5cno3UmRjd3h3clhUQThQR215K3lacGFCMnFXN0tpV1Qz?=
 =?utf-8?B?bmFwT3F3ME5kbW1sVmRBWGdCZStwUjVFOVZpS3BRWEdvYlVBcUkyUW1TaG5s?=
 =?utf-8?B?bzFTNjJwMDRHeFU2Wlh1a3Q1WkNZRXYxQUZFRGYwNWZlc3FldldUZE12dXlN?=
 =?utf-8?B?SlRXYlVkZjU4QkE5RnZlNHRSK3JaZTdTTGFUVUIrZzFYQ0xycjJsZ1lDRy9P?=
 =?utf-8?B?TkFiV0wrRDNtMkVWdXJSSzhGNG5UNXljaTN6SkN2bVpWOFlJZ0hyOTllamJs?=
 =?utf-8?B?dXU3bEUzK1puV3lTZmNyZDArVDR2WmVlSGMvNXJvRHoxSUFheUhIMjlvRTRv?=
 =?utf-8?B?NVIrSGJ4bU41V3hpRktNaVczekVQN1ZoZjNMQ1hBZ0ljbXppYzFPcmF4MFpG?=
 =?utf-8?B?ZFRRdFY0VXRlYWtHMG1mSENhU2hTRTd3RllpUit2N2VsblZTZ0E3NC9IYy9N?=
 =?utf-8?B?cXpIalRqdXdVNktvSnVPT042SjAzdExWMGd2ZGRmNis0YzBFSWJGZXladmpw?=
 =?utf-8?B?TDByT0NmaGZZV3FRMDR4L1pIZ1pVQy92ZEZIRm9tWmRMMmloREhjN3pTRThm?=
 =?utf-8?B?cXAwcnNKZTJXS0J0YW05TlAxTTNQelk4WTAzN1RLb3ZCR05zek5DUEE2blhn?=
 =?utf-8?B?UVdJdUFpQ2JlY2NTdldHR0lLRC8rYTRySlY5djZlNWlmNlQ2Y3loVzYrU3JK?=
 =?utf-8?B?Rm1QVEpicmtUcEVRQzNxK29nc3hjNUVJUld6bG1KSlJXVzYzL1ltZC9xcUx6?=
 =?utf-8?B?SVZGQjVQL1RUSC8vb1ViWVArbmdCV05BY0U4NXJnaUZqdlJjNFFhdk5UR1hs?=
 =?utf-8?B?dTc3OGNjTmdVL1pUaVJ1elVqSTRlMmQzZis5b09WYmZIL2NpRmJxVmIvM2Na?=
 =?utf-8?B?VGpvZjJsZ1E5cHhhZXA0RzVMbDVVQk5ncFBaQ2ZtQWZEMkdWMXdvbWpWYjJE?=
 =?utf-8?B?RjVuc2dZaC9YV1l0UDd6YSszSVIrZmhHcTZZLzJ5dmt4U3JpUHFyMXlTR0Vt?=
 =?utf-8?B?M3ZrejdOWmdkaVMvQlE3b2hCUG94YWp4NjJXcEMvWGp1QkM4UURQb3VGWXdv?=
 =?utf-8?B?K3MwYXJnelVlaEdvTnE1YnoxVjlBZDVZUi9tU1drbXpTYTFBN2daRDNoa0Rl?=
 =?utf-8?B?MW5nT01MRWR4SEF2aGJCWk4reEJJS0lUbU4xLzVlajNBempsRDQ4V2NnMUNH?=
 =?utf-8?B?c2Z3Ni9ieGxBWDM2ejdmcExaSm9rVHVoYkUrWi9FcVkrYWlsVGdUdVVaeXNQ?=
 =?utf-8?B?V0lVanVMdzVoQVNNdHNEd0ZiY0tCck1uNWpqMEJrTURxOFRNbkg1R0QwYkNB?=
 =?utf-8?B?eEpXam1MdXZOZlM1eHhIMGZLeUVobytuS0JYWVk2T2NIWUwxOWtuN2ZGSXVT?=
 =?utf-8?Q?pYm8XdEDJlI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TCtiTlZwd3BRd05EVFZZd2czTWE3bjVJSHNWNnhZeFd3VC93Q29URng0ajZI?=
 =?utf-8?B?dVVEUE04b1dkME1wYWhuMVpXeVdrZFpHWFdZeC8weXJkRm9MT09uVWpOMzQ1?=
 =?utf-8?B?STY3a1hzblRUN2I2ODFzTkRBTnovbzEyVmNYU3NZUzNFaUxhcFljckVOYXJx?=
 =?utf-8?B?aGdDemlZcEFvOGM2dW9ORGlhZEpqSWZGU0dSTnIrODNKa2FtTXNkVjkxb1RL?=
 =?utf-8?B?RmZCOThla0xDcDZVUVFJcEhnN2NVVTBseGxldEJNaW4xemxvYzU5anU5QlV0?=
 =?utf-8?B?Q0l6WDJMdUd5aFFwZmNtSllNL3gvQkJBQUdqOFY2MEVVVGFOaDE4SXBWQ0t0?=
 =?utf-8?B?U2Q3cGt3MjFVbkVOWEZlMlBXVkpWMjVrNFNtS0I5emZ3bVJDS1JVcE1jVzho?=
 =?utf-8?B?MVR3KzF0cVNYVFBUb1ZlSWJReEJ4OWs1cC8yNUpkZ0hwTTM4bjltM1N3Mi81?=
 =?utf-8?B?YjIySkgybHZ2L3preVZjMnNNY1BORWxqTVVnd2xTeVg3dnVTVVZMdWx4K3Q1?=
 =?utf-8?B?NUFXNmNCOE9DMmV0cjdlUEhLbnZrMDdPUkpRcHVoN0VDMGNPdit6ZmFEUVRM?=
 =?utf-8?B?MFR4UXA3ZlV0SjYwT0ZPb3U1T21nYlBGR0ptMjhVNzluMDI3TTB1VmlrcFJ5?=
 =?utf-8?B?TmlpcU8xa3RVYVdrcW9vRnpuNXJnaFRvcGExcG5UaU9UMVljZ0tNTDJPSTJC?=
 =?utf-8?B?ZVMrOFN6VEE0b0xxUzhwajRlYVlIZi9NUGpOY3VPeEk1MVIxSUgvN1k2dlVn?=
 =?utf-8?B?OUx5QWowNW04dVdUUW1jNDIrakp4c2wxMDA4VEJxbmt1Mzk2dnRhTjdUK2F5?=
 =?utf-8?B?aEduQ0hiTkhjNEdCczlqcWRUZmhjZUd4cGxmblhxUU1uRi9UblhUVVJkeTRp?=
 =?utf-8?B?bmNQcUJKUlpVKzBNL094VXBnVVFmRnpJbnE1YmpBSERwcFlPdUcwb1R6VmVU?=
 =?utf-8?B?c01XMnhoaUF1MlNpQ1JwZG5HanNrYjAzSHZ4UUk1cjZNS3ZibUJ4Uk5UL1Y1?=
 =?utf-8?B?c0pXajc2RWpsd2hsY3F6d2V4cEZ1eGlHVy85aytKL0phV1VpWHVpNVBodXNh?=
 =?utf-8?B?TEF5UzJRMUZuQjR1ZlV4ZHR5bkRXRmpCREJpUm1GcjNOYU9RVGpkdmkrc0sw?=
 =?utf-8?B?UVArU3FsOFhKRTFHeWI0U3N5azhaajFqdyt0SjBlLzhmMDZaOHI0WnI0RVg3?=
 =?utf-8?B?MnpWaHg3QXJzRUo4Rmo2d085ZklRYU4vQktQVHZpZlRVWUNkV25uaWtCanA4?=
 =?utf-8?B?Y3d1UHlGZDNxYmVoSDBiRUxzNS9kZGhnWkJtVWpwYkVyaEg5Q1JmaW1tbFFl?=
 =?utf-8?B?d21nL1pOYVNqOEo1T3BSNGJwemRPYXZ0b2VUK2UrTzBDWE5ESkRBV1l1ZlJn?=
 =?utf-8?B?ZmNlU3FHYXdmTjhIWkhtVWNtY25ESGc0Sjd2blVNTXF0MHFmRnl1NzliTkpD?=
 =?utf-8?B?WllxNzhKVHRsRXl6OUxpNE9Zb0FRVWhpdllzQng0OWV4M0o5Ti9rL1p6NVJW?=
 =?utf-8?B?bGpkUktUc1FnaUk2VnJqMDVBWEgwUTFjakI0S1IrRkJrVGpsZmtnY09pWkNO?=
 =?utf-8?B?bUppREtCOWg0Z0tTcExlN1ZDcWo5aUNHSTIwUGlDN1JXa2JwRTRTSWpvTTk2?=
 =?utf-8?B?ZG5LUVQ0TU9ER3IxYk9Pc1VhTlkxU2lKUit2YkpJMDVhVTF2NjNDU3FUN0pm?=
 =?utf-8?B?czNqRjRDZUZuV0MxODFmYk5mSGt6TWJYUndicUlXS3dtWjVTNlBhQndtb21z?=
 =?utf-8?B?ckFZOWJUcGRnNk95N1RMMzduR2RHQ2pjOFNhTnZpb0pGeU9HZnc2Q1d1WEdw?=
 =?utf-8?B?VkpTbFV6RnYxVGo1NWZQbjY4cUFTS3JTckFJRTBjK3FadzNLS2FpWWpObW1q?=
 =?utf-8?B?WStCbTdWTktHS0tmUXpaaFNDSDhVeC84TzdxT1lkQlN4NmIrejhBUDJRRzBP?=
 =?utf-8?B?QWE1dXBsQnFyK3JoSFlVZzI4WHNVQnkyR3lkVkFPNkU4UC96bEJQUS84cEx4?=
 =?utf-8?B?MmdMdGYxNjZDNGxhd2NJd29WaUhJOXZqdHNUUU00TnRBSmRrSnlXdEpHcFVI?=
 =?utf-8?B?RkxDb0ZPa1JXQ1FKeDJLaFl2L3lMUkhDS2FRc1lvZSs1TFFvVWR2RUNqM3Rs?=
 =?utf-8?B?L3VhZFV5aDhGdVpYMDlmNDA5bHRqWUhIS3Jwek9IYTJhRDN1L24wcG9rTCti?=
 =?utf-8?B?Tmc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a26168-308b-4e5c-9dcc-08ddc2c510b6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 10:56:20.3863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41OsHOVhw2WaV2y0m8T0lgWih5Jp1asgm/L7Yx5q9MeWmFmua4ccvMhjFVBT3rdXZU8+yGbsbt2h50S2AqGmkppUs5aBaqlc4MidmygoKL8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6991

Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
monitoring into the driver via the hwmon subsystem, enabling
standardized reporting via tools like lm-sensors.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 drivers/platform/x86/portwell-ec.c | 178 ++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index a68522aaa3fa..ac113aaf8bb0 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -25,6 +25,7 @@
 #include <linux/bitfield.h>
 #include <linux/dmi.h>
 #include <linux/gpio/driver.h>
+#include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/ioport.h>
@@ -52,16 +53,64 @@
 #define PORTWELL_EC_FW_VENDOR_LENGTH     3
 #define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
 
+#define PORTWELL_EC_ADC_MAX              1023
+
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
 
+struct pwec_hwmon_data {
+	const char *label;
+	u8 lsb_reg;
+	u32 scale;
+};
+
+struct pwec_data {
+	const struct pwec_hwmon_data *hwmon_in_data;
+	int hwmon_in_num;
+	const struct pwec_hwmon_data *hwmon_temp_data;
+	int hwmon_temp_num;
+	const struct hwmon_channel_info * const *hwmon_info;
+};
+
+static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
+	{ "Vcore", 0x20, 3000 },
+	{ "VDIMM", 0x32, 3000 },
+	{ "3.3V",  0x22, 6000 },
+	{ "5V",    0x24, 9600 },
+	{ "12V",   0x30, 19800 },
+};
+
+static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
+	{ "System Temperature", 0x02, 0 },
+};
+
+static const struct hwmon_channel_info *pwec_nano_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct pwec_data pwec_board_data_nano = {
+	.hwmon_in_data = pwec_nano_hwmon_in,
+	.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
+	.hwmon_temp_data = pwec_nano_hwmon_temp,
+	.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
+	.hwmon_info = pwec_nano_hwmon_info
+};
+
 static const struct dmi_system_id pwec_dmi_table[] = {
 	{
 		.ident = "NANO-6064 series",
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
 		},
+		.driver_data = (void *)&pwec_board_data_nano,
 	},
 	{ }
 };
@@ -79,6 +128,19 @@ static u8 pwec_read(u8 address)
 	return inb(PORTWELL_EC_IOSPACE + address);
 }
 
+static u16 pwec_read16_stable(u8 lsb_reg)
+{
+	u8 lsb, msb, old_msb;
+
+	do {
+		old_msb = pwec_read(lsb_reg+1);
+		lsb = pwec_read(lsb_reg);
+		msb = pwec_read(lsb_reg+1);
+	} while (msb != old_msb);
+
+	return (msb << 8) | lsb;
+}
+
 /* GPIO functions */
 
 static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -204,6 +266,110 @@ static struct watchdog_device ec_wdt_dev = {
 	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
 };
 
+/* HWMON functions */
+
+static umode_t pwec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+		u32 attr, int channel)
+{
+	const struct pwec_data *d = data;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < d->hwmon_temp_num)
+			return 0444;
+		break;
+	case hwmon_in:
+		if (channel < d->hwmon_in_num)
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int pwec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+	u16 tmp;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			tmp = pwec_read16_stable(data->hwmon_in_data[channel].lsb_reg);
+			*val = (data->hwmon_in_data[channel].scale * tmp) / PORTWELL_EC_ADC_MAX;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int pwec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				  u32 attr, int channel, const char **str)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			*str = data->hwmon_temp_data[channel].label;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			*str = data->hwmon_in_data[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops pwec_hwmon_ops = {
+	.is_visible = pwec_hwmon_is_visible,
+	.read = pwec_hwmon_read,
+	.read_string = pwec_hwmon_read_string,
+};
+
+static struct hwmon_chip_info pwec_chip_info = {
+	.ops = &pwec_hwmon_ops,
+};
+
+static int pwec_hwmon_init(struct device *dev)
+{
+	struct pwec_data *data = dev_get_platdata(dev);
+	void *hwmon;
+	int ret;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	pwec_chip_info.info = data->hwmon_info;
+	hwmon = devm_hwmon_device_register_with_info(dev, "portwell_ec", data, &pwec_chip_info,
+						     NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon);
+	if (ret)
+		dev_err(dev, "Failed to register hwmon_dev: %d\n", ret);
+
+	return ret;
+}
+
 static int pwec_firmware_vendor_check(void)
 {
 	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
@@ -242,6 +408,10 @@ static int pwec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = pwec_hwmon_init(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -274,11 +444,14 @@ static struct platform_device *pwec_dev;
 
 static int __init pwec_init(void)
 {
+	const struct dmi_system_id *match;
 	int ret;
 
-	if (!dmi_check_system(pwec_dmi_table)) {
+	match = dmi_first_match(pwec_dmi_table);
+	if (!match) {
 		if (!force)
 			return -ENODEV;
+		match = &pwec_dmi_table[0];
 		pr_warn("force load portwell-ec without DMI check\n");
 	}
 
@@ -286,7 +459,8 @@ static int __init pwec_init(void)
 	if (ret)
 		return ret;
 
-	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
+	pwec_dev = platform_device_register_data(NULL, "portwell-ec", -1, match->driver_data,
+						 sizeof(struct pwec_data));
 	if (IS_ERR(pwec_dev)) {
 		platform_driver_unregister(&pwec_driver);
 		return PTR_ERR(pwec_dev);
-- 
2.34.1


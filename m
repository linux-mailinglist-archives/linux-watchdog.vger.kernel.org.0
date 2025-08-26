Return-Path: <linux-watchdog+bounces-4063-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 640A7B35941
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Aug 2025 11:43:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D67E3A2DEA
	for <lists+linux-watchdog@lfdr.de>; Tue, 26 Aug 2025 09:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD3F2FC87E;
	Tue, 26 Aug 2025 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="KsoxmLjN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023099.outbound.protection.outlook.com [40.107.44.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE39A296BC3;
	Tue, 26 Aug 2025 09:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756201420; cv=fail; b=UAs+NpI5OtwAXkNoJX86U4S1xGLEnDi2isHwuEhlpE0G6D/1/DalotL1kzIwpcoPBFBanBTZ/gESIHbUFuLwonSv5/vE7TccpXOz5Jv/KzF0Zisxzo5iBmMJMGtJh3mbUJXEk+5KadDbCpr2gbPdikMUVrTsFoVeHzBiAgJSsvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756201420; c=relaxed/simple;
	bh=zEiX1KyYhcj5PlCIF7Vf6QDrnmdQ1w/8ZJZr/oQCb10=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UzSyW0VvTCioaT5H8FN+Fz8qJvFXPMpHLwGDKI/e9D97ENOdYMFX52EfFyhWezMJtFrvp9RobFTF11LGg80Vu23v0bftHKvoHhdj1Ns+u5S7HCm5qts2DgfmEEavNiwCTaiFW6xQURSKoPVXzT+4bIZ3kXNVMQSgf//TYt/HMgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=KsoxmLjN; arc=fail smtp.client-ip=40.107.44.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j4hT1+miH3L23PM5i3Y6ZTdx1pXbplzZxop/KLFDxw/Vuc2+3EEaC3cfNmrMCkNkZesyHd0PgJUC5ydUdqM4QW2pweBkUU/odjAhMU6doQP8PN7xC4u5dpasfx0E3CBIzSvMmu+8gikTR2KG47alTZpJxydBbMVWVe6KBPM0nh1QT3NI8/Tc41Ms+DCHD7ymfkoedivF4mh/f3mjhxc5xkoUq4tmB5P6D4TbH1vjCYrd3vFMFB72LcDR2lg890DtVB6454GEGulgi8FmNrmlpqwblkPz4dzHjocTgnKjWUM+67gmZjt9BtaGbDn8ZfDem0p/O5sKa1zOl+yxS2zzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0kz/HWyfb9TbqKLCzEC0t0EzOXaWhLtC9OYRHEduh8=;
 b=LfrUCr50qulwoF6jbIN5NbMj1rHXd6by8m11YlhFY6a/ft2u2h0Me+vm7gvQv6tvo3AdMlJOJtAPO0IS9SHAxb7viOIUkY2GiozkX2Qlt0OEFd5XPDLBJVypCKwFuTDSM7WOBotMr2Id/FdOQuoM2EN2pnimHWhW0HKlFhBB/WW4VJynC/5t6QrzNZA6bwgyvSQIF2njTEVgBhSre+F2Tl4qN6Ow96Fo+8fW2+d/PGr/bvTTpoXg+Z0xzIVTq6g31G7nSH+NsV7fIOX0lY0Rhf43Wifrv2hAjhaezSLl7E7CB4uZwxvQhZ4jrKe2A6ItFluHIgN8Bcv+nhklSjMv2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0kz/HWyfb9TbqKLCzEC0t0EzOXaWhLtC9OYRHEduh8=;
 b=KsoxmLjN+jirAbK3mrffEws2ZUaxIBpfjx6LolrokBk4QT13/QhTchkKxRuMcq5eZEjyDyRMmZVV+MW0JaucrCSVPVofHDkFU0Q5Bbe07QIOxcfz4lkFpFcwDfT3mHWzT9WWt9O7nAIWfnuwLRpGkex39eQb9sg2059LQG0p6+KhzDrpAvFPz0OCxg62v4YxU0JN2gdQsjyOrqhrHEogULRIWx9CTatJjAAThOcpNR0VpfDvdKFAtoV+xCK4+PMivFU1SHcZsXiALLLn7W9/5Kd2CiImyZ/vuiyE67iZfP5j8YEiXzfD5TtQExFcPveyVx4ZeiPYY7LoQJYjbsvp6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEYPR06MB6312.apcprd06.prod.outlook.com (2603:1096:101:140::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 09:43:33 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 09:43:33 +0000
Message-ID: <f72da7c2-cd2f-4b09-8cc5-7b08ad54dde8@portwell.com.tw>
Date: Tue, 26 Aug 2025 17:43:29 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v3 1/2] platform/x86: portwell-ec: Add suspend/resume
 support for watchdog
To: ilpo.jarvinen@linux.intel.com
Cc: hdegoede@redhat.com, jdelvare@suse.com, linux@roeck-us.net,
 wim@linux-watchdog.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, jay.chen@canonical.com
References: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
 <e11e542b-b630-4f18-8a60-a36fe31c0133@portwell.com.tw>
 <6584da3e-fc86-7a47-f783-da77049b2215@linux.intel.com>
Content-Language: en-US
In-Reply-To: <6584da3e-fc86-7a47-f783-da77049b2215@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::14) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEYPR06MB6312:EE_
X-MS-Office365-Filtering-Correlation-Id: 11cf3bde-2e5d-4c30-40b6-08dde4850583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0dRaytSMzVMODBocVVBSXk0bWgrQjFQNHBWc2lnblhaZkJQRTBiN1B2bFZU?=
 =?utf-8?B?Ty9OSGFtQlZxRDd5WEJLaHpKMmo5bDVxQTFLakFOdUFJa1hVODVmamZaZEVU?=
 =?utf-8?B?a2hicTdzdk5PK2VVNDlqWWphcVlXQmNGdENobmRDY21PQ3FET3ZFV0xwaXEz?=
 =?utf-8?B?MEtyaFJ2TnpJMkx1cENiWGZYczlXelYxYjczV2FSeFMvZ0RWTkNqSVFEUXhZ?=
 =?utf-8?B?V09xNWM3T05kSTlNTENMWWpKNHkzNEVzQnQvREhrSENxRU5pbE8wWCtUbHk5?=
 =?utf-8?B?SXk1VmZBWkZUc1haN0V0T2dPQ05UK0VOUSt2ZElIV1VMbkZjditpdHAweXN1?=
 =?utf-8?B?SEx2TXlNVHNSR1UvUmdUV1h4ZzVZK0l4TnY1WS9QTEZrOUxxcmIwNG9GRGNo?=
 =?utf-8?B?OGtNSWN6anNjY3VXbjNNMG4vWDBsZjlYbDBvZktzUXJkK0Y3bG9TZ2o1dEMr?=
 =?utf-8?B?anA1dERMNTRLTW5RWGlaYmNTU05OaFd4YTltZSs1cHppOWFRWHZJUHB4T2E3?=
 =?utf-8?B?elFoazhROVdiT0RFV3hpT1pjVU5ZSFdWT2JpV0N1Zy9sVElwQjJiZmR2Znln?=
 =?utf-8?B?TGlWME9xV0xEVG1Nd1FVdVlURzJHejVLTW1rbDMxWFlpWUVTOURxSE5FaEZJ?=
 =?utf-8?B?Q3YzaGpCVUlJRndaSFpsVWVEUlFXd3IxZUwvVzFSWitXTnNWa0wwUlpVRXBy?=
 =?utf-8?B?bzAybndVMHp4Q0dVMStrMGFORUtXZ29DNktUSHIrUjZRZVZDWG53bmpZR3RV?=
 =?utf-8?B?TUthamxIN1BzMnVFaGIxUzZNQ0FEc0RWNTdYN29OelZRdzNPbW5ENnRYSngr?=
 =?utf-8?B?cDRFUEpPdVVwUEZGLzVqWmlZdC83S1R3NkxRR1RlaUM4ZWNjaURkV3hSQ3Vm?=
 =?utf-8?B?NnRPRERTdXhtUTBFQ21aN25XdTRsTnA1aDhkTDdHNmpHODFQd2pwbGlER1ZF?=
 =?utf-8?B?ckY4MFpvRFh3YTFiVGVuWFlUZkJ6SXlxVCtYcStFTmxUZGJsbkFmTStuUlBN?=
 =?utf-8?B?bjJyT0dUNWo3ZUlyclRrVExFSlFmZ0Q2UGh5aC9JaDNZU0k3WkVtLzNjTThs?=
 =?utf-8?B?alUxT2pYUVY2RmorR0JLNEozY2tsODJHZHQrdEw3c2VucnkwZ1FRNEtQdmJW?=
 =?utf-8?B?M0w5UUEzUHpPQkVLaGxaTkNKalJsMVExcm11enRUZm9QRWFqZFAwVVE2TTE5?=
 =?utf-8?B?aVdpMzR0U092SkpTWGhxcHFjWEt5WTMvZXZVSmVUVGJKdy9QVE9DSTEvRGJa?=
 =?utf-8?B?S1hWLzRKK0hUWlBwUE9wNW94cG1sMHdGRmhDM1c3bUtNZE5nS1dYVXhGdm10?=
 =?utf-8?B?NGxGSUx0RmhKaUdrQ0lIaThjM2FOcWFDaktUNXpNRHdWbjdJSnFOa3BZODlp?=
 =?utf-8?B?RDNSNDBaVTBGd3VObkp0UWVZd3RaTmtuNHIrRks2UlZhWnVTNjhEMFRzWkdr?=
 =?utf-8?B?M0cxMndoNjMvNmtMcW55VW03NG5rNGxOcFRWaWxTMjdkeFZ3MjIzV0ZlUUZH?=
 =?utf-8?B?VG03YWtBdTgvTUN2Tnl1ZFh6b05pWTBQUUdja3o5V25YU2VPODVyaCtGL2VU?=
 =?utf-8?B?amVtY0k5dCtZb0FENnFWOWhPeVQ1ZWJ3eUtXOGZvTVRMN1lURkNBeVVRYjVk?=
 =?utf-8?B?OEpDTVNtMG9KMTgwWFhaL2ZYb0c0WFZxOGlXSG8xRDZnZldBVXUyTjExU0J5?=
 =?utf-8?B?clUvQTFvdlR3eHVZYk9CdVlBaDBQSXJjbXNtc3JxOEJ4S3ZkQmxwbFplblBn?=
 =?utf-8?B?U2ZGVjcvQWt4TVJqdFFsOFJsNzNHSnJpdjVHa3ZYSGgxMXNyekpuc1JLZ2hr?=
 =?utf-8?B?R0lJa2pvbXRGNU5DUExwWjI3czBXbVkwK1lnS2h6VVNCWUJOVTFURGtyN3hV?=
 =?utf-8?B?T2lrMkpHOThNM1EzMXNJb2FFUzNXMUxqVEhhK1pWZExUZEtzWERiZ3NlRFRl?=
 =?utf-8?Q?zDprJyxMRZU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjE3NEJyWUtCc2RMVlA0Tmd4ZzBIY2lqdkV2bmM0S2doRjg0c0w1V2dyZHN0?=
 =?utf-8?B?Tkc5Q3IrOWtsUkN3VXI2ekFTL0FSUDNZQWErano3KzltUHUrTTE4c1JTUG5s?=
 =?utf-8?B?QTU2R2ZQaTY2M0hCdGsvVXA5V1h0R0tiRDlYc0Q4ZnMwQkc1NUdkK25oU085?=
 =?utf-8?B?cm5RZk1hanZuMFlVU1AyUTlZQjVNTmNRY0VHSnMycmx6MTM4Z0MrcTh6b2ZG?=
 =?utf-8?B?NUlTdGNtSHRmczhPNTBtelFPZFVtb1lxUzdVTkZsSmJpanFoaCt4a3dJRUE4?=
 =?utf-8?B?TkRFS3o3NkRVL3JUQXl4Q1RyWmsvK3NXckxIYlFPME5qWWQzUHFWWXl6VjJo?=
 =?utf-8?B?UENFYjBrdTBSZjk5a1FaM2RSTDA1N1N2MTM4TzlwcC9Mb3RHSGxMYnczR24w?=
 =?utf-8?B?eDJBbmlPL2pJUW5DZkV1YW5ReWZFaUhyYndrbzg0c1NwVGxWTHdNM1dWejRv?=
 =?utf-8?B?amZmRDAxbTIyTnQreUE2UDRTZjRQVEx5TzFxUGR5OWRjdnRSU05zWCt4WmJq?=
 =?utf-8?B?ODFxUVFscmhObWVMWUUyQ0lHbmpKYXF0N3FtVXc3TmdGajRYL1l6QzRiVUpN?=
 =?utf-8?B?bG5icGxwdkVzUzFya1l6bitsWFlUT055K2hmWk1ESmN1bTFib1M0T282cnNs?=
 =?utf-8?B?ZFBNYWg2aDc4Z2IxMmhTY1Y3M29GbElGQXd3Tm92a254RGc4V1VXL3hiVngx?=
 =?utf-8?B?OFZLUUZlVDkzek5hcnB4ZmJjMHFtVGNyN0Z5L1hTc0V3N0ZuTXN0L1hGSWVK?=
 =?utf-8?B?UFAwZ1Mxc1VoTi92K1lSaFVCeEZoL0ZTdkRRMGtkbFNFN3RXR1VIRjJvWTJI?=
 =?utf-8?B?M01kc1N5SGlSNmZJYkJ2RFBBLzRHazlKSE5CTUhyOUVBN1I1OGdENkVjQVpz?=
 =?utf-8?B?c0J4UlhwOHdwbFlCUXdFNjdMU2h5L2V1d3BISkhGb0dRNkRqaGVvWU52Y1k4?=
 =?utf-8?B?czg4a3I1YW52NTJiOGdzSWlNUFVtY00vVHFrZ28zZDhsTEFnejBLLzU3QXY2?=
 =?utf-8?B?YXBLS3ZOdUdKWVoyaTVtejFoVUxqdXdkUzB5WGRydEZhRVV6elJyOCtlMWpp?=
 =?utf-8?B?ekdZN2FON2JVWng5M1BLb0puam9OL0UrSGVsUFlleWJ3djJOWExkYWYzZVZR?=
 =?utf-8?B?TkU3azNOVFVyUnRXeHJiL2RsMG1kL3lNR1hsUzg3a2lxaVk2R1Uza09SNW9N?=
 =?utf-8?B?VFcyTXRNTzZ2K2ErNjJsSzVITjNiL2d3Ynp1RUEwM05OTDZKak5OYlVYZzFn?=
 =?utf-8?B?blM4Q3lYSmpBWko5RTVJdzNyaEthR2p6YmRIUEZxWEhLUHNXb3M5c1pQN0c2?=
 =?utf-8?B?aEdqNnZ4SkErMHljRDVxTjJXRDBHVTJZMlp3dGtacTB3aDhEdFcvOXBSQ1pX?=
 =?utf-8?B?YjRVTUxlMjNVbUJNdE1zbkNpMkFQN2s3SjdMbndPU3ErRFVhdjRTaUkwQnR4?=
 =?utf-8?B?Q0hmcGNNZ0p6eUl2Ym5JVE9EbjFSUU4wQW10UDhLMWI4dUJVZXh0UG9DSlRX?=
 =?utf-8?B?YTdMSm16VjE1QnZjRTNLczNWMjF3OVJRVWtJUVpDY3RjN0oySVZGMkRkd1M0?=
 =?utf-8?B?L2RDNUgwaWV5V0dTa0dGblRZUUtscURxTmdtQmp5UHVFRjRGNGpEWmtvc09V?=
 =?utf-8?B?b2tMMUlpS0NrRkJxeGVzdmplRitGN3FUQk9Vb1RNclpIc2FTbmtabGhDeWxC?=
 =?utf-8?B?eFVkVkRqdE1XM0h0RFdUUUpXV0wxbmdWWDUvbXZsQXBGR3NXamVRR1c5eEpv?=
 =?utf-8?B?T3J6dWNpaVhFRERmSkN6ZHpmOHVWQzhlNlQrV3MxUHVzekRaQ1JvenRsdk5E?=
 =?utf-8?B?cmdmQzN1d2NNelZmTlV0MFpQd2ZQeFJmN3crUnRXSnVGNG9YRnAvTkpUMFJp?=
 =?utf-8?B?bElBZ3hSUmxqWWZHWGd3Wmk1WHU3OEI1YklLMUxybGYwNkJMaERhakFqVTUw?=
 =?utf-8?B?eHcvSVhta3pvZVlQa0wvWWxUQ0JFRGVlZEhIQkd1SUFrZEFDT3RHbG82bmFw?=
 =?utf-8?B?cGlhWWVMbUhxazBiNXBlZVM4MTJ6RDBvSEVRM0FjbEgyakQ3ZXp6aEtZb3N6?=
 =?utf-8?B?RG1EdTFuUU85SGcydHZaTmdOYis3bDEvL1BxY05XL251WldjelFJOWRST0l6?=
 =?utf-8?B?RDVMYjZ1ZVJkWVByVWoyUFhUdjIwYjBqdWxZNllhbjNpaFlGMUM2ZTVJWk9n?=
 =?utf-8?B?R1E9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 11cf3bde-2e5d-4c30-40b6-08dde4850583
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 09:43:33.3413
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azQ72Z1jXJvxIPsy6iPsIpNxvtmXnxfSK9kaKga/feTAeOnZAfNKRMOjPP5CGW455yn+Wo49ufBgF8spt5YhBpATY2cXeq4X2iTtRhw/CiA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6312

On 8/19/2025 5:51 PM, Ilpo Jarvinen wrote:
> On Mon, 28 Jul 2025, Yen-Chi Huang wrote:
>>  static struct platform_driver pwec_driver = {
>>  	.driver = {
>>  		.name = "portwell-ec",
>>  	},
>>  	.probe = pwec_probe,
>> +	.suspend = pm_ptr(pwec_suspend),
>> +	.resume = pm_ptr(pwec_resume),
> 
> These are legacy handlers, please use .pm under .driver and the macros to 
> create the struct dev_pm_ops.
> 

Hi Ilpo,

Thanks for pointing this out. For v4, I have switched to .pm with
DEFINE_SIMPLE_DEV_PM_OPS as suggested.

Best regards,
Yen-Chi


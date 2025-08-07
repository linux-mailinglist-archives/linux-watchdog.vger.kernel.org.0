Return-Path: <linux-watchdog+bounces-3984-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF4B1D524
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Aug 2025 11:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E1FD72644E
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Aug 2025 09:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D417427877B;
	Thu,  7 Aug 2025 09:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="mGzY9247"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023076.outbound.protection.outlook.com [52.101.127.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB0263F36;
	Thu,  7 Aug 2025 09:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754559929; cv=fail; b=AkLgt2T9X+nWucJ/Ri+E2gaXI5NcAwHm+PEkjkNQcgzyVhEUnsngx5BB+sz3wUysBmxUME+pwfxUneTAKoyRTRngdOsJQYeyDALCECuArNeMJBMjCF/26F9KWpPOISpcdq+KMJy17zbmZ2c35xHbhJX3hv9AnHCFxxhsiDoSkkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754559929; c=relaxed/simple;
	bh=yE4qDjXEjz3uEZvKIwuBrUjYQ3Ob22Vx40d9o7ezNvM=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HoUFhjHmJzlZcOCJ6xX45JT3COI9hQcTOy9HKolrt6if2fGMnsF9lJM281Y5eEoLsuiarU8pfJ7IW4VkfrX5NbRL1g+qfX47JuYn3K2zwgCSXLfVWOmHNoRR1t6cKO5gl3662qU1+PsIZMmRIhPBxMoU8yCLOdVxzObRFEQvxI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=mGzY9247; arc=fail smtp.client-ip=52.101.127.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7cBTnWmle3g45nDlYyFXl9SUJVXdMrhOr9WNY4Ev0GP3KD9pacc/lYfaDdgWXfS34GjFNbz6u1b6vNLRGI0o3bymi4BQ9rKBmOeTS4yAVIB+kye3eMFro3aV2u1DRnIYlq3RemJScCCr425Q+TFMHuPm4qrbDnPGJh5JVZyIiibcpc9cnTRQZXMwtlT7WaubZ9iJHx5p4vUiz8Cgaa7YFo2gJk8tiokqBkGvq7uXspKgTz75ffWqEYZE7yvA5WZfhJE9sc68aiOJSp8VTIljxClJxMVW3/qy0OrOIAnpZ0Pj0leQtIttwvvLS+1QZiyUkPGOJO11CxiaK3/2BimIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VV5S2nMr1i9MJjeY28uZgE+yVbphEEIiA+MsmFNOWlk=;
 b=PPJYYFQYg/KfH2e43jObphIZE5lzMiIw37BWXNSfMX5VrBGB9r+W2e3D282F+TUh7yMyei/aLUPP1oAclXFLtXlnFrMdAXctrB3aITY/DeR8oB9lsDDvZIZrRSwypvL6lCUG/XZsMhPPb5JUtO9yGCxfJmn6lu0d8y/hiFGfADu1HBNqWnfXCgMLSjajm8v+ThYUKTQzM4KWWsm5m/ETr+Dn8WpZQcG5OJS9nY+MkuzKsxlR2wedc8bT/+ijnMWJahNvnQ7JYPjUa1upOm2r/W31HBDG1k8aTpgLhT1JhdfwNOrTN0MiDYn1N6MD3Zhuu1WeLwXWvTozv6qt5CPSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VV5S2nMr1i9MJjeY28uZgE+yVbphEEIiA+MsmFNOWlk=;
 b=mGzY9247g0GQamQTReQy9y/xyv0p+od9251NqGAiCrzgDPr7BehCu1+UTlYWQzk0JE+EUx6S/c3R5AqQGGilNRG6Mr3DkPtr7X37ZP9NASNnmimdqHLkLnQS32OL7/6jsilH59WEJ6F3GqRijinir6VOm47wgj9VtdZnGCraPsfSJfovJ21yj9e7ty+ScvVka93s70ViqEepswMZZtdo6NWqNHj/ao0tQ+yOLlylHUlwVkOJhbhd2O/f66x/7xJZ7fF4ajhs6jfqmMXApFDdg0VFbVUnKop3drwUpPmAF40Mwb2t4HOeft5I0TJKla3RZP2CVmykL8QOqJFrWA9mgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TY2PPFA55642425.apcprd06.prod.outlook.com (2603:1096:408::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 7 Aug
 2025 09:45:20 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 09:45:20 +0000
Message-ID: <24439698-ac81-43b5-b808-e912954f573f@portwell.com.tw>
Date: Thu, 7 Aug 2025 17:45:16 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v3 0/2] platform/x86: portwell-ec: Add watchdog
 suspend/resume and hwmon
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
Content-Language: en-US
In-Reply-To: <22148817-aade-4e40-92b7-dcac0916e1ed@portwell.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0050.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::12) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TY2PPFA55642425:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f30129e-fd5c-4684-368a-08ddd5971f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1M5WVZweThkaE54N1pMN2N2UDFDaVZsTWtLZ0ttS3c1SU9DRm42K2I5V0Nk?=
 =?utf-8?B?MWdPajRYeE9xM3Z6TFRUUlNiRWp0NUdwcnZBMmcvM2V2VFVsYncvNy9JWEhU?=
 =?utf-8?B?dXNKTGR2cWMzdk1LL25Yc1RaMmxvdVA3R2ZlM0lNQjFWWmtRRmdRR1JVWFlh?=
 =?utf-8?B?Q1NOMktQSm9JU3U3ell0OW9Wc09haForWWgrSDdINzZkS3B3c3R0dEtMRHli?=
 =?utf-8?B?NStCK3BVMy9mTUsxd292bm5hdTlueXpYQmlCV0RtS2J0KzB4QjlyVzNCR1BZ?=
 =?utf-8?B?UGliRzQ0MU9yUFhCWitJRTVMS0RuM05MSjVaTGJLKy9yckltYmdraVkyalVX?=
 =?utf-8?B?RWxzVHdIM3preTlaZzlyT2VNZUFiSjJNV1JHZWU2Z3NBOExMdHpEM0ZiS3l1?=
 =?utf-8?B?dlRhUFU4Z0Z6ejdzZDRFbHF5Ui9ocTZBQnhUOHc2Smxqb05rL0Y2QkhQSU8x?=
 =?utf-8?B?YXNOTnZPTG9VWiswL1h1MDdMV0ErS2xMYjdwaGs2d0d4N2gzTE9uOUNkeXQ0?=
 =?utf-8?B?U1REUU0wamluRzJhdXdZdE5hbk1OM1V2S2M4WEg5M1E3UzJCNkFHbHM2S0Jz?=
 =?utf-8?B?b1d0dXg5RVYxdmwwZjB0VjFyZHdJRUw4VS9qckNvL3lpS0tYZ3U4Q09ZY2d2?=
 =?utf-8?B?WndqSDM3UFMvWGhsc1cxdTk2ZWFaMGt0VFRiUGkwZVRBdDNHcWpUeU93RVU2?=
 =?utf-8?B?cFo2b1hCeWx3N2xOZUlqRUVOR1hqSmt1c3BzeXh3VGEwNmo2eTVZdGtoKzNj?=
 =?utf-8?B?eW9sYW5vR1B4VlFXWk5qeTZMdy9CTW9VMFdhWVBDNFBJaVlhVUJPdm8wd3cx?=
 =?utf-8?B?bmd4bTBRSzYyWmU0UFBNVXhERkVpb3JVaUd4ZE1NZlR5d2dnQkhzUkpJRitk?=
 =?utf-8?B?TnpvOHp1cEpaOG1talVEYlhoTmt4WXErYjNmV3l2M1VNZFdVQ3pMM3IzSlV4?=
 =?utf-8?B?cjlObWdMdzczN0RlbHhoNU95MTBER2tvOFJQbnZQcWl0WExCbUtZYU0vUklS?=
 =?utf-8?B?cmhuTlJUZ3BCUmJJK3YvRmNhSzdMME9Uc3ZxZ3Z2NnVoakVvVHVmMmtqdHNH?=
 =?utf-8?B?TEptZHJ2SWw1bm12UjExeHBhMlRlODlEa1NxTDhMVlVpNHBzaHJmazh3UGZ4?=
 =?utf-8?B?NHJXM21wdkhpZVZHN1dsUHZlU01mUjhTWFFGcFNOYXpJWUJwRDk5QmJIRFJ5?=
 =?utf-8?B?aXBmL2Z4S1dueFZUWmlFb2JuTWhHYmZNS0hjeGNLQmhGYzFsMWZPeXV3TmxP?=
 =?utf-8?B?dGlUMUtPTDJWYUlMMFQwUnVRRVhVODg3ZmZTODJNVUoyMnJuSDZZdUhMMVdN?=
 =?utf-8?B?TzBzUFJCV1FIcUovRXRJelVxVVlEdUpuYVJjMjBDaXgrLzM4Qm9Pb0dCM0NF?=
 =?utf-8?B?emtBVGJjTW5zVEZqempWTXJGWHM2SHFta3N6bU1JTldIek13cFA0ZThXUUM5?=
 =?utf-8?B?N3ZieDhodkVNaEgvREdCcmJKa1dSSks5RWk1dGtjUUI5YVZVYmZkeWtzQTFM?=
 =?utf-8?B?UXJQZG1kK3BYRjNYaElnVUZ3ZEVZdnh4NDBzVnpGK3VjSG52dVVUVW9SeXZs?=
 =?utf-8?B?Z2hWUHZlWVE5ZUlPYTYvWGppRWgvdlZyWTl5WkQ3ZlpuckZkL05hU0w5ZEhE?=
 =?utf-8?B?NVY0akRaVE8vSjN2YXRHRzV4TUdZQnJpQjRUMU85eGtrb2kyM21BNHFVS1Ny?=
 =?utf-8?B?NmdmSDhpU2ovbDB2Zmx6enY1OVVBRXZ4cldueTRtUlRQMFRkbkNhTnBrV0NB?=
 =?utf-8?B?b1pDR2NaYnlEeXI3WnR0OVBxUnNNUDAxbFMyRWpRbWxyVXdCZ1lTTldVK1BT?=
 =?utf-8?B?Ull2NjRQcDZBRmhCSzRBWUI5ZVNYNnlGUEEwODh2Y3FpRUVObmhCYUZ3aXZV?=
 =?utf-8?B?Vi9Qcm5RajlEV2N5eUZNbWVlMGFUWk5LSVVUWjlodXJNbnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGs5N3VROHp2RTVQSWp5Q1F2c0Jra3RwWFN6Ylc0UWZiVU5sRkZrNkRQTHFs?=
 =?utf-8?B?V2IyQTNqMWlYS1NndHliMXRjM2dPWTVDK3ZHNU9tVFM0K1EwbkhzeUZ5OUZm?=
 =?utf-8?B?MmMvMlBnRlFYZlF4bk5tV3g2RGQ1cUYvYmlxVFl1Y29XYWpFbktxdlFTOWpv?=
 =?utf-8?B?MnBtNHdiS2FrREs4WUFCZEhxZ2dZcTZmVCtBaEtvM0puNGY5WEpjUnZPdnY1?=
 =?utf-8?B?MVNud29ZTzlvRU5OTm1RbE5sQnFtM04yRTFtSFdabkpPeFg4ZWx0V01jTnBl?=
 =?utf-8?B?Wk1ObFRIOG5zNlNLQUNDZFovZEJDNi8yemc0T0pZN3B6TldmUUxtU21VTS9I?=
 =?utf-8?B?L1ZYVTFQazBkZzB4RkNXd2pPenFSQXRudXN2bDVSQ1V3dFRsUnB1OENlcGRF?=
 =?utf-8?B?c1RSbVpqLzdnV0VZY3hJTEwxaDhuWmMxUTYxQ0U5QW1NVW9LMUlNVm1KbC94?=
 =?utf-8?B?TDlrRytIdlFYdER0ZlRWUGIya200Z1VUeFRRblJkcWlhejZZRXVmcDh3RXpu?=
 =?utf-8?B?TTIwZTVjU2w2UWpBWHU5YnN5SW01M21RMDJjSEx1V0w4cjd4T1JXQzNiWWpp?=
 =?utf-8?B?UTkvczVrRGw2WVpIRncvNFFYb3hCc1pFRVBqSnQxanJ0YXJGQ3NZeklrMHhp?=
 =?utf-8?B?NEVlK2xJdVovY0FXV0RlMWhCQmRkRXRWaXlKaS9iVnNPSVFHK3ZOdlNTYm80?=
 =?utf-8?B?eDFXTlQrMS8wbFZKNnc3cjYvdEdqUWNBOWVQMHMyenRtMlo2cDVGKy91UTdW?=
 =?utf-8?B?SUdpVUVWVmZFc0FLWG9lNnV1ck1LK0NMVE00alM3aTFJeUh2eHpZM0ZuRnI1?=
 =?utf-8?B?NTUvVzVkWkxWNnpBakEwUlF4bHhLT1hmY0wwRGp2b3pQbXFEV1lqU1h4cFgw?=
 =?utf-8?B?dm5QdEFOSWhVbG5kQlJ2aUw3S2RJL0hQT09GMEszdjVmbUhCTzUvS0x0Y2tG?=
 =?utf-8?B?MmE0UmVjcTJkKzZpNUs0YkVxRzJiaFQ0Ulg1Q2QyTFo5SlRZaTJaaDlhKzlq?=
 =?utf-8?B?NUhSY0hNd1diOUQvQTZ1dUY2ZFJGTHRxTGFweEdiU1JKZHQzSVBBc21uMFNX?=
 =?utf-8?B?K3pnTk4wN2ptZFZFblEyUE9GTklDa3B3N0psR2NDemdsR3lOTHI3UDVvcllU?=
 =?utf-8?B?djJhMExYYWhuWlp3dWVGZlNqSnpHcWpEOWdHUmRGOFpTK1lFTDM4V1hVM2NZ?=
 =?utf-8?B?c2JIVXg4eHpIL090VDB2S1ovRkVRN2FmVHRsN2ZjeDhPYlRpTDFoUlEzLzFt?=
 =?utf-8?B?bDhuNHdrcmg3SWJWdkxJUnpaaDhaMVJBVkNmSG9oeGd3a3hNRVk2dmtmbDd3?=
 =?utf-8?B?NG8wWW1PekMvQWM4RXBOdjVPNXJmcm8velpzR3dwVkJsSk1Yc3Z0SHFYOGRT?=
 =?utf-8?B?eE9wM2dVcmlvZm0yYXJCQmM4UjljNyt5TklUQWdianRTVFJqL2JpWTRmeDVj?=
 =?utf-8?B?djkveUM3NHJ1M2J1MVNsN0EyU0ZjbGtHd2s4NjNmVWdFdFJGNDZONGk0Q2ln?=
 =?utf-8?B?ZGZGVXpMTXNqZFB0VDZUTmR2K2p4emJjeDduV1h6eXhNampjRy9zR0dYM084?=
 =?utf-8?B?MGNqdFVkT3VqMm9LZFJkUnl6RE5xNUhjQ293TURuQUQwRit2MGhuZ1VHOTVE?=
 =?utf-8?B?VzdwY0lPNmkrZURQRW1Vc2tWVGQ1VnZjUlovbWFyd1dsRndxS24zS1V1cFQz?=
 =?utf-8?B?SURQVGZWV2pQblU1ZGZoVUJGSmh6UjFkNFdiblNLMy8wVWRDSGQ3MGpwOGtP?=
 =?utf-8?B?eG1JdXprY0lIdStLUWlYdk1MSERzMVFyWk1xd29jdXNNTXc5SEpxcWY5Nmdt?=
 =?utf-8?B?L2E3QllMTFg1bVRlK3Zxa0RzR24wRzBwYzFwUnYzVXlNelN4KytDbjBjSVpv?=
 =?utf-8?B?TGt2Wi9zSEViNy9NMEF3dmZ0VktpMjNONEpJUGpkajN2eEJrUFB5WjlZZ2k0?=
 =?utf-8?B?WXlGWWJKTEI3N1VFNmhPVEUxRDdEd0JpbTUzVVYwQzlqMHpSV2pBTTlGOUZL?=
 =?utf-8?B?L1Z1WFVKR0tTK01Nc1lOZ3pBQWRFSk5wOFltNWdYbk1yVFBpVmdKTnlhOVlX?=
 =?utf-8?B?bE1ZSXl4UW9FU0dmVmRPSXd0UGx6SkI2OGNzbzFlWkZqVXgzdGdGajNxSWtn?=
 =?utf-8?B?YzhRckxSTzZ0UllBbEtyVExobko2YU9DZzFTdHBiZDI1ek5pZ2FQcUxOK3RQ?=
 =?utf-8?B?dmc9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f30129e-fd5c-4684-368a-08ddd5971f62
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 09:45:20.2674
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/IeYH8l+lV1aKCLv+qao5fVkjek9SBDWkIvk+J7Ta5AX7NOUkoGPk+alPfiaqSoCREvkqotTejcA7wqUiyLpXgV7KXMbC/bKmaZxrhZqHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFA55642425

Hi Ilpo, Guenter,

Gentle ping on this patch series.

If patch 2/2 (hwmon) still requires further work,
would it be possible to apply patch 1/2 (watchdog suspend/resume support)
independently?

For completeness: I kept the `(void *)` cast in `.driver_data` because
`pwec_board_data_nano` is `const`. As discussed in v2, removing it triggers
a compiler warning about discarding the qualifier.

Thanks again for your time and feedback.

Best regards,
Yen-Chi Huang

On 7/28/2025 7:56 PM, Yen-Chi Huang wrote:
> This patch series adds suspend/resume support for the watchdog (patch 1/2)
> and hwmon monitoring functionality (patch 2/2) to the Portwell EC driver.
> These changes enable better power management and sensor reporting.
> 
> Tested on Portwell NANO-6064.
> ---
> V2->V3:
> 
> Patch 1/2:
>   - Unchanged
> 
> Patch 2/2:
>   - Replace hardcoded `1000` with `MILLIDEGREE_PER_DEGREE` and double check
>   - Fix comma placement and spacing coding style issues
>   - Simplify pwec_hwmon_is_visible() with ternary operator
> 
> V1->V2:
> 
> - Added watchdog mailing list to Cc.
> 
> Patch 1/2:
>   - unchanged
> 
> Patch 2/2:
>   - Removed `msb_reg` from `strucit pwec_hwmon_data`
>   - Updated `pwec_read16_stable()` to assume MSB follows LSB
>   - Moved `hwmon_channel_info` to per-board data and assigned it to `.info` at runtime
>   - Replaced the `pwec_board_data[]` array with a standalone struct
>   - Replaced literal `1000` with `MILLIDEGREE_PER_DEGREE`
>   - Removed unused include and sorted header includes
> 
> ---
> Yen-Chi Huang (2):
>   platform/x86: portwell-ec: Add suspend/resume support for watchdog
>   platform/x86: portwell-ec: Add hwmon support for voltage and temperature
> 
>  drivers/platform/x86/portwell-ec.c | 193 ++++++++++++++++++++++++++++-
>  1 file changed, 191 insertions(+), 2 deletions(-)
> 


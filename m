Return-Path: <linux-watchdog+bounces-4155-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29717B41214
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 03:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C97560156
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Sep 2025 01:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3E1D79A5;
	Wed,  3 Sep 2025 01:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b="YcIQV+av"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1121.securemx.jp [210.130.202.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1181749
	for <linux-watchdog@vger.kernel.org>; Wed,  3 Sep 2025 01:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756864248; cv=fail; b=pJwwa3I0QXoJGcWOfUxBgwabvKiorE9u5gxk3FFghtcMLP1T4md/89ulLXDOjwIS3p9nOMqHzlQk6304EeQbVwBO60TTMRlrfTCuP3qvXeqCjZ4qErZDw+feBVhqHO+YP9XHL4Dmk/xBTtupMOIzPlZh7rJ1ny8+zQLek/hS6nE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756864248; c=relaxed/simple;
	bh=wHoBHaMb3wTtOPZxNj/o4FDw75ICtXrcHYeXNmpv/zE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NCKp6a9RruQPBcSeH91TjcP4JYdn2jM7oSxyupLkXgHnH7RxU+v4mosPgdq1JtXTOUZeIu6MrhbzrmW203rWtYfgLm+FeofbEUvJ0G5epxsCpbZCcjqsw5sGS1cLyXYWpoRFGAZiuEnzoVdRVZd5uKvUAfoupFZwc1DVG5bcIy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=nobuhiro.iwamatsu.x90@mail.toshiba header.b=YcIQV+av; arc=fail smtp.client-ip=210.130.202.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1121) id 5830F9Sq3705046; Wed, 3 Sep 2025 09:15:09 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=nobuhiro.iwamatsu.x90@mail.toshiba;
	s=key1.smx;t=1756858460;x=1758068060;bh=wHoBHaMb3wTtOPZxNj/o4FDw75ICtXrcHYeXN
	mpv/zE=;b=YcIQV+avjS4T/VwjyCbtZl1lgjSSH0K+FTTpkjQmvVKLZ8etXJyPDNeoK5MuY/alVT9
	+dwBUD2qQGyclB9uq7a/aFcCf3HFQYou4C1b8Y8aUxwFM20/4AkUgZEEvoRifgrW6/BJJBKCE0BMU
	DMC6QO3jg00x26UGly9TKwvvmvzsQvK/s5tlm6VygLnnsfM75kHeXZVnWpM93YOWw+wDHZMU+uHJA
	6ByzmK4MombrJBoJjkOu+pLsuQy0Wqy123xiq+e+j+apBfT48xk9fPSCywakLsekrOcYAjo5Osy77
	TH809EzGpvDwCmwHGkZ0L820hcYm6zQZjg3wtLet8qKg==;
Received: by mo-csw.securemx.jp (mx-mo-csw1122) id 5830EHlx2044769; Wed, 3 Sep 2025 09:14:17 +0900
X-Iguazu-Qid: 2rWgrrz1nRng6MxW34
X-Iguazu-QSIG: v=2; s=0; t=1756858456; q=2rWgrrz1nRng6MxW34; m=TdE0wluIWRwvhLN7r9isGhZGrSlnxfunLKlADzOVj8o=
Received: from imx12-a.toshiba.co.jp (unknown [38.106.60.135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4cGjlW5sp0z1xnZ; Wed,  3 Sep 2025 09:14:15 +0900 (JST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyTeU9T6yuO8G5TlaGPNgiqZiZCt2aG2yN86aaw0CL/P2j+TZmCeXcSsd6qnye0VgSVfPR34zc8vDLtLMEJGg8UoLcmHGlavTlZg2Yskdd2TzqgGV1RQes2ZjYwUEwtvYtF1djT3ML3goZlP/8BQ8VVYC3w0ENHvUX939i9eJx6iwSqmiFmT+PzTvgqEkJOD9CAM/0HbDeC+vSlJ8U5PEtYiwgQo8/zCUDGTV5XqWM++DwhpZPETybjB1fHs8cDgnPvQcwKHv4e+5b/RanNHMS458jwU824G+I5jyK957wywbXTgKdanqtQD/tF0KNnSkYb0cieyOjaWT3cV8T+pAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ey9xtORR265JOPZk60Nu4X9Gvkpkj2jAPJ1pyJrrVhw=;
 b=tbxJUMeI/Q5fHTiJgVD0iJDEhX1T0BL/PeA98kt+VM49nivPdDiM5G6c1QZtj8rcsOzAJUBajn9WSouCdtAAM7X//Mi8jBMf7/dg1N24Lf93wfa3Fj18TOP3Hco/eTI1E9oDzTMZUOl7o90OXbcK5N/zi2lP5QPT2ygH/FfTOk0Jw9B0KyxvzcvJK9o0it0I+UWd/4zCaD36fgiNnNG18205+GbQUcUHdUouUgijl1dAMxPFRk8ZELbjWm4gnvvC7LCRmh3rjeWDGoLBsZ/7/HDUgVrZyinCJi/5QbmPLGfkoX8vnKgLLLjTlA4Czbo8zqt3+30VUwpplhMrZmw4Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <nobuhiro.iwamatsu.x90@mail.toshiba>
To: <wsa+renesas@sang-engineering.com>, <linux-watchdog@vger.kernel.org>
CC: <wim@linux-watchdog.org>, <linux@roeck-us.net>,
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
Thread-Topic: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
Thread-Index: AQHcDIVSKkLyYGvHnU2OilDfoBTzybSAtdLQ
Date: Wed, 3 Sep 2025 00:14:12 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TY7PR01MB1481808EE139CEA836D4775B4CD01A@TY7PR01MB14818.jpnprd01.prod.outlook.com>
References: <20250813190507.3408-5-wsa+renesas@sang-engineering.com>
 <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250813190507.3408-8-wsa+renesas@sang-engineering.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY7PR01MB14818:EE_|OSCPR01MB14438:EE_
x-ms-office365-filtering-correlation-id: 6cf09e3e-9a95-4860-0953-08ddea7ecf8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-2022-jp?B?MVRBdFFnNUJDUTBFcStaY0cvQ3lCNnB6QjhYRy9SS1NsUUp1ZklSTk5z?=
 =?iso-2022-jp?B?U0gzWW9DbktYN0FHeG0vb0JIUjRHQWhYMElLa2Zuc0hEbzFvZDRDRGNx?=
 =?iso-2022-jp?B?emJPTk5YZHZKZXdyOXgzR2JVNlREeWFQNWk5TkY2bmJqTjJ5ODYwYlQ4?=
 =?iso-2022-jp?B?NGpJTkJ2eDkxczFwNnIwTDZTK1Rudzgxc3Y0bCtsZlB5VThMM2ZJTEM1?=
 =?iso-2022-jp?B?YW1vSGRtbXNVUU9VVzdZNVE3VDFTejFidjhRcWtqbUN5SXBUWkhrNHQ5?=
 =?iso-2022-jp?B?d3dIeXlpK3BWU2hjQSsyb1RNcVY3SGdvdHJRL1EvSnNuVWtLUnhlQWlW?=
 =?iso-2022-jp?B?enovUzZvQWdnSjRoS3JteWxwOWFDaHNHc3hYZ25DSUNDbXgyaWpVTUwz?=
 =?iso-2022-jp?B?QnVxaUNuZVVlZ3V3b2hpdFdVcktYUWpWSDBzQlhLSUdTUzZUbUhobmNo?=
 =?iso-2022-jp?B?MDI1RnZraGEwNHQ2UHljL1pnck14SnZjaDVWNXplUE85V2lCL1JYb1ZK?=
 =?iso-2022-jp?B?WTdvdE9aOXdmMTBiVDhwVDZZZExzS0F6VGQwSHNEWENWVHlVeXVMNERH?=
 =?iso-2022-jp?B?bXdyWlN1VXpZRm5JZEIzeXlhWnRYSlhPak9KamtmaHk2MGpsOTUyMjUy?=
 =?iso-2022-jp?B?eitqMkt2NHpEY0hmYU9WaU9idWYxMzdtWHQ4N3NxaDcybDJzckJ3MFhR?=
 =?iso-2022-jp?B?Z2sxdWRRRXI3N1ROQzJUbHh2RTBIVnhOajJpQmFuaUNBSVUycVBsZ2tx?=
 =?iso-2022-jp?B?NXNFRHpYWVA4NTY0NGl3VkhDNGUreGEvNVVDeWtCVm5PSXNjRHJTSitx?=
 =?iso-2022-jp?B?Tnl6UnoweURUbW1RenVJeTBhcWM0bS9qVTd6VEF3TDYxcys2ZVl3R21S?=
 =?iso-2022-jp?B?ZFQyZzlmdWNhSFRONGlQaEtMczFXQlRoTEluSk55M01FNnA1MTJuaFE0?=
 =?iso-2022-jp?B?RFhwQXdmdGltMngyNlRtVnMyUW9Ya09xUlJtRWRrSzNGOVdWUEZSQ2lv?=
 =?iso-2022-jp?B?WEVVbTlKQlB4aC9OSUhMODh0dktqSXZnTjIyUGdWTEd6QmtlQWg0NkNQ?=
 =?iso-2022-jp?B?Y21XNHlrdTYwdmJ2MmlsUlhwYWNsY0p3T09OcnlZeFhVMjBCTm5ZcS9r?=
 =?iso-2022-jp?B?SGZVd0tmM0Y5b0lDc0IzQ082dEpUNHdDY1VBTTF0UUFZQU1yamVnYnZJ?=
 =?iso-2022-jp?B?WHVKU2dVWUVYL0RoYkYrM0l0MG5saEN0anZ5V0J6RU8vZFpHOVZaYUVx?=
 =?iso-2022-jp?B?VHBEUHRjeTN2TWUwbGNhZFhUcFZEUEJGUXRZK0h2SVVnbHVIT1F0K3F0?=
 =?iso-2022-jp?B?QktSdS9jZG5Kcm5nVk5XbWZJc2dmcXI0UUVodTVHUUFKYkhDbmlzNjVn?=
 =?iso-2022-jp?B?b2NwSmE0aDdHbzVMQnpKTkpqMzJRRnZDc3FWU1Vxdis5aTl4U2w4Rm4v?=
 =?iso-2022-jp?B?WVIzY1hjSHh1REdLYkgvYnJqSmVERklJRGh1ZVRmMVcxaEd1cGx3SW9x?=
 =?iso-2022-jp?B?QktYdDF2VU1rUmRiZ3hEalZ5WlU3emNlV2ZBQVJGaVROYWlaTHZENlIw?=
 =?iso-2022-jp?B?aTFuaEFxQW4wdFdZNUowa3dCd3hkRDl6QVVlL3U3czVsYUlJdkc0djFq?=
 =?iso-2022-jp?B?MkdFejh1SnUzZGJZenlTdjhCMlhKbjBBWmw5YUM5emlWSko2OWNNRUYy?=
 =?iso-2022-jp?B?QVBBYmJDUCthY3ZoV3g0N25YRUttR0pCSkovekNFaEVJTTBWQ0ZwMVlH?=
 =?iso-2022-jp?B?YW5ER3ZEejMxYlRsU2ZiUXR4N1ZEZmwzcDdhVk9GcHVPSUdRNFpRZ3Vu?=
 =?iso-2022-jp?B?T3dWb3pGNTJYOVZmbm8ydERaL3BINTltUlNTaEtqczB1YTU1dGdNc1FF?=
 =?iso-2022-jp?B?eGhCZTRORG1CV0ZTVzNkQ0piMXZqeGtvMmpaUm0ySyt3MUViK2FRcWN4?=
 =?iso-2022-jp?B?d0FHd1pIYjI4NFN1YmRzTGtRV3pKV1hMZEtGK3A3R0hOQlROSjFqakdy?=
 =?iso-2022-jp?B?RW1nN2RCTm1sQUhOYVlwc2pLUXJWQVBKa0hWN3dqR09SMzNlM3hBWXNB?=
 =?iso-2022-jp?B?Y2I1dHFGNWdXMHJ3R2NjYUcxdW1TclNzWHFmbWhLSUhCckg4eXVyQjBP?=
 =?iso-2022-jp?B?TTV4T3BXdTE0cjljVXRoU3ljdUVOTmNnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7PR01MB14818.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?U1VSQjlLMTlEME4wbGNvMXhLV1M4L0pBWGtyaUpWR00yTXZRdmtXSEJK?=
 =?iso-2022-jp?B?OG83T3FZVllaby9uZzBhWWcyMStzVnl5bC9aQWhJOXVNU0Fzd2xSL1Vk?=
 =?iso-2022-jp?B?czMzanNyZHY1UGxkVmpINDMrNWVNaHJRQ1dPSHgvQlFaT0wxQjdJNElY?=
 =?iso-2022-jp?B?eFZhbmIxM3VrVW56OHlHTFZnWXlxN3RlZjJTNitwM2R2Z29ES3dnRjNu?=
 =?iso-2022-jp?B?dFJTZlNFc0tHQnF2dE02K2NuS1Z4cUNEamxWS0w3ODlrRlBoNWc4SzVx?=
 =?iso-2022-jp?B?YkJhYW44WFNXNnpEVUlCVEVzTi9EVGpVUGswUUVraS9EWWNqWkcrMGho?=
 =?iso-2022-jp?B?cTFCdEp5cVZ2MHlhTEhjYmRCa1R4RGxNK3gvZFMvRzJhVmNTYkxjeFlo?=
 =?iso-2022-jp?B?MkJrTUdMa0lJajJEWW42S0x2QzNLaVRBUlJTL3IyOTg3cHduRjlPVFYy?=
 =?iso-2022-jp?B?aGRabHBXRXNkdUw4TlBRYUxMb2xRdVo3TDZBYWxiT1M0dXFmUnlxOWlE?=
 =?iso-2022-jp?B?OVo3bFRmNzNWT2s3TzNHQWVvZUtnRTN3MW1qVFJ6RCtPem9DbmYydEg1?=
 =?iso-2022-jp?B?Q1FjWVkyM05SRVlOczFXdEF0OU9QN3lPbHFEcDlsZ2xJL094L0pUR1M3?=
 =?iso-2022-jp?B?bWV3eVVqRFZnZ25HSy8yRnEwSHlWU2QwcWl2OTBlb3M0L0loZURES09J?=
 =?iso-2022-jp?B?bXNrODdjMUloaTFRUUdMVHBTaHh0UUJRc3FFZ2ZhZGlKeVY3R2d4ZWpj?=
 =?iso-2022-jp?B?VHFHOWxFQjl5M3VrSFNkWVc0SmRVQld5dy94ZC81YzFJUWE3bnZCTW15?=
 =?iso-2022-jp?B?SWJRN0RiSVBRUG1MOVFjVXcwaFZGVDhzSXhCczV3N2RHOWRuYzFGNkQv?=
 =?iso-2022-jp?B?MFVRTDBFbXN0WXRxN2xQOEhoL2dMS2xQL3dmREROL0kveW1OcWRkRUdR?=
 =?iso-2022-jp?B?WEhLMC8zM280Sk1UbnRtamhDWmVza3pZRHk0bG5DT2p6WFh1UUg5NHBn?=
 =?iso-2022-jp?B?UDRCYTZFcnovaTdna2VNenEzdXk5Vlo5VkdZajRRRG5MeTArVXE4OTQ1?=
 =?iso-2022-jp?B?MVk3WVBFT2xPL3ovSUJpSG5tbCtlamFVUFloNjIxQmVsMXJhYURsb3V3?=
 =?iso-2022-jp?B?bWk2S2FyV1dvRFh1Yjg2TWdlQld6Ujcza25zb0RsdUVLMGlVdmpKK09y?=
 =?iso-2022-jp?B?a2tzUWx2ekJXTFJnSTZ2NDF1SWY3SzFDdU5vY0grWmZESEwrcjErck81?=
 =?iso-2022-jp?B?WDRjMGdvSlFIbnlKWjZmMC9uWkRGRWNxUDZ3Q3BpWURNRmpQUHVROE9T?=
 =?iso-2022-jp?B?QmNQcWR2cEtxZ0JSVnBVWW9SMm9hNTNKeWQxNUYxS3RGWEFKQWZvQmVP?=
 =?iso-2022-jp?B?aEZPZEhSQzYrQnRlSThsUnZpeWg2TFZZYmZVVzkxNGx0RnZUR2NFUkFu?=
 =?iso-2022-jp?B?MDlVMEtyMC9LYy8yejBNQ3MyMHFuaDdvSEg4cWEzVUNpN3VnK1RUYnBn?=
 =?iso-2022-jp?B?U3V2c1JaRzYvd2F0KzhBSmpSRmRaZnlFTXFjUWxkQVNjUG01SFhkUHpY?=
 =?iso-2022-jp?B?cmRqSEU3RU1QY3VrM3pPbjNVNm9DaEFQaU9LektMMHRzTi9vMW55ZmFn?=
 =?iso-2022-jp?B?RkVlc1BDdlRXblBIT1NxZVhIcUZNdGJxNVVKQlpPLzBUVU9adEVZVkRt?=
 =?iso-2022-jp?B?RDJxZWd0SVplMDNuUmR3NDVKZHI3MTl4WGRMdlIrWWFBNGZBU29zU1dp?=
 =?iso-2022-jp?B?YUh0NVhWV29MeEZleTVLVFRVcXM0SkgvWUdmbmFQT1dRRGxRWlFYSjl0?=
 =?iso-2022-jp?B?QnZMV1QyZzJoNnY3ckl6RGg0dFVNSFhINTZuTjU0Snhlc2VnUFFjck5j?=
 =?iso-2022-jp?B?aHZaUXZOM05ldzM4OFJXcGRhUUt4YWllT1JEam1la1VvUThNdVd6UTI1?=
 =?iso-2022-jp?B?eUJTUXJjNWhGdnFVWEltUmZtRVJwWitnWFR1RkRHNVJpODJIZmtzSHVG?=
 =?iso-2022-jp?B?dWVlRE1tZ3dCK1hjbmlZU2FaWTdTQmo1Wm9lSEZuR0pycEpwRWkyRDR6?=
 =?iso-2022-jp?B?eTNENmtBUUFLNk5XYXUybmZ0amtmSUZ5ZmtEWFZNN3lpY25DTGhkWWdC?=
 =?iso-2022-jp?B?eEJZa0FLYlprWjJ0Vko0UitzeTdzTTNLM1hDWXJrYjBiNmJDc0lXL3lw?=
 =?iso-2022-jp?B?RzJlTU4wZjdDNW5IcDhzUUZ1a3BMM2ZSR3BMSk1wVUFKT1d0OFN5c3Vt?=
 =?iso-2022-jp?B?dVRpQ2ZvZCt0OE5Xb0VRUGlYR0ZDanpEUlBVQ21HdTdPY3kwUDhENTZ3?=
 =?iso-2022-jp?B?SUl3YXRlRVNxZFdzRWJ6Y1pDS3JWWlFCZmc9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY7PR01MB14818.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf09e3e-9a95-4860-0953-08ddea7ecf8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 00:14:12.4950
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uCmVOJ/7A3lCJqkRxGRYiNOGm4E2RT3aDcB4K7Rylq2xznFlnu5Ko3zIkJesDobuznpTcu/9XiuGzgWa9mYHLJpsX5nyBXMwVXMReG9Ix+BwpSonjxPkf9l3suMbzl77
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14438

Hello,

> -----Original Message-----
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Sent: Thursday, August 14, 2025 4:05 AM
> To: linux-watchdog@vger.kernel.org
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>; Wim Van
> Sebroeck <wim@linux-watchdog.org>; Guenter Roeck <linux@roeck-us.net>;
> iwamatsu nobuhiro(=1B$B4d>>=1B(B =1B$B?.MN=1B(B =1B$B""#D#I#T#C!{#C#P#T=
=1B(B)
> <nobuhiro1.iwamatsu@toshiba.co.jp>; linux-arm-kernel@lists.infradead.org
> Subject: [PATCH 3/3] watchdog: visconti: don't print superfluous errors
>=20
> The watchdog core will handle error messages already.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/watchdog/visconti_wdt.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/watchdog/visconti_wdt.c
> b/drivers/watchdog/visconti_wdt.c index cef0794708e7..7795e7fbf67e 100644
> --- a/drivers/watchdog/visconti_wdt.c
> +++ b/drivers/watchdog/visconti_wdt.c
> @@ -118,7 +118,6 @@ static int visconti_wdt_probe(struct platform_device
> *pdev)
>  	struct visconti_wdt_priv *priv;
>  	struct device *dev =3D &pdev->dev;
>  	struct clk *clk;
> -	int ret;
>  	unsigned long clk_freq;
>=20
>  	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL); @@ -153,9
> +152,7 @@ static int visconti_wdt_probe(struct platform_device *pdev)
>  	watchdog_stop_on_unregister(wdev);
>=20
>  	/* This overrides the default timeout only if DT configuration was
> found */
> -	ret =3D watchdog_init_timeout(wdev, 0, dev);
> -	if (ret)
> -		dev_warn(dev, "Specified timeout value invalid, using
> default\n");
> +	watchdog_init_timeout(wdev, 0, dev);
>=20
>  	return devm_watchdog_register_device(dev, wdev);  }

Reviewed-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>

Best regards,
  Nobuhiro



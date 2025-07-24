Return-Path: <linux-watchdog+bounces-3909-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F54B103AC
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1F5316A3FB
	for <lists+linux-watchdog@lfdr.de>; Thu, 24 Jul 2025 08:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD1A13B7AE;
	Thu, 24 Jul 2025 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="VwS1Lx/7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022139.outbound.protection.outlook.com [40.107.75.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4E027467A;
	Thu, 24 Jul 2025 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346105; cv=fail; b=Tq6BEq6KXAfg2StOqtZnrnfqOZoxwoNQx/rx0I8GVj7GJWaF2EP/w50aIQ1fETlnQjJTmrHUaDnLl3OFlG8cQI80TQRzo1YEzGsl3rK+DUforxDgj+/AwWN4eIEY7luYfln3UZsoTRoRFA8apwdi2tPhbBUzw4fTjVMW+R1/t/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346105; c=relaxed/simple;
	bh=vlsb2w76lycCP+8yE0h3/LLuPqIauwCas4HiLtug9D4=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SltuRaoA4qIhf8jSSluXvR7WIFw2PFSoxxXwz2w34mRhFve7Plvd1jfJ5wNKqcEM36weteL3Fu/CTkd+k4xnYGbBsh1bcJhJR7y+PZDMaKBiALbNm7E/8RSyWKBzBSArdHDQ9SJI/B2JzJ3AuQo5NTO9J4/BiMYhdgPw7N6w1d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=VwS1Lx/7; arc=fail smtp.client-ip=40.107.75.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzo28fJVCX511hhWCNc4JLHqHj4CN7pRdR/NwJ7hHKz/Mfswgjmkyj+88hKT5dZpO4qBPXzgslEUkgBqAtnk03K2vTNSDp1PQNck+NF/s8KneN8dmDEQBhdlz7IpaZxFI42B7EAFPSWqYyS6NBlOSwKiNSnOS0KIP1Jbc7nN8W/S+vwGS0KJd/258vKDjXWe0n33F+nJjaXX8nm/ra1sTmYa/WwKFh3STyfkTwnBugi7Ev6hWtnGxHMgaO6fFCOlUWRIS5ar0ezW31hI9cibaNDLlM7mWwzhL610PelUiTHilNybl1v2HnhgaXbM6s7uA+UjVZhIh7Mas7/KIwwCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uo/H0mn2/xQ0v/LeoAFSEC4a8DJ5n+K2OASzQ+020DY=;
 b=a3Mx3CnvkxMPUooN9+wDedrkuibakgYZSmynv+JhT4EvTCQbAWjJNoDfrLQs4P6ucZ4V5Nte+dIYn12oKu3YoLG5BLe60j+pfI7CTsdC7b1MB+LjcMveMYSN/M0aw/F3/2W1sZnM8S49mog/jgWoMfLzq7e5CVFhBAxlZ9mvgwrKs7GznCCrYMhkBo1k2XHkDzhTjbi7/kdG6zUKBR7VOmwYCkU7RAAEW1pohwGU2mfvQaOHSzw3nFmBVRZ3pEUCAawte1CiYwac2xZdvbclZ4czfnzsc/mySnEW7jVKnmoci2nzN33/f0CQoeMDtYANz9am06YozjMCRkZuO5buSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uo/H0mn2/xQ0v/LeoAFSEC4a8DJ5n+K2OASzQ+020DY=;
 b=VwS1Lx/7rvisYs1mIRR0nGzxPBf9+JhCpwkYMmrnVqFmoaLxBg7970VUACQrtpG9MCIHnJv/kwT2yAguf7xWBhDGrqBq/2eHGLuc03tDF6WcxbNUriBOmJkKzbWRxdPlhs+R88auLb+2COx9bWjzr2lXI5bp0NMoy/KYs4MarMckeoxIO6d2kSIHvj5hrzMrB+9s7ay6psyrdaudpDxJka5V8DksfTv9/MGnp1nRxwErROpcVDXgcFYT9w2maCa29PugC/yR/59vahmta0DHD9A11sVzInqhI4f7VLsiOK6jPTVigwA5MwqBEB5sGPrJs4A+26lElSNR7cLQsytIIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by TY1PPFE6916CAC0.apcprd06.prod.outlook.com (2603:1096:408::92e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 08:34:55 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 08:34:55 +0000
Message-ID: <e5acefed-dc7d-490d-a795-230fdf3b312f@portwell.com.tw>
Date: Thu, 24 Jul 2025 16:34:50 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: Re: [PATCH v2 2/2] platform/x86: portwell-ec: Add hwmon support for
 voltage and temperature
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com
References: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw>
 <a961ba6f-4c4b-4f60-9804-2736a3d239d8@portwell.com.tw>
 <41ed7342-a465-16ff-8283-29f0faa64d02@linux.intel.com>
Content-Language: en-US
In-Reply-To: <41ed7342-a465-16ff-8283-29f0faa64d02@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0055.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::15) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|TY1PPFE6916CAC0:EE_
X-MS-Office365-Filtering-Correlation-Id: 36ce0dad-2825-44f1-0e89-08ddca8cf726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MFl3eG9SUXpwbmhTVGVvVW5jWldhRi9nSWlncTc2QlBheEc5SHBOSUJrRWdQ?=
 =?utf-8?B?bVZ5Q0Rpb0dHejY2bnNRcnQweTY1cnVxQXBmSURQSEJVMjBwdlVOMDc1SjNx?=
 =?utf-8?B?YXhiU2srTlIySDc1ak5zRHFlZGdXRzRiN3NaVk1SajcxSTh4V2VtSXIrOGxQ?=
 =?utf-8?B?Q1RjTklIbzFRUDc1VjdKV3h1VWRQUldRZVUwWW5pYllLMEZTTHdSeG1yS1No?=
 =?utf-8?B?bUxaSDJKeUs4VzN3c0ZhTmdCR3pQOFN6ck5PakNjbVhjalFuOFZVNkhXL0w1?=
 =?utf-8?B?NVcrVjE4c1lsdXpITlNsZURFMC9lY3VleVIxbWpDdGlFRTJRbVRsUzh0S1dh?=
 =?utf-8?B?OHJPaGMwNkNUOTI1Mk9IZjB1SzVaWEwvZ3lXUTN5enE2QVphbU1EajhpUDJI?=
 =?utf-8?B?R1p3K0x0bU9vZjI3S2tHdEhMQ0c2SWFsb3ZWb3B5ZE9QdEluOVJEWWdJd09r?=
 =?utf-8?B?VlVRTlRVMnFrNkRxMmF3TTRrNU14RU5lVnUwdXdVWHRpWVcyMjNTSDdyUTFI?=
 =?utf-8?B?U1BBMXlXM0FKSk5lNWpOb3J0eTlreFh3Rmo3ekkwWm5IZFZZSmowV0IwaWh3?=
 =?utf-8?B?WjE3amZ0MEQrYW9kMENObFFoN3BrUkJGU2s4bDZEYUpxM3paOTNoYTFTVEtC?=
 =?utf-8?B?VnNyYWlsWEQxUDJaN0VKZDZPQWQ2NWxzQWFXNlJvYlArYVdUdmhleDQ1dWFu?=
 =?utf-8?B?UCsyWUJrQ25temt5clM3b0hoV2NCZGVFZVR6elBBRGVJcUZBalVjN2pnbUph?=
 =?utf-8?B?em9nUkVpdlhiVWE5eldCNWhORHlaMW1qVmozQ3l2cGZjSyt5blhncnU3cE52?=
 =?utf-8?B?aU5JQkhZREVkN2IrN3k3emdoaEtZbWlKQ0ltUkxVRUhEN2U4RzJLMnNVOUZM?=
 =?utf-8?B?SjI2R3FaNWwwMVdFTzdPWEtGSEFWTm9od2ZFWTEvME11ZWFTSUlGSWhXSzFm?=
 =?utf-8?B?Q2RPVENiTUNHQ0ZnUmxIRFdpMDlTbXpuTkFTZVI2eWZCWUtqM1d0bi9NaGtP?=
 =?utf-8?B?UVVyVk9FU1VoUjRucVltaHE0Ylp4Q0JiS0JqRnBMSkJwRFZLdjkrTi9Qd0x6?=
 =?utf-8?B?SVhWUWw1MGMzVytvTmx4T1owak1IaUhreUZGQWtVK2FNNmVVL3FiSHJLREFy?=
 =?utf-8?B?TkROMXkyN3RuUTRHTmdKclVjYkVCSFFoVjVWQ3E2ZzlSUnY0K3lXUXJtL0lH?=
 =?utf-8?B?ajlkcXEyMm8rUDB6dWlRNzhBb01jeFZWVXRpQUg2cFJUdkpqZjhtdkdaVlo3?=
 =?utf-8?B?UnlDTmgySTFHdlZYa3Bjc3pOOEtGN2pIY3Z3b1pneWJ3UUIyT05BUHZ1aUFp?=
 =?utf-8?B?NVJZdGxFaXRCRTJSODJzWUlSRlZMcXArT1FrcEJqbUZtS0kvdVg4cmhHVGdJ?=
 =?utf-8?B?MVJkalg4RHpLQzRsZnllK0I0MXRIUkhWa0dpMUd5U1cwNW02Qnd4RERLL2tJ?=
 =?utf-8?B?ejFDT1RrNWlwM0t6R1d0alo1N0ZBcjA5QzNwMkl0dytDbU5CTnMvM2x5ZzlR?=
 =?utf-8?B?RXlHTzM1TFkrQVlOSEFPVjNCbVBEZXBwR2ZrVndubmh5K2pPVEk4THhhMU9D?=
 =?utf-8?B?aGg1M3lmU0xXeTJsRjNtMDRBN0QyaW52dzZSS1FGcStYSVRDOFlFNTB4a3NR?=
 =?utf-8?B?OTkxRmJDQzVZSGMrRDQxOGFtSHhkeEhlaWFPNEsyWXk3VkkwVHQxaDUzNEtv?=
 =?utf-8?B?emxFM2RxUVRXck1tVWlsUW1ZbnU5dTZKMVdPdllmUXhpR1dLNThQQzVSN0tj?=
 =?utf-8?B?cVUzNGdRQnZvVUgvWUZ1QVBwS1RWamcrMDBMeGdmMVh4bWpBcHc5dWxlOEE5?=
 =?utf-8?B?ZDFDcHphMk1DTDRka09BYjJubUt5UHBtcnhBQ3YrZUVsazJYSXNMYWt2QUhL?=
 =?utf-8?B?RGlYNmF0TUl1WmNYcWJReHN2ejN5VnZVaVpBckpuZ3pteXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amg0dTBGZ05jR2NtV2hGZFVWaXVDTXpqN0NQOVFpMEI1TDJHK05uOEVxODVi?=
 =?utf-8?B?VXBNV2lyZUZtTEdLZ1N3NkxYeWFMcHBaT1dLY0d0cndGV2VGaENRZ0pVNDZ1?=
 =?utf-8?B?RTNXcUhhZWJiTWVQd3RLNnhjM1BWamMwVHhtYStVSEJnYXNwbkJuYnN2MThF?=
 =?utf-8?B?b0IwQytVM0pPSkczbjkvVWw2OGx1dTRSL01qTzJ6ZTdUNXppa0R6SHBvZlFk?=
 =?utf-8?B?U1JJM3poSEVYM21hdW1Udjk1S0Q2NXhYYTZJdXdHQ01Na003aHVBVXpZNS9O?=
 =?utf-8?B?dGFEYXpLeUhiaFFsRm1wTnJLVUJNTkJVWjVFVlJrWGFzVkt5VitBQys4Y1U2?=
 =?utf-8?B?aTltU2czZkh5MkFMdjZRYlRwZFM1cStZcWxZM2pJL1h5RDNURW1kemJCRlVq?=
 =?utf-8?B?TTc4bW91M2d2RVVBcVpWeUNRYTFUeFVHS2hqVGFQUkRUd2NMM0kyYjlJT3I2?=
 =?utf-8?B?YlcrQVVCUFl1NEVvb1VKeHhqUGhwbkhFbEk4aldkMisvb1IvaFRNUlVEQXpT?=
 =?utf-8?B?Y1hyMElsa1JYdHQwS0M4TGp4Y2t2SG1tL2wwaXZ1NTV4Ry9aWk9xUDgzNHFm?=
 =?utf-8?B?SWtRdWVTTzZoc29qSVpUMlhZTFpUUnBjVS8xU0JXV3RSNE9hbXQ1T3lvRTJH?=
 =?utf-8?B?QjV0Z0U3RFpaNGFWWUhYbC9JMHI1YVJVRU9yNWtqOVVSUXFiR0wzOGthUGgy?=
 =?utf-8?B?ekd3WW5xcVZSQ0lHQzdCTGVRNENXZGFDb1NYZmwzajlRT0s4Y1N2blgrc2VC?=
 =?utf-8?B?NDZDNkI0N21FMGtmRkNjVjJ4NkIya1RYQTB1RXJPN1Z2NlRqSU51Z2lGVm8r?=
 =?utf-8?B?dHlRMVAxTno5cFRJZkF0cHAxNGdST1RPaVA2WGlEL3JDM0RjQmdEQjF2azA3?=
 =?utf-8?B?RFRwZnJHZk1Cb0Z4bXZzME1keTR2N2MzcmowcXR1QVlXSUdoM0g5anl3cU1h?=
 =?utf-8?B?NG43MldSU20yd2RRejJPUTJxZ01wV3lMZDhQeGlhMXZLamdKM0FiZmlMMmpz?=
 =?utf-8?B?YW5iRUZvbWQrRmhEdnhsQjNwak1iSnpDcS9VZVIydHB1UVV6WkZHa2d6Z1B4?=
 =?utf-8?B?VUQ3ekhwSGxUQ2cxZFY5dmtLRXg1NjFrVnRDdkRqUDFmaHpUbE1UVFlkVmtL?=
 =?utf-8?B?RUtwU0tyZDhGaUkxN2dXL1RhRVZLN2xpRmlIQmQ2YmhzQVprQkozUUJXL3Bj?=
 =?utf-8?B?WUg4UmFKZUhjclE5cEtKWitXMnFaMm91aVVET3J0STdVaEcwaG8wR3VxeWpD?=
 =?utf-8?B?V0pTNDlOdWZrSWc2RHVvMjlFaWgwMTFNY2tNU09rb2grWVhNaDNRN09ua3E3?=
 =?utf-8?B?WktjdVRmdDZKV1Exa28rVVVSbEVVdzJKVDgvTEhjVGUrWC8rbERUUmVWWkJ5?=
 =?utf-8?B?bXhHZ3NRYi94WDZaeUxnTXVseFBqODJqWWNYZkpZWkdmUnoxUUQ2UWV6d1Uw?=
 =?utf-8?B?cDBwcFZnbVpDVm5IN2EyNlJmc1JBOG9zUzJ6YU5IRElpZUREWXdrTmRHN2VW?=
 =?utf-8?B?VE9ORElJSnoya3RDdHNYNGVLdi9IUWdXNDhXR0QvN2hYeGlDVmlWNWVXUVQy?=
 =?utf-8?B?VzZzWWxzWEpZOFpHb2xDU1Y2RTFkU1BSVEFCc0p5YVVrVjNiT3lCU3FlV20r?=
 =?utf-8?B?K3VBZXVIc0t5YUkxOFgxc3hLMmNwTFlpcVhjQ1FuWm0vRGtacVFCMFBqMlMx?=
 =?utf-8?B?TktZR1cvU3g0RjYrNkQ2dVpVeGlJcElrYmZxWjIydGV0and2NEhMSHJ0bGVs?=
 =?utf-8?B?T21pMGpxTGdNM0tTdCtLT2hiMi9oaHg2MDc4ZEtLdUhxZVhKVWJ2SGIvQmcw?=
 =?utf-8?B?ZFdDajlwSGRWRG1lRVg0aGRacVczOGN6T0gyZU44a0FwNi9SVlh2OFVMTFVZ?=
 =?utf-8?B?b1NGQUlvT2hmQ0gwZHd1aU4wVm1RTFAraWkwUEVCVlhFelR3T0E2R2dtcDE1?=
 =?utf-8?B?UVhPblJqRjVjNmc5QWVadlZUUjVXUmVNeDN5a1N1Z3lGOENZeFFGZERtUWk4?=
 =?utf-8?B?MnVoSkJqMGwxeE44MExaclRkcllmc1YxdjRsK1pTQ3pkcEVpK0RYdGYzR29m?=
 =?utf-8?B?WWJGL00reGJtcHJVODh0KzVaVlFxNHU0ZTdRT1lPdExnNW9Ua0syazBxUmlo?=
 =?utf-8?B?eFdUSU5zUjlxWlZtYVBYSnRua29vNnNmdmlFSU1aUnl2OEJyS2ozRHUwS3k1?=
 =?utf-8?B?RUE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 36ce0dad-2825-44f1-0e89-08ddca8cf726
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 08:34:55.2450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KJ0eMqGkiPcCj/Rt6w4V9yYZrgigy6KSCLSgT9+zTzztYdPThz88TqetzGvmd2xUFrd72glUqeQOzz2Iy8fx1Ul4kx63Vzp4mvIqPtsiQJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPFE6916CAC0

Hi Ilpo,

Thanks for the thorough review, and sorry for the basic issues.

On 7/21/2025 9:56 PM, Ilpo Jarvinen wrote:
> On Tue, 15 Jul 2025, Yen-Chi Huang wrote:
> 
>> +static const struct pwec_data pwec_board_data_nano = {
>> +	.hwmon_in_data = pwec_nano_hwmon_in,
>> +	.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
>> +	.hwmon_temp_data = pwec_nano_hwmon_temp,
>> +	.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
>> +	.hwmon_info = pwec_nano_hwmon_info
> 
> Please add comma to any that is not a real terminator so that a future 
> changes won't need to add the comma if more fields get added.

Will fix in patch v3.

>>  static const struct dmi_system_id pwec_dmi_table[] = {
>>  	{
>>  		.ident = "NANO-6064 series",
>>  		.matches = {
>>  			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
>>  		},
>> +		.driver_data = (void *)&pwec_board_data_nano,
> 
> Casting a pointer to void * is not required.

`pwec_board_data_nano` is declared `const`, so dropping the cast produces:

	warning: initialization discards 'const' qualifier from pointer target type

Hence the explicit `(void *)` cast is needed to avoid the warning while
keeping the data read-only.

>> +		old_msb = pwec_read(lsb_reg+1);
> 
> Please add spaces around + as per the coding style guidance.
> 
>> +		lsb = pwec_read(lsb_reg);
>> +		msb = pwec_read(lsb_reg+1);
> 
> Ditto.

Will fix in patch v3.

>> +	switch (type) {
>> +	case hwmon_temp:
>> +		if (channel < d->hwmon_temp_num)
>> +			return 0444;
>> +		break;
> 
> I'd suggest you change these to:
> 
> 		return channel < d->hwmon_temp_num ? 0444 : 0;
> 
>> +	case hwmon_in:
>> +		if (channel < d->hwmon_in_num)
>> +			return 0444;
>> +		break;
>> +	default:
>> +		break;
> 
> ...and this to direct return 0; to simplify the code flow.

Will update as suggested in patch v3.

>> +	switch (type) {
>> +	case hwmon_temp:
>> +		if (channel < data->hwmon_temp_num) {
>> +			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;
> 
> There might have been some problem in preparing this series as literal 
> 1000 is still there despite your cover letter suggesting it was changed?
> 
> Please check the other expected changes as well, on a glance they seemed 
> to be in place but it has been a while since I've looked on this patch.

Will replace the literal with `MILLIDEGREE_PER_DEGREE` from
`<linux/units.h>` and double-check all other expected changes in v3.

Best regards,
Yen-Chi Huang


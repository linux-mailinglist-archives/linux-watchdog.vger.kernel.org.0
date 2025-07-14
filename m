Return-Path: <linux-watchdog+bounces-3860-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5341EB03C9B
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 12:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0AE7161B26
	for <lists+linux-watchdog@lfdr.de>; Mon, 14 Jul 2025 10:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E54852417F8;
	Mon, 14 Jul 2025 10:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="I44LpH3d"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023127.outbound.protection.outlook.com [40.107.44.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEE624502D;
	Mon, 14 Jul 2025 10:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752490336; cv=fail; b=Eu7m8P5zH4hZs8XP579mgJJ+aHDuluy5kUwXHmnrgQgPSXnXq+FJaNyxxL8aHc5RrtrP2PTv3z1jgenr3+xaFnke1YQASV4TvV02U2SyG6OAh2bHRsQOzyDRW94sj5RPQupywtEorDxSMH9pY4sjftAFCsstYecwpCl3qQ2QJNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752490336; c=relaxed/simple;
	bh=w24qVf2FrvvmsSC3bAhBxTY7XcwpKm8W1mSuJ0bkDxc=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=Jc6wXzxvMznrZEOrOnRYRpSanpJMozVX3tSQ8uIYpseTLugD84MfvELacikV7AMJBl9TSNY9xHT6aNPuYbjgjp8c1NbP0mVIhZhRF7uc8M4Az1wqlb4fgOt0AMIu1617UGAuO46cnsNV62Ln3/VFQ4BE19lEhMkLf7EJECT+2aQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=I44LpH3d; arc=fail smtp.client-ip=40.107.44.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWP2Bj3W/TaT2gwEyMOSDQ2md5X37wAftKq1z/YYOXr7phM8ZGjdvDLz9Ub4coG/61TXAlasKCp7RLunwZT7lKGi7RmbWF0nA9rtaGixKAgww8pkX0yuc3JpRNutwt5e1jVB4j6cvgROzkWoNy8ZhT/FNMOEv8h8dGkGSpkA9yJ0lgi2RWGiEiM9XoyPmMQWe5AH9JH1VfmtJbBJd807Wse+Mn0TXQCMr8A4ojOHAy059dmif23/XOhwScM+U4rij+UYuWW0+SA++pmA2nL6wnlGwNbBrV8hR3+5h33Th2EDUkT7mq9qBgOQ9fiqRj7tqGJZWxLPNWTOBjuKznabQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSgCHhds5Yn8cxsZqCRrXw+3++IH9zJdZGX16cQl38U=;
 b=r4nvoizgJZTZ4WEZqUmITLVLEfFCmI12yjBeffETv/FT/4xduNRZdbeBFczMgyeYbuw3T0kmQ3znuqbEn6eQP4rHWvBtLgKKkFPnbEz9zWZKetdmd599A4lvVdJE7hmMTJIObDhSxugn5nLkYaTOWKQJ965yAB2DBjJvWMEInUBXdngyEFQnLF5uWsIOHo2hUcQT1qmIEZFtopjrQESU23fIX7vvobtgV94ibHA0+DmftKt61PBd3u9Nx6CKuGKbpSyoxw1c3TPVSPMrE3x6HXG1udZGvijdENSvNYMgOLtbyfTLDfxCXjKkiIsJ8occ5CF4F+DUv7djmsxNubLwCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSgCHhds5Yn8cxsZqCRrXw+3++IH9zJdZGX16cQl38U=;
 b=I44LpH3dSxew2t2DiiPOSKVSQ2XQXD+I2ID96kdQCokqeApq9ASuenDPZcom0QnOuK5Q/si5uZ2O753NGXhLghEkEk3F7gpIdtqJMcDj6kyDemyW3EI681MIvIu33sCW5PeL9GghNcFfjG3oHE+LxdcafKpDDrpJm4d7+DWbHHtrliP7JoXArrsVGvPnKSNr0kUvUyrD/yYokpSLxuIttYXN1/CYD1tt6NxMuvfxvwzQwpGneYlM/DtY8ptuenBDXiUWC+Qt2C0QbHfEfjBV94HfPSjrmkrnCiBcK5G3hX7nF4ZelkfPEi0l1f5z+LzuntyGv4kKI7Ad6hPmLMZ7BQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by JH0PR06MB7293.apcprd06.prod.outlook.com (2603:1096:990:a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 10:52:09 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%4]) with mapi id 15.20.8922.028; Mon, 14 Jul 2025
 10:52:09 +0000
Message-ID: <a07d8764-ee23-4d21-a7b5-121cb8a576b9@portwell.com.tw>
Date: Mon, 14 Jul 2025 18:52:05 +0800
User-Agent: Mozilla Thunderbird
From: Yen-Chi Huang <jesse.huang@portwell.com.tw>
Subject: [PATCH v2 0/2] platform/x86: portwell-ec: Add watchdog suspend/resume
 and hwmon
To: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net, wim@linux-watchdog.org
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
 jay.chen@canonical.com, jesse.huang@portwell.com.tw
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0010.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:9::19) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|JH0PR06MB7293:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7aa7bf-4ea5-4c25-c846-08ddc2c47b06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T1BIOS9zOUxOQkVaTytzWm1VVHR1anJTQUNRbXA1eDZCS1lHVDR1SE4yd0Nn?=
 =?utf-8?B?TUNVZnNjT0hhN2FFc1FkQUdWdzVhK1UzZlkrYnpUMmlEU0svWjB6K0dGeHlK?=
 =?utf-8?B?VEIzSnlzK3RPSll3U0hhbGZlK3lQK3hCTGQ4R2xpczNZNnc4dFk2L3lqS0tX?=
 =?utf-8?B?VVhrY05wTmNLM09yUEFkSEIxZGJjYjdlM1RuNGwyV2tkL3Rqa05EWGlpQkJ0?=
 =?utf-8?B?NlNuOWo1cnQ5OUQxSkdwZVB5dEhtS0dabzhIYlZVdjNpcmtML1pUbC9JQzh4?=
 =?utf-8?B?dVp5T1l0Q2tOV3YwdEhiV2xYNmNPRGhsbnRFa09NUTlhRlZZUHNJVVpSS0ZD?=
 =?utf-8?B?ZzBSYzlKektqVzJsSzBWVHkrU0ZPQzFZUHNoTUZWenVLK0ROajVaZ2V1aEVw?=
 =?utf-8?B?b2NEd1M2aGJhc203SlJQZTg3WDVwL3RWV1VCejFaZkUyNXFkam83b0hEYjBS?=
 =?utf-8?B?YTJvZWllcUxBa0wrSUxEYVVtU0FqY2g1ZXMrSDlIMDVsU2RRYkpMOTNTeXI1?=
 =?utf-8?B?SzR0b2JiWTM3WHVQckIvTi9SM3JrSFFUdzRRazgzd21LR2hWL0pZWWRoNm93?=
 =?utf-8?B?WXRqZFFQbzdpL0t6QmRFSlJRSHdRbTcvTytBRWhySTR1dDhrWjJ6YTdhbDZ5?=
 =?utf-8?B?OS9sd3JqSlJpUTBXYlFyZGtiL09wdFpaMldXbGdwNUZoTjBZRHVvKy9zSWt4?=
 =?utf-8?B?ZGMzVVNnOE5vMS9LV0xSWnB6Um1YOTZCY2NJbXc5cXlkUVcrc2xGc1Zab1Nt?=
 =?utf-8?B?dzFTMFpubE90M3dMWXh1dVBFS2tyYUNsbDh1bWJFK2M2TUh4R0ZocS93L3k3?=
 =?utf-8?B?Y3FLMERqdWkrbWoxSE01aWt6c1JoVmpBa0l3Zjd1YmxjTXcvQ3VFTXdndnI0?=
 =?utf-8?B?ekppWkZUSjV0T2E3NVMxcVF0dTI3RThjVktMN0ZidDZXaENWVXFsNFZGeUlK?=
 =?utf-8?B?c1huRkduQjVsWHVpSFEwU3h0WTJ0bG9iR2cwRjJabldYR3Y3TWVNSXNTaThu?=
 =?utf-8?B?bzM2dFcvTmplOXRnWXh4M1o3cnNxY2RVa0pXR2haVVo4ZDcxVlVXbzlVN3pn?=
 =?utf-8?B?akYwTmtFbEE0cUNlNHRKMy9EWHFia0VYM1J2SGhIdXRrMnRVcSs4bEhaK1JY?=
 =?utf-8?B?eUkxLy9CTjRweERLV2tIS3pPdVpucE5lVDNwQXk2NXI1YVYvT0FBUjB4b3VF?=
 =?utf-8?B?QkRJYUw3TGJuOGIrTFo1SnQzYzBOc2dxY1BlNFBZZWFuUjYwOVA0TWxkUktE?=
 =?utf-8?B?TkV5YnRodGgrVGFDR1BRQWFKcW1qNjJxVC9kRU5Na0JKc1BkeEtSS0FOVDEv?=
 =?utf-8?B?Tmt0VnVOdkhESHhENXlxM3ZBbXQrQnN3NG1tbzVPdm1EcFpqOVRFUWFIRjhB?=
 =?utf-8?B?ZjJqY1FqdHlhaHJTV21mZWNUVjRuYk9iNUd4VFN0TUNmZmFBVFpWbWcxbFZp?=
 =?utf-8?B?WWc4RTcwNDlYVXg1QXFLRWFRZ3BjbU55ZUM4VnhHelpNWE9QQ3JzSS9MV1Zv?=
 =?utf-8?B?ZFBrdEpmK3F2TEFpdS95emRnRVNXMDk4Y2pJdXZzQnU0bXl2Z0Q0U2tpNUti?=
 =?utf-8?B?RU5LOEdWaE5sWWZxQ2NycVVHcWlDUnppOXBFQXBpaW5iRTBxZ256djRsRkdR?=
 =?utf-8?B?b2ZnK0hMR1pUVDBZR2dnbTE4WXViVTlHSzhFOUFVOXNzbWNBemFqUnIwMnEx?=
 =?utf-8?B?TU03eXpWTDVhYk4xUzBQZWxicVFOcmNydlNZa3pDS2JlelBLamlVSjlkNUJC?=
 =?utf-8?B?OTZBMWRROTNmYmRIKy9VSmlrNVF2Mm1KbjFEa0diNkhNNkVtT0RicmhLb29K?=
 =?utf-8?B?Q2FoQWVRYW9XMHdCTjNScEdkM3I5UjlSVEIzeDRlSWY4RjN6WTJUYXJHUEZX?=
 =?utf-8?B?ZHc2ZENiN1ZOZG1SN1BkcDJmTWlWVklmdjBGa2dJS1Awcmc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXY1djVBWkF5bmNMQXV1MmhsOXhTM24vY2hORFJwYUVaRUVXSG1zYW5rNG9R?=
 =?utf-8?B?WmNONUhoelJ2TVM5MDZVejI2NWFtS3R6bi8vYTNIUENlamlQY2w3b3ltTDVE?=
 =?utf-8?B?bjNzMHdvVUFrcWo1Z2owYTdFYWxORjdtRzFUbHRKOHBiMjVlWkUrUGY4OERa?=
 =?utf-8?B?bWVGS1lWODVxMHdJS1cwNmlaa21TOHhkT2I4dVl2NmphSWR6WU0zUWwvalVG?=
 =?utf-8?B?cjZPQ1VvQmFaaHhKcTFiZFFXUzlGdTIxWDJKNzd1RjIrMUd6b3ZvTm03cSt0?=
 =?utf-8?B?aGF2by9yQ3AwYlhaMTR3SE52VEpySEQ3UzZ5RDJTY0MyV2VTQzFpQ3pabkN5?=
 =?utf-8?B?WGRlelczYS9HSWpSSUgzR3VNQkFCUGw5YWhTbXkvODN2a201cktERDN5ZE1V?=
 =?utf-8?B?VnBoK3dWQ2ppSFhtR2laWjJORDRzbm1DNVc2RHNaTVZsc2NhaDZ5eEhzSk5x?=
 =?utf-8?B?RTUvRUlFTkJBbGZXN2pZMWhTcUJ0OWh3WnNGancyU1o4Q2FMbHl3VFVucys1?=
 =?utf-8?B?NWNsK3paRGNZd2tudGJTbDNGdVA5S3BJN2JRSHFjU2Z3NVR3WWt2Q2F0cWR6?=
 =?utf-8?B?MkRiY2MvUkFZbVVhbTdZZ3ZTQ2IrZkVSUXJMRGttb2w5TEY0SDNpenNaTklv?=
 =?utf-8?B?aHhaVGVGUU9ndDBHdmJRaVNaWHZxc21Odmc1SXdTYThNZTVYZVFjQVJWd0VI?=
 =?utf-8?B?dWhKS2xRcURIOHRPT3EyZzFaeDJ5VVdIa1dTT0hrUCtaVkNzQ1FTMmhBazUy?=
 =?utf-8?B?YThWTjROSTdha1dFbEJnMHhMY2hRaGVFQ3Q3Y1VTR0xuNXorTUEwWWpkTS9I?=
 =?utf-8?B?ci8zZ2RIVklFNEZ5K2ZXcWNQM080dWJyaHFOemVsVGw4KzJvRHhudzAybzli?=
 =?utf-8?B?NElMbFJPcFpVT0ppM1RLUmVPcDRycTBnazdtODNxamdHNzFNNm5nNklOQU5r?=
 =?utf-8?B?b0NNMmUzbkRPYUZ3dlB6RlBpUit0RTVyYkpnKys3VDhvcGZkdzhpMGdCejlp?=
 =?utf-8?B?ZzVQTmtQS0tEZVNCeG85R3A5VTV3V0E1RVBCMGUrYTZNSHFPUEFHeUEzVUVr?=
 =?utf-8?B?NUpMNHYrSVRHcldubFZRTlB3c1lFd1paYXBsa3lVaFpPNkcvTlBYQmE4RGpo?=
 =?utf-8?B?RFFTMmpqYXVIRkdkY0RNS0NSSjlFQ2VDd2swVUdYcCtaSG1lelkyOEZkVEho?=
 =?utf-8?B?UzhoRmRDUHJmMWxPQ3VybWRGOEdxVzkyUUVndGM0SFJZVXVWK2RkTklzMVpw?=
 =?utf-8?B?QTdrRUtSKzB0WnZKZU9QZWx1L1gyOG1zN25jVnQraXZGQXNMcHFlSTIwdFJt?=
 =?utf-8?B?ZHFFZG5QbFljZHpZMktzL0srQmRwemJIM3BueUpuVXA0WWJoMEJFL0JYT2d2?=
 =?utf-8?B?ZjI2K09EYnRlTitLM0VOa3cwRCsrSFNqWjZEWmxBUFMyY2VLbksyZG5SL0xk?=
 =?utf-8?B?cTQxUzNNWHBGYkxRT1c2dzhKYnBGd1h4cEV1MHcwUkhWeGdPK2ZYakZVaDVB?=
 =?utf-8?B?R0t1cGJXb2d6dEJjb3Y4eEFyT0FxQVduOFlMdlFqRHZIQUJ4R1lrM1RIZ3hh?=
 =?utf-8?B?YVJwdUtyR0pQUmx1YTB6OE0wdkJUaFR5LzRGUFUxazNONzNsbHNheGthNENm?=
 =?utf-8?B?bHNJa2s4UmRwWUlYZmc3TC9EZ3ZoUkRZZW1ydWxBRnJrZUcrS0FPNG5iSVRE?=
 =?utf-8?B?WjZTbWlTcXpFL2VMQ2EzaDFTaWsyNTlwYmxzeU9jM0pJUG1rWHphejVWTU55?=
 =?utf-8?B?bGVEUURMVS9hRklDSkgya2RhaEN3akFOODlEd0RRN2tXanFwVVkvd3g2aVlU?=
 =?utf-8?B?aWR3VW5ROXhyS2dTQml0VmN0K0w0V1dEb29DVDZ0TDRqS2dMNURMWmJ3WWh2?=
 =?utf-8?B?REdzNEF3QVJPS1BQS3NhYkNVcllDR0RwcHNVY24xd0dpdnAzS2lER0pNRUFv?=
 =?utf-8?B?R0psS0kxVm1jZTBjVGNaQkRrdVBza3N1RDZrVkhMeWtUWjBnbVF1dDNJam51?=
 =?utf-8?B?WEFjZ1RaSzVFdzVKMmc5RVZUR3piVXZrU2pjWXgzandNSzdIRWV5dE0xV2J2?=
 =?utf-8?B?SUNHci9QTUtOdUJlQURYRGNodkhhRFlBUzFMdDdZbURxUjRWUmVCSjErOVBn?=
 =?utf-8?B?bURUR1NnZG83N1NyVGJMYURSYklob2lodzdma3Fod3crc0FQSFVuc1BaM2Mv?=
 =?utf-8?B?dUE9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7aa7bf-4ea5-4c25-c846-08ddc2c47b06
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 10:52:09.2724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LrtHk1s7TblfZKs4ZFiQ6sYkLeWpi8Bzg/pk99y44IPHEn2VjkFNbhv2Xrw+Y8f80sf7cTPtSOKKEhQpWroIkt9vAjcU4lMXY0J4E+D3sI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7293

Add suspend/resume support for watchdog and hwmon monitoring functionality
to the Portwell EC driver, enabling better power management and sensor
reporting.

Tested on Portwell NANO-6064.

--
V2:

- Added watchdog mailing list to Cc.

Patch 1/2:
  - unchanged

Patch 2/2:
  - Removed `msb_reg` from `struct pwec_hwmon_data`
  - Updated `pwec_read16_stable()` to assume MSB follows LSB
  - Moved `hwmon_channel_info` to per-board data and assigned it to `.info` at runtime
  - Replaced the `pwec_board_data[]` array with a standalone struct
  - Replaced literal `1000` with `MILLIDEGREE_PER_DEGREE`
  - Removed unused include and sorted header includes

Yen-Chi Huang (2):
  platform/x86: portwell-ec: Add suspend/resume support for watchdog
  platform/x86: portwell-ec: Add hwmon support for voltage and temperature

 drivers/platform/x86/portwell-ec.c | 196 ++++++++++++++++++++++++++++-
 1 file changed, 194 insertions(+), 2 deletions(-)

-- 
2.34.1

